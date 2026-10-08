---
name: Cinematic Explorer
colors:
  surface: '#0b1326'
  surface-dim: '#0b1326'
  surface-bright: '#31394d'
  surface-container-lowest: '#060e20'
  surface-container-low: '#131b2e'
  surface-container: '#171f33'
  surface-container-high: '#222a3d'
  surface-container-highest: '#2d3449'
  on-surface: '#dae2fd'
  on-surface-variant: '#d8c3ad'
  inverse-surface: '#dae2fd'
  inverse-on-surface: '#283044'
  outline: '#a08e7a'
  outline-variant: '#534434'
  surface-tint: '#ffb95f'
  primary: '#ffc174'
  on-primary: '#472a00'
  primary-container: '#f59e0b'
  on-primary-container: '#613b00'
  inverse-primary: '#855300'
  secondary: '#c0c1ff'
  on-secondary: '#1000a9'
  secondary-container: '#3131c0'
  on-secondary-container: '#b0b2ff'
  tertiary: '#56e5a9'
  on-tertiary: '#003824'
  tertiary-container: '#30c88f'
  on-tertiary-container: '#004e34'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#ffddb8'
  primary-fixed-dim: '#ffb95f'
  on-primary-fixed: '#2a1700'
  on-primary-fixed-variant: '#653e00'
  secondary-fixed: '#e1e0ff'
  secondary-fixed-dim: '#c0c1ff'
  on-secondary-fixed: '#07006c'
  on-secondary-fixed-variant: '#2f2ebe'
  tertiary-fixed: '#6ffbbe'
  tertiary-fixed-dim: '#4edea3'
  on-tertiary-fixed: '#002113'
  on-tertiary-fixed-variant: '#005236'
  background: '#0b1326'
  on-background: '#dae2fd'
  surface-variant: '#2d3449'
typography:
  headline-xl:
    fontFamily: Plus Jakarta Sans
    fontSize: 36px
    fontWeight: '800'
    lineHeight: 44px
  headline-xl-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 28px
    fontWeight: '800'
    lineHeight: 34px
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 30px
    fontWeight: '700'
    lineHeight: 38px
  headline-lg-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 22px
    fontWeight: '700'
    lineHeight: 28px
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 26px
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
  label-sm:
    fontFamily: Inter
    fontSize: 10px
    fontWeight: '700'
    lineHeight: 14px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-mobile: 0.75rem
  margin: 1.5rem
  margin-mobile: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2.5rem
---

## Brand & Style

This design system defines a premier mobile-first cinema companion and movie discovery interface tailored for Spanish-speaking cinephiles. It blends the structural, gesture-driven fluidity of iOS Cupertino with the layered depth, elevation logic, and accessible state behaviors of Material 3. 

The aesthetic is anchored in contemporary cinematic darkness: a theater-like immersion where rich charcoal backdrops allow film posters, trailers, and key metadata to illuminate the screen. The interface evokes anticipation, curated taste, and prestige without slipping into overwhelming visual clutter. Tactile feedback metaphors, high-clarity typography, and micro-luminance highlights establish an upscale digital box office and premiere discovery experience.

## Colors

The palette is engineered exclusively for an immersive, low-light viewing environment.

- **Primary (`#F59E0B` - Cinema Gold/Amber):** Represents prestige, curated spotlights, showtime selection, and active review star ratings. Use for primary calls to action ("Reservar boletos", "Comprar entradas") and featured badges.
- **Secondary (`#6366F1` - Electric Indigo):** Represents streaming availability, interactive badges, filter states, and secondary actions ("Ver tráiler", "Guardar en cartelera").
- **Tertiary (`#10B981` - Emerald Critic):** Used for freshness scores, positive critic consensuses, confirmed seat status, and successful booking confirmations.
- **Neutral Base (`#0F172A` - Slate Charcoal):** The deep canvas tone that mimics the dimmed auditorium environment.

### Surface System
- **Background Base:** `#0F172A`
- **Surface Level 1 (Cards, Navigation bars):** `#1E293B`
- **Surface Level 2 (Modals, Dropdowns, Sheets):** `#334155`
- **Surface Interactive (Hover, Press states):** `#475569`
- **Text High-Emphasis:** `#F8FAFC`
- **Text Medium-Emphasis:** `#94A3B8`
- **Text Disabled / Subtle Border:** `#475569`

## Typography

Typography pairs the structural, geometric warmth of Plus Jakarta Sans for cinematic titles and billboard banners with the ultra-legible utilitarian precision of Inter for synopses, theater times, cast listings, and UI controls.

All Spanish typographic nuances (accented characters `á, é, í, ó, ú`, `ñ`, and opening punctuation `¿`, `¡`) have calibrated baseline balance and proper optical spacing. All metadata labels (durations, genres, age ratings such as `B15`, `PG-13`, `DOB`, `SUB`) utilize uppercase `label-sm` or `label-md` with slight letter tracking for instantaneous legibility in dark interfaces.

## Layout & Spacing

The layout is built around an ergonomic, gesture-focused mobile framework.

