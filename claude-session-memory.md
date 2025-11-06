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

---

## Session: People Photo Display Update (2025-10-25)

### Overview
Changed people page photo display from circular crops to full photos with rounded rectangles for better portrait presentation.

### Changes Made

**Problem**: Profile photos were displayed as circular crops (150px × 150px circles), which cut off parts of people's faces and forced an unnatural aspect ratio.

**Solution**: Updated CSS to display full photos with modern rounded corners.

**CSS Updates in `/assets/css/custom.css`**:

1. **`.person-image` Container** (lines 338-348):
   - Changed `border-radius: 50%` → `border-radius: 12px`
   - Changed `width: 150px; height: 150px;` → `width: 200px; height: auto;`
   - Allows natural aspect ratio display

2. **`.person-image img`** (lines 358-364):
   - Changed `height: 100%` → `height: auto`
   - Changed `object-fit: cover` → `object-fit: contain`
   - Added `display: block`
   - Prevents cropping and inline spacing issues

**Visual Results**:
- Photos now display full portraits at natural aspect ratio
- Modern rounded rectangle appearance (12px border-radius)
- Larger display size (200px width vs 150px)
- No cropping of faces or important details
- Maintains hover effects and card interactivity

### Technical Details

**Image Display Properties**:
```css
.person-image {
  width: 200px;
  height: auto;
  border-radius: 12px;
}

.person-image img {
  object-fit: contain; /* Shows full image */
  height: auto;
  display: block;
}
```

**Advantages of New Design**:
- Full portraits visible without cropping
- Natural photo proportions preserved
- More professional appearance for academic site
- Better showcases team member photos
- Consistent with modern web design patterns

### Deployment

**Hugo Server**: Local development server running on port 4000 with live reload
**Commit**: `5930551d` - "Change people photos from circular crops to full rounded rectangles"
**Status**: Successfully pushed to GitHub main branch
**Live Site**: Auto-deployment via GitHub Actions to gallantlab.github.io

### User Feedback
User confirmed preference for full photo display over circular crops.

---

### Font Size Standardization (2025-10-25)

**Problem**: Text size was inconsistent across the site. News items and other content sections had smaller text than the landing page introduction.

**Solution**: Standardized all body text to match landing page font size for visual consistency.

**CSS Updates in `/assets/css/custom.css`**:

1. **`.person-description`** - Changed from `1.05rem` to `1.125rem`
2. **`.publication-description`** - Changed from `1.05rem` to `1.125rem`
3. **`.news-description`** - Changed from `1rem` to `1.125rem`

**Results**:
- All body text now uses consistent `1.125rem` (~20px) font size
- Matches landing page "This site provides..." section text size
- Better readability and visual consistency
- Metadata and dates kept at smaller sizes for proper hierarchy

**Deployment**:
- **Commit**: `d7f2d70b` - "Standardize body text font size across all site sections"
- **Status**: Successfully pushed to GitHub main branch
- **Hugo Server**: Changes visible immediately with live reload

---

## Session: Landing Page Update and Repository Cleanup (2025-11-03)

### Overview
Enhanced landing page with VEM framework links, added new visitor Jiwoong Park, and performed comprehensive cleanup removing all Jekyll remnants from the repository.

### Part 1: Landing Page VEM Framework Link

**Change**: Updated landing page to reference both VEM review paper and tutorial.

**Before**:
```markdown
check this recent [tutorial](https://github.com/gallantlab/voxelwise_tutorials)
```

**After**:
```markdown
check out this recent [review paper](https://www.psyarxiv.com/nt2jq) and this [tutorial](https://github.com/gallantlab/voxelwise_tutorials)
```

**File Modified**: `content/_index.md` (line 10)

**Deployment**:
- **Commit**: `d9cca7fb` - "Add review paper link to landing page VEM framework description"
- Successfully pushed to GitHub main branch

### Part 2: New Visitor Addition - Jiwoong Park

**Added**: Jiwoong Park to Current Visitors section

**Details**:
- **Position**: Graduate Student at Sungkyunkwan University in Korea
- **Research Interests**: Studies of the human navigation system, fMRI studies in VR
- **Image Processing**: Converted JPG to WebP (26 KB, 85% quality)

