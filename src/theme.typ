// Theme definitions for Lumra-Web

#let default-theme = (
  name: "ocean",
  is-dark: false,
  primary: rgb("2563eb"),        // Blue 600
  primary-hover: rgb("1d4ed8"),  // Blue 700
  primary-light: rgb("eff6ff"),  // Blue 50
  secondary: rgb("475569"),      // Slate 600
  background: rgb("ffffff"),     // White
  surface: rgb("f8fafc"),        // Slate 50
  surface-card: rgb("ffffff"),   // White
  border: rgb("e2e8f0"),         // Slate 200
  border-light: rgb("f1f5f9"),   // Slate 100
  text: rgb("0f172a"),           // Slate 900
  text-muted: rgb("64748b"),     // Slate 500
  text-subtle: rgb("94a3b8"),    // Slate 400
  accent: rgb("0284c7"),         // Sky 600
  badge-bg: rgb("eff6ff"),
  badge-text: rgb("1d4ed8"),
  code-bg: rgb("f1f5f9"),
)

#let dark-theme = (
  name: "dark",
  is-dark: true,
  primary: rgb("3b82f6"),        // Blue 500
  primary-hover: rgb("60a5fa"),  // Blue 400
  primary-light: rgb("1e293b"),  // Slate 800
  secondary: rgb("94a3b8"),      // Slate 400
  background: rgb("0f172a"),     // Slate 900
  surface: rgb("1e293b"),        // Slate 800
  surface-card: rgb("1e293b"),   // Slate 800
  border: rgb("334155"),         // Slate 700
  border-light: rgb("1e293b"),   // Slate 800
  text: rgb("f8fafc"),           // Slate 50
  text-muted: rgb("94a3b8"),     // Slate 400
  text-subtle: rgb("64748b"),    // Slate 500
  accent: rgb("38bdf8"),         // Sky 400
  badge-bg: rgb("1e3a8a"),
  badge-text: rgb("bfdbfe"),
  code-bg: rgb("1e293b"),
)

#let emerald-theme = (
  name: "emerald",
  is-dark: false,
  primary: rgb("059669"),        // Emerald 600
  primary-hover: rgb("047857"),  // Emerald 700
  primary-light: rgb("ecfdf5"),  // Emerald 50
  secondary: rgb("475569"),
  background: rgb("ffffff"),
  surface: rgb("f8fafc"),
  surface-card: rgb("ffffff"),
  border: rgb("e2e8f0"),
  border-light: rgb("f1f5f9"),
  text: rgb("0f172a"),
  text-muted: rgb("64748b"),
  text-subtle: rgb("94a3b8"),
  accent: rgb("0d9488"),         // Teal 600
  badge-bg: rgb("ecfdf5"),
  badge-text: rgb("047857"),
  code-bg: rgb("f1f5f9"),
)

#let purple-theme = (
  name: "purple",
  is-dark: false,
  primary: rgb("7c3aed"),        // Violet 600
  primary-hover: rgb("6d28d9"),  // Violet 700
  primary-light: rgb("f5f3ff"),  // Violet 50
  secondary: rgb("475569"),
  background: rgb("ffffff"),
  surface: rgb("f8fafc"),
  surface-card: rgb("ffffff"),
  border: rgb("e2e8f0"),
  border-light: rgb("f1f5f9"),
  text: rgb("0f172a"),
  text-muted: rgb("64748b"),
  text-subtle: rgb("94a3b8"),
  accent: rgb("9333ea"),         // Purple 600
  badge-bg: rgb("f5f3ff"),
  badge-text: rgb("6d28d9"),
  code-bg: rgb("f1f5f9"),
)

#let minimal-theme = (
  name: "minimal",
  is-dark: false,
  primary: rgb("18181b"),        // Zinc 900
  primary-hover: rgb("27272a"),  // Zinc 800
  primary-light: rgb("f4f4f5"),  // Zinc 100
  secondary: rgb("71717a"),      // Zinc 500
  background: rgb("ffffff"),
  surface: rgb("fafafa"),
  surface-card: rgb("ffffff"),
  border: rgb("e4e4e7"),         // Zinc 200
  border-light: rgb("f4f4f5"),
  text: rgb("09090b"),           // Zinc 950
  text-muted: rgb("71717a"),     // Zinc 500
  text-subtle: rgb("a1a1aa"),    // Zinc 400
  accent: rgb("27272a"),
  badge-bg: rgb("f4f4f5"),
  badge-text: rgb("18181b"),
  code-bg: rgb("f4f4f5"),
)

#let themes = (
  ocean: default-theme,
  dark: dark-theme,
  emerald: emerald-theme,
  purple: purple-theme,
  minimal: minimal-theme,
)

#let active-theme = state("lumra-active-theme", default-theme)
