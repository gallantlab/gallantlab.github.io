# Hugo Site Deployment Session Log

## Site Overview
- **Site**: Gallant Lab website (gallantlab.org)
- **Stack**: Hugo static site generator with Ananke theme
- **Deployment**: GitHub Pages via GitHub Actions
- **Custom CSS**: `/assets/css/custom.css`

## Current Status

### Site Health
✅ Site successfully migrated from Jekyll to Hugo
✅ Deployed to GitHub Pages at gallantlab.org
✅ All pages working correctly with responsive design
✅ Blog functionality implemented
✅ Photos converted to WebP format
✅ Performance optimized (lazy loading, responsive video)
✅ Zero inline styles, 100% Hugo best practices
✅ Active menu highlighting implemented
✅ Redundant page headers removed

### Code Quality
✅ **Templates & Layouts**: Zero inline styles, proper Hugo syntax
✅ **CSS**: 745 lines, 25 legitimate !important declarations for theme overrides
✅ **Hugo Compliance**: 100% - modern syntax, built-in functions
✅ **No Hacks**: Zero shortcuts, all best practices followed
✅ **Theme Integration**: Proper overrides, theme files untouched

### Current Team Count
- 1 Principal Investigator
- 11 Current Lab Members
- 0 Current Visitors
- 36 Alumni
- **Total Active Members:** 12

---

## Archive Information

**2025 Sessions (Oct–Nov):** `claude-session-memory-archive-2025-oct-nov.md`
**2025 Sessions (full year):** `claude-session-memory-archive-2025.md`
**2026 January Sessions:** `claude-session-memory-archive-2026-jan.md`

---

# 2026 Sessions (February onward)

## Session: February 4, 2026 - Add Dr. Jiwoong Park as Postdoc

### Date
February 4, 2026

### Overview
Promoted Jiwoong Park from visitor to current lab member as a new Postdoc, removed the visitors section entirely, and added a news item announcing his arrival.

### Changes Made

**1. Team Reorganization**
- Moved Jiwoong Park from `current_visitors` to `current_members`
- Positioned after Jen Holmberg (alphabetical by last name)
- Updated his entry:
  - Name: "Jiwoong Park" → "Jiwoong Park, PhD"
  - Title: "Graduate Student at Sungkyunkwan University in Korea" → "Postdoc"

**2. Removed Visitors Section**
- Deleted Jaeyoung Jeon from the site
- Removed `current_visitors` section from `data/people.yml`
- Removed "Current Visitors" heading and shortcode from `content/people.md`

**3. News Item Created**
- File: `content/news/2026-02-04-jiwoong-park-joins-lab.md`
- Announces Dr. Jiwoong Park joining as Postdoc
- Links his name to his entry on the people page
- Uses his photo from the people page
- Mentions his PhD from SungKyunKwan University and work with Prof. Won-Mok Shim

### Files Modified

**Modified:**
- `data/people.yml` - Moved Jiwoong to current members, updated title, removed visitors section
- `content/people.md` - Removed Current Visitors section

**Created:**
- `content/news/2026-02-04-jiwoong-park-joins-lab.md`

### Updated Team Count

**Before:**
- Current Lab Members: 10
- Current Visitors: 2 (Jaeyoung Jeon, Jiwoong Park)

**After:**
- Current Lab Members: 11 (added Jiwoong Park)
- Current Visitors: 0 (section removed)

**Full Lab Count:**
- 1 Principal Investigator
- 11 Current Lab Members
- 0 Current Visitors
- 36 Alumni

**Total Active Members:** 12

### Deployment

**Commit:** "Add Dr. Jiwoong Park as postdoc and remove visitors section"

**Status:** Pushed to main, deployed via GitHub Actions

---

## Session: February 11, 2026 - Add Wu, David & Gallant 2006 to Learn Page

### Date
February 11, 2026

### Overview
Added the foundational system identification review paper (Wu, David & Gallant, 2006) to the Learn page, including a figure extracted from the paper and a summary description.

### Paper Details
- **Title:** Complete Functional Characterization of Sensory Neurons by System Identification
- **Authors:** Michael C.-K. Wu, Stephen V. David, Jack L. Gallant
- **Journal:** Annual Review of Neuroscience, 2006, 29:477-505
- **DOI:** 10.1146/annurev.neuro.29.051605.113024

### Changes Made

**1. Figure Extracted**
- Downloaded paper PDF from hearingbrain.org
- Extracted Figure 1: General overview of system identification in the MAP framework
- Shows full pipeline: raw stimulus → preprocessing → model estimation (with prior, model class, noise distribution) → regularization → MAP objective → cross-validation → prediction accuracy
- Cropped from rendered PDF page, converted to WebP (106KB)
- Saved as `static/img/papers/Wu.David.Gallant.2006.webp`

