# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About This Project

This is the Gallant Lab website built with Jekyll using the al-folio theme. The site is customized for an academic neuroscience lab at UC Berkeley, featuring team member profiles, publications, and lab information.

## Development Commands

### Local Development Server

```bash
# Start Jekyll server with LiveReload for development
bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload

# Start server in background (useful for long-running development)
nohup bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload > jekyll.log 2>&1 &

# Stop background Jekyll server
pkill -f jekyll
```

### Build and Dependencies

```bash
# Install Ruby dependencies
bundle install

# Build the site (generates _site directory)
bundle exec jekyll build

# Clean build artifacts
bundle exec jekyll clean
```

### Code Quality

```bash
# Format code with Prettier (Liquid templates and other files)
npx prettier --write .

# Install npm dependencies for formatting
npm install
```

**IMPORTANT**: Always run `npx prettier --write .` before committing to ensure GitHub Actions pass.

**CLAUDE BEHAVIOR**: Always ask the user before running Prettier and before committing. Never run these commands automatically.

## Architecture Overview

### Jekyll Site Structure

- **\_pages/**: Main site pages (about.md, people.md, publications.md, etc.)
- **\_posts/**: Blog posts in Markdown format
- **\_includes/**: Reusable template components (header.liquid, footer.liquid, etc.)
- **\_layouts/**: Page layout templates (default.liquid, page.liquid, post.liquid, etc.)
- **\_sass/**: SCSS stylesheets with theme customization
- **\_config.yml**: Main Jekyll configuration file
- **\_site/**: Generated static site (auto-generated, don't edit directly)

### Theme System

The site uses a dual light/dark theme system:

- **Theme JavaScript**: `assets/js/theme.js` handles theme switching logic
- **Theme SCSS**: `_sass/_themes.scss` contains CSS custom properties for both themes
- **Default theme**: Set to dark mode by default (modified from original system theme)
- **Color scheme**: Blue color theme (changed from original purple)

### People Management

The people page (`_pages/people.md`) uses a structured approach:

- **CSS Classes**: Modern flexbox-based `.person-profile` classes in `_sass/_base.scss`
- **Sections**: Principal Investigator, Current Lab Members, Alumni
- **Structure**: Each person has image, name, title, and description in consistent HTML structure

### Blog System

- **External Sources**: Configured in `_config.yml` `external_sources` (currently disabled)
- **External Posts Plugin**: `_plugins/external-posts.rb` can fetch posts from RSS feeds or URLs
- **Categories and Tags**: Supported for post organization
- **Archives**: Automatic year, tag, and category archives via jekyll-archives-v2

### Publication System

- **Bibliography**: BibTeX files in `_bibliography/` (mainly papers.bib)
- **Jekyll Scholar**: Processes BibTeX for publication pages
- **Citations**: Support for various citation formats and external services (Google Scholar, Altmetric, etc.)

### Asset Processing

- **Images**: Automatic responsive image generation via jekyll-imagemagick
- **JavaScript**: Minification via jekyll-terser
- **CSS**: SCSS compilation with compression
- **Third-party Libraries**: Managed via `_config.yml` third_party_libraries section

## Important Configuration

### Site Customization

- **Site title**: Removed from navigation on non-about pages (customized in `_includes/header.liquid`)
- **Navigation**: Configured in page front matter with `nav: true` and `nav_order`
- **Dark mode default**: Modified in `assets/js/theme.js` to default to dark instead of system preference

### External Integrations

- **Analytics**: Support for Google Analytics, Cronitor, Pirsch, and Openpanel
- **Comments**: Giscus and Disqus support
- **Search**: Built-in search functionality using Ninja Keys
- **Social**: Configurable social media links and previews

### Plugin Configuration

Key plugins and their purposes:

- **jekyll-scholar**: Academic publication management
- **jekyll-imagemagick**: Responsive image processing
- **jekyll-paginate-v2**: Blog pagination
- **jekyll-feed**: RSS/Atom feed generation
- **external-posts.rb**: Custom plugin for external blog content

## File Editing Guidelines

### People Updates

When updating team members in `_pages/people.md`:

- Use the established `.person-profile` HTML structure
- Place images in `assets/img/people/`
- Alumni should have "Former" prefix in titles
- Maintain consistent formatting and spacing

### Blog Posts

- File naming: `YYYY-MM-DD-title.md`
- Required front matter: layout, title, date, description
- Optional front matter: tags, categories
- Images go in `assets/img/` with appropriate subdirectories

### Theme Customization

- Colors defined in `_sass/_variables.scss`
- Theme switching logic in `assets/js/theme.js`
- CSS custom properties in `_sass/_themes.scss`
- Component styles in `_sass/_base.scss`

### Configuration Changes

- Main config in `_config.yml`
- Third-party library versions in `third_party_libraries` section
- Plugin settings have dedicated configuration sections
- Always restart Jekyll server after config changes

## Development Notes

### Server Management

- Jekyll server occasionally dies during development; use nohup for stability
- LiveReload feature enables automatic browser refresh on file changes
- Check `jekyll.log` for build errors when using background server
- Use `pkill -f jekyll` to clean up running processes

### Custom Plugins

The site includes several custom plugins in `_plugins/`:

- **external-posts.rb**: Fetches external blog content
- **cache-bust.rb**: Handles asset cache busting
- **file-exists.rb**: Template helper for checking file existence

### Performance Considerations

- Images are automatically processed into multiple formats and sizes
- CSS and JavaScript are minified in production
- Third-party libraries are configured with integrity hashes
- Responsive images use WebP format when available
