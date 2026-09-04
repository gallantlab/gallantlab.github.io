---
title: "News"
description: "Latest news from the Gallant Lab at UC Berkeley"
# News items have no individual pages: the front page and /old-news/ render
# each item's body inline. `render: never` removes the per-item URLs (and
# drops them from the sitemap); `list: always` keeps them in site collections
# so the news lists still find them. The /news/ section page itself is also
# unrendered — the nav points "News" at "/" and the archive at /old-news/.
build:
  render: never
  list: never
cascade:
  build:
    render: never
    list: always
---
