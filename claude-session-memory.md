# Hugo Site Deployment Session Log

## Site Overview
- **Site**: Gallant Lab website (gallantlab.org)
- **Stack**: Hugo static site generator with Ananke theme
- **Deployment**: GitHub Pages via GitHub Actions
- **Custom CSS**: `/assets/css/custom.css`

## Current Status (as of session end)

### What's Working
✅ Site successfully migrated from Jekyll to Hugo
✅ Deployed to GitHub Pages at gallantlab.org
✅ Desktop view working correctly
✅ Blog functionality implemented
✅ Current Visitors section added
✅ Photos converted to WebP format
✅ Desktop publication cards display properly with side-by-side images and text

### Known Issues
❌ **MOBILE SPACING ISSUE**: Excessive white space between images and text in publication cards on actual mobile devices (not desktop simulating mobile)
- Desktop browser simulating mobile: spacing looks correct
- Actual mobile phones: still showing large white space between image and text
- Issue is specifically in publication cards on `/publications/` page
- Desktop view is working fine

## Mobile Spacing Debugging History

Multiple attempts made to fix mobile spacing issue:

### Attempt 1: Reduced gap values
- Changed `gap: 1.5rem` to smaller values
- Result: No effect (inline styles were overriding)

### Attempt 2: Removed inline styles
- Removed all inline styles from `layouts/index.html`
- Created semantic CSS classes
- Result: Partial improvement but issue persisted

### Attempt 3: Reduced card padding
- Changed card padding from `2rem` to `0.75rem` on mobile
- Result: Not enough

### Attempt 4: Set gap to 0
- Set `.publication-card` gap to `0 !important` on mobile
- Result: Issue persisted

### Attempt 5: Removed pseudo-element shadow
- Removed `::after` pseudo-element that was extending beyond image bounds
- Result: Fixed desktop shadow issue, mobile spacing still problematic

### Attempt 6: Added negative margin
- Used `margin: 0 0 -0.5rem 0` on publication-image
- Result: Made desktop too tight, didn't fix actual mobile

### Attempt 7: Zero padding approach
- Set publication card padding to `0 0.5rem` (zero top/bottom)
- Result: Not enough

### Current Implementation (Attempt 8)
**Changes in `/assets/css/custom.css` mobile section:**

```css
@media (max-width: 768px) {
  /* Card padding */
  .card, .post-preview {
    padding: 0.75rem !important;
  }

  /* Publication cards - zero top/bottom padding */
  .publication-card.card {
    padding: 0 0.5rem !important;
  }

  /* Force column layout */
  .publication-card {
    flex-direction: column !important;
    gap: 0 !important;
    margin: 1rem 0 !important;
  }

  /* Image container - eliminate all spacing */
  .publication-image {
    width: 100%;
    margin: 0 !important;
    padding: 0 !important;
    line-height: 0 !important;
  }

  .publication-image a {
    display: block !important;
    line-height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
  }

  /* Image - eliminate inline spacing */
  .publication-image img {
    box-shadow: none !important;
    display: block !important;
    margin: 0 !important;
    padding: 0 !important;
    line-height: 0 !important;
    vertical-align: bottom !important;
    width: 100%;
    height: auto;
  }

  /* Info container - zero all spacing */
  .publication-info {
    margin: 0 !important;
    padding: 0 !important;
  }
}
```

**Status**: Desktop browser simulating mobile looks correct, but actual mobile devices still show excessive spacing.

## Key Discovery
- Desktop browsers simulating mobile view render differently than actual mobile devices
- The issue is NOT visible when forcing mobile view on desktop
- The issue IS visible on actual phones (iPhone, etc.)
- This suggests there may be additional CSS or browser defaults applying only on actual mobile devices

## Files Modified

### `/assets/css/custom.css`
- Main custom stylesheet
- Contains all mobile responsive styles
- Mobile breakpoint: `@media (max-width: 768px)`

### `/layouts/index.html`
- Homepage template
- All inline styles removed
- Uses semantic CSS classes: `news-card-content`, `news-card-image`, `news-card-text`, etc.

### `/layouts/shortcodes/content-card.html`
- Shortcode used for publication cards
- Structure:
  ```html
  <div class="publication-card card fade-in">
    <div class="publication-image">
      <a href="..."><img src="..." /></a>
    </div>
    <div class="publication-info">
      <h3 class="publication-title">...</h3>
      <p class="publication-date">...</p>
      <div class="publication-description">...</div>
    </div>
  </div>
  ```

## Next Steps to Debug Mobile Issue

1. **Get actual mobile screenshot**: Need to see exactly what the spacing looks like on real device
2. **Check viewport meta tag**: Ensure proper mobile viewport is set
3. **Check for browser-specific CSS**: Look for any -webkit- or mobile-specific defaults
4. **Test on multiple devices**: Check if it's all phones or specific models
5. **Consider negative margins**: May need to use negative margins to pull text up (but this made desktop too tight)
6. **Check Ananke theme CSS**: May be additional spacing from theme that only applies on mobile

## GitHub Actions Deployment

Workflow: `.github/workflows/hugo.yml`
- Triggers on push to main branch
- Uses Hugo extended version
- Builds site to `public/` directory
- Deploys to `gh-pages` branch using `peaceiris/actions-gh-pages@v3`

