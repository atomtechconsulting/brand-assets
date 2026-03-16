# Centralized Brand Tokens

**Date:** 2026-03-16
**Status:** Brainstorm

## What We're Building

A centralized brand token system in the `brand-assets` repo that serves as the single source of truth for Atomtech's colors, fonts, and gradients. Downstream projects and LLMs consume these tokens via a compact JSON file, with CLAUDE.md pointers enabling automatic inheritance across all `I+D/` projects.

## Why This Approach

- **LLM-first:** Tokens optimized for minimal token consumption. CLAUDE.md inheritance means new projects get brand context automatically — zero setup.
- **Single source of truth:** Colors/fonts currently hardcoded in `atomtech/frontend/tailwind.config.ts`. Centralizing them prevents drift across projects.
- **Simple:** One `brand.json` file. No build tooling, no package management, no Style Dictionary overhead.

## Key Decisions

1. **Format: Single `brand.json`** — All tokens (colors, gradients, fonts) in one compact JSON file at the repo root. Simpler than split files, avoids YAGNI.

2. **LLM consumption via CLAUDE.md inheritance:**
   - `brand-assets/CLAUDE.md` — Full brand reference section with the JSON path and a compact summary.
   - `I+D/CLAUDE.md` — One-liner pointer to `brand-assets/brand.json` so all sibling projects inherit it.

3. **New project workflow:** Projects created under `I+D/` automatically inherit the parent `CLAUDE.md`, which points to brand-assets. The LLM reads the JSON when it needs colors/fonts. No manual setup.

4. **Token source:** Extract current values from `atomtech/frontend/tailwind.config.ts` and `globals.css` (colors, gradients, Inter font, weight scale).

5. **Fonts: TBD** — Font family and weights to be confirmed. Currently Inter (300/500) in the atomtech site.

## Scope

### In scope
- `brand.json` with colors, gradients, font definitions
- `CLAUDE.md` in brand-assets with brand reference section
- One-liner addition to parent `I+D/CLAUDE.md`

### Out of scope
- Replacing existing `tailwind.config.ts` values in atomtech (future migration)
- NPM package publishing
- Style Dictionary / multi-platform output tooling
- Spacing, shadows, or other design tokens beyond colors/fonts/gradients

## Resolved Questions

1. **Font:** Keeping Inter with weights 300 (light), 400 (regular), 500 (medium), 600 (semibold).
2. **Gradients:** All 4 included — `gradient-corp`, `gradient-blue-lila`, `gradient-blue-cyan`, `gradient-green`.
