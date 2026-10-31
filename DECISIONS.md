# Lumra-Web: Architecture Decision Records (ADRs)

> **Document Status:** Architectural Decisions & Governance (Draft)  
> **Author:** Systems Architecture Team  
> **Target Audience:** Project Founder, Core Engineers  

---

## 1. Architectural Decision Records (ADRs)

### ADR-001: Typst as Primary UI & Layout Language
* **Context:** Most web frameworks use HTML/CSS/JavaScript or compile down to DOM representations. The founder's vision is to pioneer an alternative web standard based on Typst and Rust.
* **Decision:** Typst (`.typ`) will be the primary and only authoring language for UI composition, typography, and page layout in Lumra-Web. We will not emit HTML or CSS.
* **Alternatives Considered:**
  1. *HTML/CSS with Typst-like syntax:* Defeats the vision and inherits the CSS Box Model's flaws.
  2. *Compile Typst to SVG + JavaScript for standard browsers:* Keeps browser compatibility, but SVG is not an ideal interactive document format and relies on the JavaScript ecosystem.
* **Consequences:**
  - **Pros:** Unmatched typography, built-in mathematical notation, fast compilation (sub-20ms), clean human-readable code.
  - **Cons:** Standard web browsers cannot render `.typ` natively without a custom runtime engine or WebAssembly layer.

---

### ADR-002: Dual-Phase Interaction Model
* **Context:** Typst is a functional compiler designed to transform text and markup into fixed layout frames. It possesses no built-in concept of an event loop, mutable DOM state, or event listeners (`onClick`, `onInput`).
* **Decision:** We adopt a **Dual-Phase Interaction Model**:
  1. **Phase 1 (Micro-Interactions):** Cursor changes, link hover highlights, text selection, and active input focus are handled client-side by the runtime compositor (e.g. `MyLumra` / `egui`) without invoking the Typst compiler.
  2. **Phase 2 (Macro-Interactions):** Clicks on interactive buttons and form submissions emit semantic actions (via `lumra-action://` or `#metadata()`). The Rust runtime intercepts the action, mutates the state dictionary, and triggers an in-memory re-compilation of the Typst document with updated `sys.inputs`.
* **Alternatives Considered:**
  1. *Forking Typst to add a JavaScript/Lua scripting engine:* Enormous maintenance burden and breaks compatibility with the standard Typst package ecosystem.
  2. *Re-compiling on every mouse movement:* Causes unnecessary CPU thrashing.
* **Consequences:**
  - **Pros:** Keeps the Typst compiler completely standard and clean; leverages Typst's memoized speed (~5-15ms) for state updates.
  - **Cons:** Requires a clear boundary between client-side transient visual state and document-level application state.

---

### ADR-003: Rendering Pipeline Strategy
* **Context:** We need to present Typst layout frames to the user with high visual fidelity and interactive responsiveness.
* **Decision:**
  - **Near-Term (Milestones 1–4):** Software rasterization using `typst-render` and `tiny-skia` at 2x Retina resolution, uploaded into an interactive texture within `egui`.
  - **Long-Term (Milestone 5+):** Direct GPU vector path rendering using `vello` or `wgpu` to achieve 120 FPS buttery smooth scrolling with minimal GPU texture memory.
* **Alternatives Considered:**
  1. *PDF rendering via PDFium:* Slower, high memory footprint, loses Typst semantic metadata.
  2. *Immediate SVG rendering:* Heavy DOM overhead and poor caching for large continuous documents.
* **Consequences:**
  - **Pros:** Immediate high-DPI crispness and correct font hinting on all desktop platforms today.
  - **Cons:** Raster textures consume RAM for very tall continuous pages until tiled rendering or GPU vector paths are implemented.

---

### ADR-004: Native Compositor Overlay for Form Controls
* **Context:** Rendering interactive text inputs (with blinking carats, text selection, IME composition for Thai/CJK, clipboard paste, and keyboard shortcuts) purely inside a static rasterized Typst page is complex and error-prone.
* **Decision:** Form inputs (text boxes, checkboxes) will be declared semantically in Typst using macros that emit placeholder geometry and metadata. The Rust runtime compositor (`MyLumra`) extracts the widget's bounding box and overlays a native interactive input widget at that exact screen location.
* **Alternatives Considered:**
  1. *Re-compiling Typst on every single keystroke:* Unacceptable typing latency (10–30ms per keypress) and destroys IME composition state.
  2. *Custom software text editor drawn on canvas:* Reinvents the wheel and introduces cross-platform clipboard/IME bugs.
* **Consequences:**
  - **Pros:** Perfect native OS text input, zero typing lag, full IME support for Thai, Chinese, and Japanese.
  - **Cons:** Requires synchronizing overlay widget positions during fast window resizing and scrolling.

---

## 2. Unresolved Questions Requiring Founder Approval

Before proceeding with framework implementation code, the following architectural choices require your explicit direction:

### Question 1: Action Protocol Format in Typst
How should developers declare interactive button actions in Typst?
* **Option A (URL Action Protocol - Recommended for MVP):** Use standard Typst `#link("lumra-action://counter/increment")[ + ]`. Simple, works with standard Typst compiler today without custom plugins, and is already extractable via `FrameItem::Link`.
* **Option B (Metadata Tags):** Use `#metadata((action: "increment", payload: ()))` combined with a label `#label("interactive")`. Requires custom frame metadata traversal.
* **Option C (Custom Macro DSL):** `#button(on-click: "increment")[ + ]` which internally wraps Option A or B.

### Question 2: Repository Topology & Subsystem Boundaries
How should the `Lumra-Web` repository be structured moving forward?
* **Option A (Monorepo - Recommended):** The `lumra-web` repository contains:
  - `crates/lumra-core`: Shared Rust library (action parser, World manager, event types).
  - `crates/lumra-cli`: Dev server (`lumra serve`) and build tool.
  - `packages/lumra-web`: The Typst component library.
* **Option B (Multi-Repo):** `Lumra-Web` remains purely a Typst package, and a new repo `Lumra-Engine` / `Lumra-CLI` is created for Rust binaries.

### Question 3: Form Input Overlay vs Pure Canvas
Do you approve the **Native Compositor Overlay** approach (ADR-004) for text input boxes and form fields, where `MyLumra` overlays interactive `egui` input fields over Typst bounding boxes?

### Question 4: Client Target Scope
Is `MyLumra` the **sole target runtime** for Lumra-Web, or should we design the architecture to allow a future WebAssembly fallback (e.g. running the Typst compiler and renderer inside standard web browsers via WASM + Canvas)?