**2. Learn Page Updated**
- Added new content-card entry at the bottom of `content/learn.md`
- Title: "System identification review for sensory neuroscience"
- Links to paper via DOI URL
- Summary describes: MAP estimation framework, unification of algorithms as single statistical inference problem, practical issues (stimulus selection, regularization, visualization, validation), and its role as theoretical foundation for the Gallant Lab encoding model framework

### Files Modified

**Modified:**
- `content/learn.md` - Added content-card for Wu, David & Gallant 2006

**Created:**
- `static/img/papers/Wu.David.Gallant.2006.webp` - Figure 1 from the paper

### Deployment

**Commit:** "Add Wu, David & Gallant 2006 system identification review to Learn page"

**Status:** Pushed to main, deployed via GitHub Actions

---

## Session: February 11, 2026 (continued) - Enable gitInfo and Update Publications Page

### Overview
Enabled Hugo's `enableGitInfo` to fix the "Last updated" footer date, then added three new papers to the Publications page with figures and summaries, updated all existing entries with publication years, condensed descriptions, and replaced four figures with provided source images.

### Changes Made

**1. enableGitInfo (hugo.toml)**
- Added `enableGitInfo = true` so `.Site.Lastmod` uses git commit timestamps
- Footer "Last updated" date now reflects any site change, not just frontmatter dates

**2. Three New Papers Added to Publications Page**

- **Nunez-Elizalde, Huth & Gallant, NeuroImage, 2019** — Banded ridge regression / non-spherical priors. Placed between Deniz 2019 and Lescroart 2019.

- **Nishimoto, Huth, Bilenko & Gallant, Journal of Vision, 2017** — Eye movement-invariant representations. Placed between Lescroart 2019 and de Heer 2017.

- **de Heer, Huth, Griffiths, Gallant & Theunissen, J. Neurosci., 2017** — Hierarchical speech processing. Placed between Nishimoto 2017 and Huth 2016.

**3. Publication Years Added**
- Added year to all 18 paper titles in format "(Authors, Journal, Year)"

**4. Descriptions Condensed**
- All paper descriptions shortened to ~3-4 sentences
- Visconti di Oleggio Castello 2025 preprint description replaced with Learn page version

**5. Figures Replaced from Provided Source PNGs**
- `FIG.nunez.2019.png` → `static/img/papers/Nunez-Elizalde.A.2019.webp`
- `FIG.lescroart.2019.png` → `static/img/papers/Lescroart.M.2019.webp`
- `FIG.nishimoto.2017.png` → `static/img/papers/Nishimoto.S.2017.webp`
- `FIG.deheer.2017.png` → `static/img/papers/deHeer.W.2017.webp`

### Files Modified
- `hugo.toml` — Added `enableGitInfo = true`
- `content/publications.md` — 3 new papers, years added, descriptions condensed
- `static/img/papers/Lescroart.M.2019.webp` — Replaced with provided source

### Files Created
- `static/img/papers/Nunez-Elizalde.A.2019.webp`
- `static/img/papers/Nishimoto.S.2017.webp`
- `static/img/papers/deHeer.W.2017.webp`

### Paper Source
- PDFs found via `LABPUBS` symlink → `/Users/gallant/PAPERS/LAB.PUBS/`
- Figure source PNGs provided as `FIG.*.png` in project root (not committed)

### Deployment

**Commits:**
1. "Enable gitInfo so Last Updated date reflects any site change"
2. "Add 3 papers to Publications page and update all entries"

**Status:** Pushed to main, deployed via GitHub Actions

---

## Session: February 20, 2026 - Add Chen et al. 2026 and Zhang & Gallant 2026 to Publications Page

### Date
February 20, 2026

### Overview
Added two new 2026 bioRxiv preprints to the Publications page, each with a figure converted from a provided PNG source and a summary description written from the paper.

### Papers Added

**1. Chen et al. 2026 — Semantic relations**
- **Title:** Representations of semantic relations in the human cerebral cortex
- **Authors:** Catherine Chen, Xue L. Gong, Fatma Deniz, Daniel L. Klein, Jack L. Gallant
- **Venue:** bioRxiv preprint, 2026
- **DOI:** https://doi.org/10.64898/2026.02.19.706815
- **Figure source:** `FIG.chen.2026.png` → `static/img/papers/Chen.C.2026.webp`
- **Position:** Top of Publications page (newest)