**Technical Discovery**:
- Initial error: Placed image in `assets/img/people/` (Jekyll location)
- Correct location: `static/img/people/` (Hugo serves static files from `static/`)
- Hugo templates reference images as `/img/people/name.webp` which maps to `static/img/`

**Files Modified**:
- `data/people.yml` - Added Jiwoong Park to `current_visitors` section
- `static/img/people/Jiwoong.Park.webp` - New visitor photo

### Part 3: Complete Jekyll Remnants Removal

**Problem**: Repository contained duplicate images and Jekyll-specific files from the Jekyll-to-Hugo migration, causing confusion about correct file locations.

**Solution**: Comprehensive cleanup removing all Jekyll and al-folio theme files.

**Files Removed** (122 total):

**Image Directories** (84 files):
- `assets/img/people/` - All 48 people photos (duplicates of `static/img/people/`)
- `assets/img/papers/` - All 15 paper images (duplicates of `static/assets/img/papers/`)
- `assets/img/datasets/` - 5 dataset images
- `assets/img/other/` - 16 miscellaneous images

**Al-folio Theme Files**:
- `lighthouse_results/` - Performance testing results
- `readme_preview/` - 14 preview screenshots
- Documentation: `FAQ.md`, `INSTALL.md`, `CUSTOMIZE.md`, `CONTRIBUTING.md`, `README.md`, `DOCKER.md`

**Docker Configuration**:
- `Dockerfile`
- `docker-compose.yml`
- `docker-compose-slim.yml`
- `docker-run.sh`

**Jekyll Config Files**:
- `.all-contributorsrc`
- `.dockerignore`
- `.git-blame-ignore-revs`
- `.lycheeignore`
- `.pre-commit-config.yaml`
- `requirements.txt`
- `claude-session-memory-jekyll-backup.md`

**CLAUDE.md Rewrite**:

Completely rewrote documentation to reflect Hugo architecture:

**New Sections**:
- Hugo Site Structure (not Jekyll)
- Image Management - **Images belong in `static/`**, NOT `assets/`
- People Data management in `data/people.yml`
- Hugo vs Jekyll comparison for clarity
- Common tasks with Hugo-specific workflows

**Key Documentation Points**:
- Clarifies that images must go in `static/img/` for Hugo
- Documents YAML data structure for people
- Explains Hugo directory structure vs Jekyll
- Provides correct workflows for adding team members, news items, styling updates

### Repository Impact

**Before Cleanup**:
- Mixed Jekyll and Hugo files causing confusion
- Duplicate images in two locations (assets/ and static/)
- 122 unnecessary files
- Misleading documentation for Jekyll instead of Hugo

**After Cleanup**:
- Pure Hugo repository structure
- Single source of truth for images (`static/`)
- Correct documentation in CLAUDE.md
- Net change: -3,093 lines removed, +110 lines added

### Technical Discoveries

**Hugo Static File Serving**:
- Files in `static/` are served at the root URL path
- `static/img/people/name.webp` → `/img/people/name.webp`
- Templates use `/img/...` paths, not `/assets/img/...`

**Image Location Confusion**:
- Jekyll used `assets/img/`
- Hugo uses `static/` for all static files
- Having both caused errors when adding new images
- Cleanup eliminates future confusion

### Deployment

**Commit**: `1ccdda17` - "Remove all Jekyll remnants and add Jiwoong Park as visitor"

**Changes Summary**:
- 122 files changed
- 1 file created (`static/img/people/Jiwoong.Park.webp`)
- 121 files deleted
- 2 files modified (`data/people.yml`, `CLAUDE.md`)

**Successfully Pushed**: All changes deployed to GitHub main branch

**Auto-Deployment**: GitHub Actions builds and deploys to gallantlab.org

### Benefits

**For Future Development**:
- Clear, accurate documentation of Hugo structure
- No confusion about where to place images
- Cleaner repository for faster navigation
- Correct mental model for future contributors

**Performance**:
- Removed 84 unused duplicate images
- Smaller repository size
- Faster git operations

**Maintainability**:
- Single source of truth for all assets
- Hugo-specific documentation
- Clear separation between Hugo site and theme files

