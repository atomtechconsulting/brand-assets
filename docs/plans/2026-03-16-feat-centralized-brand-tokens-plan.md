---
title: "feat: Centralized Brand Tokens"
type: feat
status: completed
date: 2026-03-16
---

# Centralized Brand Tokens

## Overview

Create a single source of truth for Atomtech brand colors, gradients, and fonts in the `brand-assets` repo. LLMs and developers consume tokens via `brand.json`, discovered automatically through CLAUDE.md inheritance across all `I+D/` projects.

## Acceptance Criteria

- [x] `brand.json` at repo root with all colors (16), gradients (4), and font definitions
- [x] `CLAUDE.md` at repo root with compact brand summary + pointer to `brand.json`
- [x] One-liner added to `I+D/CLAUDE.md` pointing sibling projects to brand-assets
- [x] JSON is valid and consumable via jsDelivr CDN

## Implementation

### Step 1: Create `brand.json`

```json
{
  "version": "1.0",
  "colors": {
    "primary": "#0C0D0E",
    "secondary": "#7C7C83",
    "accent": "#4567ED",
    "blue": "#4567ED",
    "lila": "#7C87F7",
    "deepblue": "#171EE8",
    "purple": "#7B3DFF",
    "cyan": "#24C1CC",
    "green": "#24CC83",
    "dark-grey": "#4A4A4F",
    "grey": "#7C7C83",
    "text-grey": "#C7C7C7",
    "light-grey": "#E5E5E6",
    "white-grey": "#EDEDED",
    "white": "#F5F5F5",
    "glass": "rgba(212, 212, 212, 0.06)"
  },
  "gradients": {
    "gradient-corp": "linear-gradient(106deg, #4567ED 2.4%, #7C87F7 25%, #6AA4F0 48.56%, #24C1CC 75%, #24CC83 100%)",
    "gradient-blue-lila": "linear-gradient(135deg, #7C87F7 0%, #4567ED 100%)",
    "gradient-blue-cyan": "linear-gradient(132deg, #24C1CC -4.81%, #4567ED 97.75%)",
    "gradient-green": "linear-gradient(98deg, #24CC83 3.37%, #24C1CC 100%)"
  },
  "fonts": {
    "family": "Inter",
    "fallback": "system-ui, -apple-system, sans-serif",
    "weights": {
      "light": 300,
      "regular": 400,
      "medium": 500,
      "semibold": 600
    },
    "defaults": {
      "body": 300,
      "heading": 500
    }
  }
}
```

**Design decisions:**
- Keep both `accent` and `blue` (same hex) — preserves semantic vs descriptive naming
- `glass` stored as rgba string — only non-hex color, consumers handle as-is
- Gradients as CSS strings — directly pasteable, fewer tokens for LLMs
- `version` field for future extensibility
- Font includes fallback stack but not loading strategy (project-specific)

### Step 2: Create `CLAUDE.md` (repo root)

```markdown
# Brand Assets

Brand tokens for all Atomtech projects.

## Brand Tokens

**Source of truth:** `brand.json` in this repo root.
**CDN:** `https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/brand.json`

### Quick Reference
- Primary: #0C0D0E | Accent: #4567ED | Lila: #7C87F7 | Cyan: #24C1CC | Green: #24CC83
- Font: Inter (light 300, regular 400, medium 500, semibold 600)
- 4 gradients: corp, blue-lila, blue-cyan, green

When building UI for Atomtech projects, read `brand.json` for the full token set.
```

### Step 3: Update `I+D/CLAUDE.md`

Append one line to existing content:

```markdown
## Brand Guidelines
Atomtech brand tokens (colors, fonts, gradients): read `brand.json` in the `brand-assets/` directory.
```

**Path resolution:** Uses natural language pointing to sibling directory. Claude Code can resolve this since it has filesystem access to the parent `I+D/` directory from any child project.

## Technical Considerations

- **Dual naming:** `accent`/`blue` and `secondary`/`grey` share hex values intentionally — semantic roles vs color names
- **CDN availability:** `brand.json` auto-served via jsDelivr at `@main` tag, no deployment needed
- **Worktree edge case:** CLAUDE.md inheritance may not work from `.claude/worktrees/` paths — acceptable tradeoff, worktrees are temporary

## References

- Brainstorm: `docs/brainstorms/2026-03-16-centralized-brand-tokens-brainstorm.md`
- Source colors: `atomtech/frontend/tailwind.config.ts:11-29`
- Source gradients: `atomtech/frontend/tailwind.config.ts:43-48`
- Source fonts: `atomtech/frontend/app/layout.tsx:12-17`, `atomtech/frontend/app/globals.css:7-8`
