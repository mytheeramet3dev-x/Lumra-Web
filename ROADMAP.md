# Lumra-Web: Engineering Roadmap

> **Document Status:** Planning (Draft)  
> **Approach:** Incremental, Testable, Verifiable Milestones  
> **Core Principle:** A single working interactive page before multi-page routing.  

---

## 1. Overview of Milestones

```text
Milestone 0: Architecture & Foundation (Current)
     │
     ▼
Milestone 1: The Interactive Link & Action Protocol (Single-Page MVP)
     │
     ▼
Milestone 2: The Lumra Dev Server & Hot-Reload (`lumra serve`)
     │
     ▼
Milestone 3: Form Controls & Text Entry Overlay
     │
     ▼
Milestone 4: Multi-Page Routing & Navigation Engine
     │
     ▼
Milestone 5: Production Bundling & Vector Engine Optimization
```

---

## Milestone 0: Architecture & Foundations (Current)
* **Goal:** Establish clear project boundaries, verify existing capabilities, and align on technical decisions.
* **Deliverables:**
  - `VISION.md`, `ARCHITECTURE.md`, `ROADMAP.md`, `DECISIONS.md`.
  - Inspection of `MyLumra` browser integration points.
* **Acceptance Criteria:**
  - [x] All 4 architecture documents approved by founder.
  - [x] Clear demarcation between existing code and proposed code.

---

## Milestone 1: The Interactive Action Protocol (Single-Page MVP)
* **Goal:** Prove end-to-end bi-directional interactivity between Typst and Rust on a **single working page** without web bloat.
* **Scope:**
  - Create the `lumra-action://<action_name>?<params>` protocol in Typst and Rust.
  - Typst macro `#action-btn(name: "increment", label: "Click Me")`.
  - In `MyLumra` / Rust runtime:
    - Detect clicks on `lumra-action://` URLs.
    - Intercept navigation and route to an in-memory `ActionDispatcher`.
    - Mutate in-memory page state (e.g. `count += 1`).
    - Re-compile the page in-memory passing `sys.inputs.at("count")`.
* **Acceptance Criteria:**
  1. A sample page `examples/counter.typ` containing an interactive counter.
  2. Clicking `[ + ]` increments the number on screen in less than 25 milliseconds.
  3. No screen flicker, no full-window reconstruction, and no JavaScript involved.

---

## Milestone 2: Lumra Dev Server & Live Compilation (`lumra serve`)
* **Goal:** Deliver a modern developer experience with instant feedback during local authoring.
* **Scope:**
  - Create a new Rust CLI crate `lumra-cli` (or `lumra-server`).
  - Implement `lumra serve <directory>`:
    - HTTP server (using `axum`) serving `.typ` files and assets.
    - File system watcher (using `notify`) observing `.typ` and asset changes.
    - WebSocket server pushing live reload / compilation notifications.
  - In `MyLumra` browser:
    - Connect to the dev server's WebSocket when viewing `lumra://localhost` or `http://localhost`.
    - Auto-refresh and re-render within memory on file save.
* **Acceptance Criteria:**
  1. Running `lumra serve .` starts a local server on port 3000.
  2. Saving changes in `examples/landing.typ` updates the view in MyLumra in under 100 milliseconds.
  3. Server logs compilation errors with clear file paths and line numbers.

---

## Milestone 3: Form Controls & Text Entry Overlay
* **Goal:** Allow user input (text typing, checkboxes, dropdowns) within Typst layouts.
* **Scope:**
  - Define semantic widget macros in `lumra-web`:
    - `#text-input(id: "username", placeholder: "Your Name", value: "")`
    - `#checkbox(id: "subscribe", checked: false, label: "Subscribe")`
  - Tag widgets with `#metadata((kind: "text-input", id: ...))` in Typst frames.
  - Semantic extractor reads widget bounding boxes in the Frame tree.
  - Runtime compositor overlays native egui interactive text edit widgets precisely over the Typst frame coordinates.
  - Form submission action collects all input values and sends them to the Rust backend.
* **Acceptance Criteria:**
  1. A sample page `examples/contact_form.typ` with a text input and submit button.
  2. User can click into the input box, type characters with full cursor/selection support, and click Submit.
  3. Submitted data is reflected back into the Typst layout upon completion.

---

## Milestone 4: Multi-Page Routing & Navigation Engine
* **Goal:** Transform single-page documents into full multi-page websites with client-side routing.
* **Scope:**
  - File-based routing convention:
    - `pages/index.typ` -> `/`
    - `pages/about.typ` -> `/about`
    - `pages/posts/[slug].typ` -> `/posts/:slug`
  - URL parameter resolution: inject route parameters via `sys.inputs.at("route-params")`.
  - Browser History Stack integration: Back (`Cmd+[` / `Alt+Left`), Forward, and Refresh.
* **Acceptance Criteria:**
  1. A multi-page site running in `MyLumra`.
  2. Clicking internal links transitions between pages smoothly without reloading fonts or destroying memory cache.
  3. History Back/Forward navigates between pages correctly.

---

## Milestone 5: Production Bundler & Self-Contained Distribution
* **Goal:** Enable packaging and deployment of Typst websites for production serving.
* **Scope:**
  - Implement `lumra build`:
    - Bundles all required fonts, Typst packages, and media assets into a single optimized distribution archive.
    - Pre-validates all routes and checks for broken links.
  - Production server mode with static asset caching, Gzip/Brotli compression, and multi-threaded request handling.
* **Acceptance Criteria:**
  1. `lumra build` outputs a standalone `dist/` directory.
  2. The site can be served headlessly in production with zero external dependencies.
