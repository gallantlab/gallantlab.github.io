# Claude Session Memory

## Project Overview

**Site Type**: Jekyll website using al-folio theme for Gallant Lab (UC Berkeley neuroscience lab)  
**Working Directory**: `/Users/gallant/LABADMIN/WEB/JEKYLL.7-25/working-gallant-site`  
**Git Branch**: main  
**Architecture**: Maximally Jekyll-compliant with structured YAML data, dedicated layouts, proper collections

## Key Development Commands

**Jekyll Development**:

- `bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload` - Local dev server
- `bundle exec jekyll build` - Production build
- `pkill -f jekyll` - Stop Jekyll server

**Code Quality**:

- `npx prettier --write .` - Code formatting (required for GitHub Actions)
- `magick source.jpg target.webp` - Image format conversion

**Git Workflow**:

- Always run prettier before committing
- Use descriptive commit messages with Claude Code co-authorship

## Major Architectural Changes

### Session 7: Complete Jekyll Overhaul (2025-08-29)

**Problem**: Implemented unified "bold first sentence" system across all content sections.

**Solution**: Created comprehensive Jekyll-compliant architecture:

- **Template System**: `_layouts/news.liquid`, `_layouts/publications.liquid`, `_layouts/content_list.liquid`
- **Data Structure**: Two patterns: `first_sentence + remaining_description` or `first_sentence_with_link: true`
- **CSS Implementation**: Single `.first-sentence { font-weight: bold; }` class
- **Collections**: Proper `_news/*.md` files instead of YAML data blocks

**Files Restructured**:

- Brain viewers, publications, tutorials, code, data pages converted to structured YAML
- All 11 news items migrated from YAML to Jekyll collections
- Active navigation styling fixed with proper CSS specificity

### Session 9: Publications & Brain Viewers Enhancement (2025-08-30)

**Jekyll Date Sorting Implementation**:

- Added `date: "YYYY-MM-DD"` fields to all publications for chronological sorting
- Template logic `{% assign sorted_pubs = page.publications | sort: 'date' | reverse %}` now functional
- Removed redundant years from titles since dates in separate fields

**New Content Added**:

- Chen et al. bilingual language processing publication (Nov 21, 2024) - most recent
- Corresponding bilingual brain viewer with interactive functionality
- News system converted from YAML to proper Jekyll collections (eliminated duplicates)

## Team Members & Alumni Management

### Alumni Added Across Sessions

**Complete Alumni Database** (22 total alumni):

**Recent Additions**:

- **Session 8**: Alexander Huth, James Mazer, Kate Gustavsen, Ben Hayden, Dustin Stansbury, Sara Popham (6 alumni)
- **Session 6**: Ben Willmore, Mark Lescroart, Tolga Cukur (3 alumni)
- **Session 1-2**: Stephen David, Kendrick Kay, Thomas Naselaris, Shinji Nishimoto, Leila Wehbe (5 alumni)

**Title Corrections Applied**: Accurate academic paths reflected:

- Kendrick Kay: "Former Psychology Graduate Student"
- Alexander Huth: "Former Neuroscience Graduate Student and Postdoc"
- Dustin Stansbury: "Former Bioengineering Graduate Student"
- Michael Oliver: "Former Vision Science Graduate Student"

**Website Links Added**: 8 lab/personal websites integrated for current faculty members and alumni.

### Current Team Structure

**Principal Investigator**: Jack Gallant  
**Current Members**: 10 active lab members  
**Alumni**: 22 former members with proper academic titles and career trajectories

## Technical Implementation Details

### Image Processing Pipeline

**Standard Workflow**:

1. `magick source.jpg target.webp` - Convert to WebP format
2. `mv target.webp assets/img/people/` - Move to proper directory
3. Jekyll automatic processing: 480px, 800px, 1400px responsive variants
4. `rm source.jpg` - Clean up originals

**Profile Image Requirements**:

- WebP format in `assets/img/people/`
- 1:1.5 aspect ratio for portraits (where needed)
- Consistent naming: `FirstName.LastName.webp`

### CSS Architecture Principles

**Jekyll-Compliant Approach**:

- Use existing SCSS variables and CSS custom properties
- Leverage `var(--global-theme-color)` for theme compatibility
- Proper CSS specificity instead of `!important` declarations
- Bootstrap compatibility without hacks

**Active Navigation Fix**:

```scss
.navbar-nav .nav-item.active .nav-link {
  font-weight: bold;
  color: var(--global-theme-color);
  background-color: transparent;
}
```

### Content Structure Patterns

**Standard YAML Structure**:

```yaml
- title: "Item Title"
  url: "https://example.com"
  image: "/assets/img/category/item.webp"
  alt: "Alt text"
  first_sentence_with_link: true # OR first_sentence: "Text here."
  remaining_description: "Description continues here..."
  date: "YYYY-MM-DD" # For publications
```

## Recent Changes Summary

### Session 10: Publication Date Updates (2025-08-30)

**Problem**: Publication dates were inaccurate, affecting chronological display.

**Solution**: Updated 9 publication dates with accurate information:

- Voxelwise Encoding Tutorial: 2025-05-09
- Timescales Paper: 2024-07-01
- Context Paper: 2023-04-26
- Phonemic Segmentation: 2023-06-29
- Feature-space Selection: 2022-12-01
- State Space Modeling: 2021-05-01
- Mixed Integer Programming: 2021-05-05
- Scene-selective Areas: 2019-01-02
- Semantic Maps: 2016-04-27

**Additional Changes**:

- Added "2024" to Chen et al. bioRxiv preprint on brain-viewers page
- Browser cache resolution through Jekyll rebuild

## Current Site Status

### Architecture Compliance ✅

- **Content as Data**: All content in structured YAML front matter
- **Template Separation**: Clean separation between content, templates, styling
- **Consistent Patterns**: Unified approach across all sections
- **No CSS Hacks**: Pure SCSS following existing patterns
- **Proper Collections**: Jekyll best practices for news system
- **Asset Organization**: Clean file structure following conventions

### Navigation & Content ✅

- **Capitalized Navigation**: All page titles properly formatted
- **Active Navigation Styling**: Bold blue highlighting works correctly
- **Chronological Sorting**: Publications display newest-first automatically
- **Bold First Sentences**: Unified system across all content sections
- **Responsive Images**: Automatic WebP optimization and multiple sizes

### Recent Deployments

**Latest Commits**:

- `5bd6c815` - Publication date updates and brain viewer 2024 addition
- `a72b13fe` - News system Jekyll collections conversion
- `f15f7ca0` - Bilingual publication and brain viewer with Jekyll date sorting
- `1883544c` - Alumni title corrections for academic accuracy

## File Organization

### Key Directories

- `_pages/` - Main site pages with structured YAML data
- `_news/` - Individual news items as Jekyll collection
- `_layouts/` - Dedicated templates (news, publications, content_list)
- `_data/people.yml` - Team members and alumni database
- `assets/img/people/` - Profile images (WebP format)
- `assets/img/papers/` - Publication images
- `_sass/` - SCSS stylesheets with theme system

### Important Files

- `_config.yml` - Jekyll configuration with collections enabled
- `CLAUDE.md` - Project-specific development guidance
- `assets/js/theme.js` - Theme switching (default light mode)
- `_sass/_base.scss` - Core styling including first-sentence and navigation

## Next Session Priorities

- Monitor GitHub Pages deployment of latest changes
- Verify publication chronological ordering on live site
- Test all new website links and functionality
- Consider additional team member updates or content additions