## Local Development

Start Hugo server:
```bash
hugo server --port 4000
```

To force mobile view for testing (temporary):
```css
/* In custom.css, change: */
@media (max-width: 768px) {
/* To: */
@media (min-width: 0px) {
```
Remember to revert before deploying!

## Commit History (Recent)
- `ec2c12c4` - Fix publication date order and format dates as human-readable (Session: 2025-10-25)
- `ff046531` - Change navbar to gray gradient and make non-link titles black (Session: 2025-10-25)
- `05ad4533` - Add Hugo session log and backup Jekyll session log
- `701332c9` - Fix mobile spacing with vertical-align bottom, zero margins, force flex-direction column
- `1cfacfd5` - Remove all top/bottom padding from publication cards on mobile
- `8c6ea264` - Use negative margin to eliminate spacing between image and text on mobile
- `230ee457` - Further reduce mobile spacing: 0.5rem card padding, 0.125rem info margin
- `fde4a4ca` - Fix mobile spacing by eliminating inline image spacing with line-height: 0 and display: block
- `91e95917` - Remove pseudo-element shadow that extended beyond image bounds

---

## Session: UI Refinements and Publication Fixes (2025-10-25)

### Overview
Enhanced site visual design with improved color hierarchy and fixed publication date ordering and formatting.

### Part 1: Color Scheme and Visual Hierarchy

**Navbar Gradient Update**
- Changed from blue gradient (`#1e3a8a → #2563eb → #3b82f6`) to gray gradient (`#4b5563 → #6b7280 → #9ca3af`)
- Updated box-shadow to match gray tones
- Provides more professional, neutral appearance

**Heading Color Standardization**
- Removed blue gradient effect from all h1-h6 headings
- Changed to solid black text (`color: var(--text-dark)`)
- Eliminates confusion between static titles and interactive links

**Smart Link Indicators on People Page**
- Person names default to black for non-clickable cards
- Person names turn blue when card has a link (clickable)
- Uses CSS `:has()` selector to detect `.person-card-overlay-link`
- Creates clear affordance for interactivity

**Publication Title Colors**
- Publication titles now black by default
- Links within titles remain blue
- Maintains clear distinction between text and interactive elements

**Design Principle Applied**: Blue = interactive/clickable, Black = static text, Gray = metadata

**Files Modified**:
- `assets/css/custom.css` (lines 94-104, 185-188, 389-391, 448)

**Commit**: `ff046531`

### Part 2: Publication Date Order and Formatting

**Problem Identified**
- Publications were out of chronological order
- Dates displayed in ISO format (YYYY-MM-DD) instead of human-readable format

**Chronological Order Correction**
Original incorrect order:
1. 2025-09-17 (correct)
2. 2024-11-21 (should be 4th)
3. 2025-08-22 (should be 2nd)
4. 2025-05-09 (should be 3rd)

Corrected order (newest first):
1. September 17, 2025 - VEM framework
2. August 22, 2025 - Individual differences
3. May 9, 2025 - VEM tutorial
4. November 21, 2024 - Bilingual study
5. July 1, 2024 - Timescales
6. [remaining publications in correct order]

**Date Formatting Enhancement**
- Updated `layouts/shortcodes/content-card.html` shortcode
- Added Hugo time parsing and formatting
- Format: `{{ $parsedDate.Format "January 2, 2006" }}`
- Before: `2025-09-17`
- After: `September 17, 2025`

**Implementation Details**
```go
{{- if $date }}
{{- $parsedDate := time $date }}
<p class="publication-date">{{ $parsedDate.Format "January 2, 2006" }}</p>
{{- end }}
```

**Files Modified**:
- `content/publications.md` (reordered first 4 entries)
- `layouts/shortcodes/content-card.html` (date formatting)

**Commit**: `ec2c12c4`

### Testing and Deployment

**Local Testing**
- Hugo server running on port 4000 (`hugo server --port 4000`)
- Live reload enabled for rapid iteration
- Verified color changes across all pages
- Confirmed publication order and date formatting

**Git Workflow**
- Two separate commits for logical separation of concerns
- Descriptive commit messages with implementation details
- Claude Code co-authorship attribution
- Successfully pushed to GitHub main branch

**Deployment Status**
- Auto-deployed via GitHub Actions
- Changes live on gallantlab.github.io

### User Experience Improvements

**Visual Clarity**
- Clear distinction between interactive and static elements
- Gray navbar less visually competing with content
- Consistent color semantics throughout site

**Content Presentation**
- Publications properly ordered by date (newest first)
- Readable date format improves scanning
- Professional appearance for academic audience

**Accessibility**
- Better affordance through color-coded interactivity
- Consistent patterns across all pages
- Clearer information hierarchy

### Technical Notes

**CSS Techniques Used**
- CSS custom properties for theme consistency
- `:has()` pseudo-class for conditional styling
- Maintained backward compatibility with existing styles

**Hugo Features Leveraged**
- Built-in `time` function for date parsing
- Date formatting with Go's reference date format
- Shortcode system for reusable components

### Future Considerations
- Consider adding date sorting automation for future publications
- Monitor user feedback on gray navbar vs blue
- Evaluate accessibility contrast ratios
- Consider hover states for additional interactivity cues