**2. Zhang & Gallant 2026 — Semantic tuning shifts**
- **Title:** Visual semantic tuning across the cortex shifts between tasks
- **Authors:** Tianjiao Zhang, Jack L. Gallant
- **Venue:** bioRxiv preprint, 2026
- **DOI:** https://doi.org/10.64898/2026.02.19.706797
- **Figure source:** `FIG.zhang.2026.png` → `static/img/papers/Zhang.T.2026.webp`
- **Position:** Second entry (after Chen 2026, before Zhang 2025 navigation paper)

### Files Modified
- `content/publications.md` — Two new content-card entries added at top

### Files Created
- `static/img/papers/Chen.C.2026.webp` (229 KB, converted from PNG at 85% quality)
- `static/img/papers/Zhang.T.2026.webp` (105 KB, converted from PNG at 85% quality)

### Deployment
**Commits:**
1. "Add Chen et al. 2026 and Zhang & Gallant 2026 preprints to Publications page"
2. "Shorten Chen 2026 and Zhang 2026 blurbs to match page style" — trimmed both from 4 sentences to 3 to match the length of other entries
3. "Fix broken link for Zhang & Gallant 2026 paper" — replaced DOI URL with working biorxiv URL: https://www.biorxiv.org/content/10.64898/2026.02.19.706797v1

**Status:** Pushed to main, deployed via GitHub Actions

---

## Session: February 22, 2026 - Add News Items for Chen 2026 and Zhang 2026 Preprints

### Date
February 22, 2026

### Overview
Added two news items announcing the Chen et al. 2026 and Zhang & Gallant 2026 bioRxiv preprints, reusing figures from the Publications page.

### News Items Created

**1. Zhang & Gallant 2026 — Semantic tuning shifts**
- File: `content/news/2026-02-22-zhang-attention-biorxiv.md`
- Figure: `/img/papers/Zhang.T.2026.webp` (reused from Publications page)
- Links: Dr. Tianjiao Zhang → `/people#tianjiao-zhang-phd`; paper → `https://www.biorxiv.org/content/10.64898/2026.02.19.706797v1`

**2. Chen et al. 2026 — Semantic relations**
- File: `content/news/2026-02-22-chen-semantic-relations-biorxiv.md`
- Figure: `/img/papers/Chen.C.2026.webp` (reused from Publications page)
- Links: Dr. Catherine Chen → `/people#catherine-chen-phd`; paper → `https://doi.org/10.64898/2026.02.19.706815`

### Deployment
**Commit:** "Add news items for Chen et al. 2026 and Zhang & Gallant 2026 preprints"
**Status:** Pushed to main, deployed via GitHub Actions

---

## Session: February 23, 2026 - Archive January Sessions and Update NEU 290 Readings Page

### Date
February 23, 2026

### Overview
Archived January 2026 session log entries, then made two rounds of edits to the NEU 290 readings page: first deleting 5 specific papers and reordering by publication year, then deleting all papers before Nastase 2018.

### Part 1: Session Log Archive

Created `claude-session-memory-archive-2026-jan.md` with all 5 January 2026 sessions:
- Jan 6: Move Amanda LeBel to alumni
- Jan 9: Remove redundant page headers / active menu highlighting
- Jan 9 (cont.): Fix Hugo version mismatch
- Jan 28: Move Yashaswini to current lab members
- Jan 29: NEU 290 paper voting page

Updated `claude-session-memory.md` to contain only February 2026 sessions onward.

### Part 2: NEU 290 Readings Page — Delete 5 Papers and Sort by Year

**Deleted papers:**
- Parthasarathy et al. 2017
- Fusi et al. 2016
- Ester et al. 2016
- Rigotti et al. 2013
- Sprague et al. 2018

**Reordered:** All remaining 44 papers sorted by publication year, oldest first (1990–2025).

**Header updated:** "49 papers" → "44 papers in order of publication year"

**Summary box updated:** Reflects year ordering instead of vote ordering.

**Section dividers removed:** Vote-count dividers were only meaningful for the old vote-sorted order.

### Part 3: NEU 290 Readings Page — Delete All Papers Before Nastase 2018

Deleted 18 additional papers (Goldberg 1990 through Kuhl 2014).

**Final state:** 26 papers (Nastase 2018 through Tafazoli 2025), numbered 1–26.

**Header updated:** "44 papers" → "26 papers"

### Files Modified
- `claude-session-memory-archive-2026-jan.md` — Created (Jan 2026 archive)
- `claude-session-memory.md` — Trimmed to Feb 2026+
- `layouts/page/neu290-readings.html` — 23 papers deleted, reordered by year, renumbered
- `content/neu290-readings.md` — Added to repo (was untracked)

### Deployment
**Commit:** "Archive Jan 2026 sessions and update NEU 290 readings page"
**Status:** Pushed to main, deployed via GitHub Actions

---
