# atomtech/brand-assets

Public repository for storing and serving brand logos and assets via CDN.

## Usage via jsDelivr CDN

All assets are served via [jsDelivr](https://www.jsdelivr.com/) for free, fast, and globally cached delivery.

**Base URL:**
```
https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/
```

**Example URLs:**
```
# Brand logos
https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/logos/brands/atomtech/logo.svg

# Client logos
https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/logos/clients/acme/logo.svg

# Partner logos
https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/logos/partners/stripe/logo.svg

# Tech stack logos
https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/logos/tech/nextjs/logo.svg

# Social media logos
https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/logos/social/github/logo.svg
```

**In HTML:**
```html
<img src="https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/logos/brands/atomtech/logo.svg" alt="Atomtech" />
```

**In CSS:**
```css
background-image: url('https://cdn.jsdelivr.net/gh/atomtechconsulting/brand-assets@main/logos/brands/atomtech/logo.svg');
```

> **Tip:** Use `@main` to always get the latest version, or pin to a specific commit/tag for stability: `@abc1234`

## Folder Structure

```
brand-assets/
└── logos/
    ├── brands/       # Own brand logos (atomtech, etc.)
    │   └── {brand}/
    │       └── logo.svg
    ├── clients/      # Client logos
    │   └── {client}/
    │       └── logo.svg
    ├── partners/     # Partner logos
    │   └── {partner}/
    │       └── logo.svg
    ├── tech/         # Technology/tool logos (Next.js, Tailwind, etc.)
    │   └── {tech}/
    │       └── logo.svg
    └── social/       # Social media platform logos
        └── {platform}/
            └── logo.svg
```

## Adding Logos

Use the provided script to add logos in the correct structure:

```bash
./add-logo.sh <category> <name> <file>
```

**Examples:**
```bash
./add-logo.sh brands atomtech ./atomtech-logo.svg
./add-logo.sh clients acme ./acme-logo.png
./add-logo.sh tech nextjs ./nextjs-logo.svg
```

This will place the file at `logos/{category}/{name}/logo.{ext}` and commit it automatically.

## Formats

Prefer `.svg` for logos when available. `.png` and `.webp` are also accepted.

## License

Assets belong to their respective owners. Usage must comply with each brand's guidelines.