### Current Site Status

**Hugo Site Running**:
- Local development server: http://localhost:4000/
- Live site: gallantlab.org (auto-deployed via GitHub Actions)

**Site Features Working**:
- ✅ People photos display as full rounded rectangles
- ✅ Consistent font sizes across all sections (1.125rem)
- ✅ Landing page links to both VEM review paper and tutorial
- ✅ Jiwoong Park visible in Current Visitors section
- ✅ All images loading correctly from `static/`
- ✅ Clean repository with only Hugo-relevant files

**Current Team**:
- 1 Principal Investigator
- 8 Current Lab Members
- 3 Current Visitors (including new: Jiwoong Park)
- 35 Alumni

---

## Session: Team Update - Emily Meschke to Alumni (2025-11-04)

### Overview
Moved Emily Meschke from current lab members to alumni section with updated position information.

### Changes Made

**Emily Meschke Status Update**:
- **Moved from**: `current_members` section
- **Moved to**: `alumni` section (alphabetically between Michael Eickenberg and James Gao)
- **Previous title**: "Postdoc"
- **New title**: "Former Neuroscience Graduate Student"
- **Previous description**: "Areas of interest include development of new methods for recovering and interpreting brain networks."
- **New description**: "Dr. Meschke is now a postdoc in the lab of Prof. Christopher Baldassano at Columbia University."

### File Modified
- `data/people.yml` - Updated Emily Meschke's entry

### Technical Details

**YAML Structure Change**:
```yaml
# Removed from current_members:
- name: "Emily Meschke, PhD"
  title: "Postdoc"
  image: "people/Emily.Meschke.webp"
  description: "Areas of interest include development of new methods for recovering and interpreting brain networks."

# Added to alumni:
- name: "Emily Meschke, PhD"
  title: "Former Neuroscience Graduate Student"
  image: "people/Emily.Meschke.webp"
  description: "Dr. Meschke is now a postdoc in the lab of Prof. Christopher Baldassano at Columbia University."
```

### Deployment

**Commit**: `2049340f` - "Move Emily Meschke to alumni section"

**Changes Summary**:
- 1 file changed
- 5 insertions, 5 deletions
- Net change: updated position and description

**Successfully Pushed**: Changes deployed to GitHub main branch

**Auto-Deployment**: GitHub Actions builds and deploys to gallantlab.org

### Updated Team Count

**Before**:
- 9 Current Lab Members
- 34 Alumni

**After**:
- 8 Current Lab Members
- 35 Alumni

### Site Status

**Hugo Server**: Running at http://localhost:4000/

**Verification**: Emily Meschke now appears in the alumni section with updated title and position at Columbia University.

---

## Session: Learn Page Enhancement - Banded Ridge Regression Paper (2025-11-05)

### Overview
Added the Dupré la Tour et al. (2022) paper on feature-space selection with banded ridge regression to the Learn page.

### Changes Made

**Paper Addition to Learn Page**:
- **Source**: Copied from Publications page (content/publications.md:24)
- **Destination**: Learn page (content/learn.md:16)
- **Position**: Fourth item on Learn page, after workshop video

**Content Updates**:
- **Title**: Changed from "Feature-space selection with banded ridge regression (Dupré la Tour et al., Neuroimage)" to "Theory paper focusing on feature space selection and banded ridge regression."
- **Description**: Added inline citation "(Dupre la tour et al., Neuroimage, 2022)" after "This paper"
- **Purpose**: Provides theoretical foundation and computational methods for the VEM framework

**Paper Details**:
- **Authors**: Dupré la Tour et al.
- **Journal**: Neuroimage, 2022
- **Topic**: Banded ridge regression for feature-space selection in encoding models
- **Implementation**: Open-source Python package called Himalaya
- **Image**: /img/papers/DuprelaTour.T.2022.webp

### File Modified
- `content/learn.md` - Added paper entry with updated title and description

### Deployment

**Commit**: `8488daeb` - "Add banded ridge regression paper to Learn page"

**Changes Summary**:
- 1 file changed
- 2 insertions
- Added theoretical paper to complement practical tutorials