- **Grid Architecture:** Uses a fluid 4-column system on mobile viewports (< 600px), transitioning to 8 columns on tablet portrait (600px - 1024px) and 12 columns on desktop/tablet landscape.
- **Rhythm:** Uses an 8-point spatial rhythm (`space-xs` = 4px, `space-sm` = 8px, `space-md` = 16px, `space-lg` = 24px, `space-xl` = 40px) to maintain predictability across complex layouts like seating charts and horizonal billboard carousels.
- **Safe Areas & Reachability:** Incorporates Cupertino-style bottom navigation and floating bottom-sheets with explicit adherence to bottom safe area insets (34px safe area clearance on modern mobile devices). Critical interaction zones remain anchored in the lower 40% of the viewport.
- **Reflow Rules:** Horizontal edge-to-edge carousels snap naturally across phone screens with `margin-mobile` padding offsets, allowing trailing poster cards to peek at 15% visibility to prompt discovery.

## Elevation & Depth

Visual depth is achieved through translucent glass planes and physical tonal illumination rather than harsh drop shadows.

- **Tonal Layers:** The screen uses three structural dark tiers (`#0F172A` as canvas base, `#1E293B` for elevated surface containers, and `#334155` for high overlays).
- **Glassmorphism & Blurs:** Bottom navigation bars, modal headers, and floating sticky booking buttons employ frosted glass properties: `rgba(15, 23, 42, 0.78)` background paired with `backdrop-filter: blur(20px) saturate(180%)`.
- **Micro-Borders:** Cards and bottom sheets feature subtle top-edge lighting using an ultra-low opacity linear border: `1px solid rgba(255, 255, 255, 0.08)`.
- **Ambient Lighting:** Floating action pills and selected cinema seats cast a directional colored glow: `0 8px 24px rgba(245, 158, 11, 0.25)` for primary amber CTAs, and `0 8px 24px rgba(99, 102, 241, 0.25)` for electric indigo interactive elements.

## Shapes

The interface implements consistent, organic roundedness reflecting modern Material 3 and iOS native sheet styling:

- **Base Radius (`rounded-md` - 8px / 0.5rem):** Filter tags, small badges (audio specs like "IMAX", "Dolby Atmos"), input boxes, and seat icon cells.
- **Medium Radius (`rounded-lg` - 16px / 1rem):** Movie poster covers, synopsis cards, cinema theater listings, and standard dialogue cards.
- **Large Radius (`rounded-xl` - 24px / 1.5rem):** Full-bleed discovery cards, segmented tabs, bottom sheet top corners, and floating navigation bars.
- **Pill (`rounded-full`):** Showtime buttons ("17:30", "20:15"), call-to-action buttons, and active search chips.

## Components

### Buttons
- **Primary Action (Amber Gold):** Background `#F59E0B`, text `#0F172A` (bold `label-lg`), height 48px, pill radius. Interactive state lowers opacity to 0.9 with subtle scale compression (`0.98x`) on tap.
- **Secondary Action (Electric Indigo):** Background `#6366F1`, text `#FFFFFF`, height 48px, pill radius.
- **Ghost/Tertiary (Dark Glass):** Background `rgba(30, 41, 59, 0.7)`, border `1px solid rgba(255, 255, 255, 0.1)`, text `#F8FAFC`.

### Chips & Badges
- **Format Chips ("IMAX", "3D", "4DX"):** Compact height (28px), background `rgba(99, 102, 241, 0.15)`, text `#818CF8`, border `1px solid rgba(99, 102, 241, 0.3)`, radius 8px.
- **Genre Chips ("Acción", "Ciencia Ficción", "Drama"):** Interactive pill, surface `#1E293B`, active selection shifts to `#F59E0B` text and fill `rgba(245, 158, 11, 0.15)`.

### Cards
- **Movie Poster Card:** Aspect ratio 2:3, border radius 16px, background `#1E293B`, subtle highlight border `1px solid rgba(255, 255, 255, 0.05)`. Uses bottom gradient scrim `rgba(15, 23, 42, 0.95)` to display runtime and Spanish title over imagery.
- **Showtime Card ("Cartelera / Funciones"):** Background `#1E293B`, padding 16px, radius 16px. Organizes cinema branches with horizontal wrapping pill slots for available screening schedules.

### Input Fields
- **Search & Filter Bars ("Buscar películas, cines, directores..."):** Background `#1E293B`, height 48px, rounded 16px, border `1px solid rgba(255, 255, 255, 0.08)`. Left-aligned magnifying icon in `#94A3B8`. Focus state activates a 1.5px border glow in `#F59E0B`.

### Cinema Seating Matrix (Domain-Specific)
- **Seat States:** 
  - *Disponible:* 32x32px square with rounded top edges (radius 6px), fill `#334155`.
  - *Seleccionado:* Fill `#F59E0B` with ambient amber glow.
  - *Ocupado:* Fill `#1E293B` at 40% opacity with diagonal stroke.
  - *VIP / Reclinable:* Indigo border with interior leather-stitch dot indicator.

### Segmented Controls & Tabs
- Cupertino-styled inset track: Background `#1E293B`, padding 4px, height 40px, rounded-full. The active tab slides with a smooth physical bounce, finished in `#334155` and high-contrast text `#F8FAFC`.