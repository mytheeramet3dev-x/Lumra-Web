# Lumra-Web: Vision & Philosophy

> **Document Status:** Architectural Proposal (Draft)  
> **Author:** Systems Architecture Team  
> **Target Audience:** Project Founder, Core Maintainers, Systems Contributors  

---

## 1. Executive Summary

**Lumra-Web** is a Typst-native web development framework and runtime architecture designed to challenge the 30-year-old hegemony of the HTML/CSS/JavaScript stack.

Instead of treating the web as a loose collection of HTML DOM nodes, cascading CSS rules, and JavaScript bundle bloat, Lumra-Web envisions the web as a **typeset, mathematically precise, document-first, and interactive medium**. Typst serves as the primary authoring and UI description language, while high-performance Rust powers the compilation engine, interaction runtime, and backend services.

---

## 2. The Core Problem: Web Bloat and the Document Paradox

The modern World Wide Web was conceived to share academic and scientific documents (CERN, 1989). Over three decades, the stack was retrofitted with ad-hoc solutions:
1. **The Box Model & CSS Fragility:** Achieving pixel-perfect, magazine-grade layouts requires complex workarounds (Flexbox hacks, grid calibrations, subpixel rounding bugs across browser engines).
2. **Typography as an Afterthought:** True mathematical typesetting, ligatures, hyphenation, and microtypography are severely compromised on the web. Displaying complex math requires megabytes of JavaScript (MathJax, KaTeX), degrading performance.
3. **Tooling & Dependency Fatigue:** Building even a moderate web page now demands an intimidating toolchain: Node.js, npm/pnpm, TypeScript, Webpack/Vite, PostCSS, Tailwind, and hydration runtimes.
4. **Performance & Memory Footprint:** Modern web browsers consume gigabytes of RAM to maintain complex DOM trees and garbage-collected runtimes.

Yet, a vast portion of the web consists of **content-driven experiences**: technical documentation, research papers, engineering blogs, dashboard reports, analytical whitepapers, and knowledge bases. For these domains, HTML is the wrong abstraction.

---

## 3. What Lumra-Web Is

* **A Typst-Native Web Framework:** A declarative component and layout ecosystem where developers write pure Typst (`.typ`) to define user interfaces, layout, typography, and styling.
* **A Rust-Driven Systems Architecture:** A framework engineered in Rust that leverages Typst’s blazing-fast compilation speed (5–20 ms), memory safety, and native layout engine.
* **The Web Companion to MyLumra:** The official framework for building websites, applications, and documents intended to be browsed and executed within the Lumra ecosystem (such as the `MyLumra` browser).
* **A Document-First Web Paradigm:** An architecture prioritizing typographic beauty, continuous and paged readability, vector sharpness at any scale, and native mathematical typesetting.

---

## 4. What Lumra-Web Is NOT

To maintain technical integrity and focus, we explicitly define non-goals:

* **NOT an HTML/CSS Transpiler:** Lumra-Web does not compile Typst down into standard HTML, CSS, and React bundles for Chromium or Safari. Doing so would inherit all the flaws of the HTML DOM and destroy the core mission.
* **NOT a Bloated General-Purpose SPA Runtime:** It does not seek to recreate the DOM, Virtual DOM, or JavaScript garbage-collection pipelines.
* **NOT a Static PDF Viewer:** It is not merely an embedded PDF reader. Lumra-Web sites are responsive, dynamic, continuous, interactive, and hyperlinked.
* **NOT a Closed Proprietary Format:** All formats, protocols, and interfaces are open, auditable, and buildable from source with standard Rust toolchains.

---

## 5. Target Users and Initial Use Cases

### First Intended Users
1. **Academic & Research Institutions:** Scientists, mathematicians, and universities who currently publish papers as static PDFs and want interactive, living web publications.
2. **Technical Writers & Documentation Teams:** Engineering teams writing developer documentation, API references, and system design specifications that require precise layout, code formatting, and mathematical models.
3. **Rust & Systems Enthusiasts:** Developers passionate about native software, lightweight tooling, zero-JS bloat, and clean compiled languages.
4. **Independent Publishers & Essayists:** Authors seeking typography that rivals printed magazines without fighting web CSS layout shifts.

### Target Early Use Cases
* **Living Technical Papers:** Articles featuring vector figures, live mathematical formulas, code blocks with syntax highlighting, and interactive reference links.
* **Modern Documentation Hubs:** Developer documentation with sticky headers, sidebars, multi-column feature grids, and live search.
* **Data Dashboards & Analytical Reports:** High-density financial or engineering reports with table formatting, callouts, and clean layout cards.