**Successfully Pushed**: Changes deployed to GitHub main branch

**Auto-Deployment**: GitHub Actions builds and deploys to gallantlab.org

### Learn Page Content Structure

The Learn page now contains four resources in this order:
1. VEM review paper (Visconti di Oleggio Castello, Deniz, et al., 2025)
2. VEM tutorials (interactive Python notebooks)
3. VEM workshop video (CCN 2021)
4. Theory paper on banded ridge regression (Dupré la Tour et al., 2022)

### Site Status

**Hugo Server**: Running at http://localhost:4000/

**Live Site**: http://localhost:4000/learn/

**Verification**: Banded ridge regression paper now appears on Learn page with updated title and inline citation.

---

## Session: Team Update - Add Shio Chiba (2025-11-05 Continued)

### Overview
Added Shio Chiba as an undergraduate student to the People page.

### Changes Made

**New Team Member Addition**:
- **Name**: Shio Chiba
- **Title**: "Undergraduate Student"
- **Description**: "Shio is assisting in attention studies."
- **Position**: Added after Yuerou Tang in current_members section

**Image Processing**:
- **Source**: Shio.Chiba.jpeg in repository root
- **Converted**: Used cwebp -q 85 to convert to WebP format
- **Output**: 144,492 bytes (0.33 bpp), dimensions 1534 x 2302
- **Destination**: static/img/people/Shio.Chiba.webp
- **Cleanup**: Removed original JPEG file

### Files Modified
- `data/people.yml` - Added Shio Chiba entry after Yuerou Tang (lines 58-61)
- `static/img/people/Shio.Chiba.webp` - New team member photo

### Deployment

**Commit**: `cbdab08c` - "Add Shio Chiba as undergraduate student to People page"

**Changes Summary**:
- 2 files changed
- 5 insertions
- 1 new WebP image created

**Hugo Live Reload**: Changes detected and rebuilt in 36ms

**Successfully Pushed**: Changes deployed to GitHub main branch

**Auto-Deployment**: GitHub Actions builds and deploys to gallantlab.org

### Updated Team Count

**Current Lab Members**: 9 (up from 8)
- 7 Graduate Students and Postdocs
- 1 Lab RA (Yuerou Tang)
- 1 Undergraduate Student (Shio Chiba)

### Site Status

**Hugo Server**: Running at http://localhost:4000/

**Live Site**: http://localhost:4000/people/

**Verification**: Shio Chiba now appears on People page after Yuerou Tang with undergraduate student designation.

---

## Session: Landing Page Navigation Update (2025-11-05 Continued)

### Overview
Updated landing page to replace inline VEM framework resource links with a hyperlink to the Learn page, improving site navigation flow.

### Changes Made

**Landing Page Text Modification**:
- **Location**: `content/_index.md` (line 10)
- **Previous text**: "If you would like to know more about our cutting-edge fMRI data analysis and modeling framework, voxelwise encoding models, check out this recent [review paper](https://www.psyarxiv.com/nt2jq) and this [tutorial](https://github.com/gallantlab/voxelwise_tutorials)."
- **Updated text**: "If you would like to know more about our cutting-edge fMRI data analysis and modeling framework, voxelwise encoding models, please navigate to the [Learn page](/learn/)."

**Rationale**:
- Consolidates learning resources in one dedicated location (Learn page)
- Simplifies landing page by removing multiple inline links
- Creates clearer navigation flow for visitors seeking VEM framework information
- Learn page already contains the review paper, tutorial, workshop video, and theory paper

### File Modified
- `content/_index.md` - Updated VEM framework reference with Learn page hyperlink

### Deployment

**Commit**: `71f310fa` - "Update landing page to link to Learn page for VEM framework info"

**Changes Summary**:
- 1 file changed
- 1 insertion, 1 deletion
- Improved navigation UX

**Successfully Pushed**: Changes deployed to GitHub main branch

**Auto-Deployment**: GitHub Actions builds and deploys to gallantlab.org

### Site Status

**Hugo Server**: Running at http://localhost:4000/

**Live Site**: http://localhost:4000/

**Verification**: Landing page now directs visitors to Learn page for VEM framework information via hyperlink.
