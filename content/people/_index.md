---
title: "People"
description: "Gallant Lab team members"
# People have no individual pages: /people/ renders each person inline
# (name + role + bio, with an `id` anchor so news items can deep-link to a
# specific bio). The cascade applies build:render:never to descendants AND
# to this section page, so the section page pins its own build explicitly
# (a page's own front matter beats an inherited cascade) to keep /people/.
build:
  render: always
  list: always
cascade:
  build:
    render: never
    list: always
---
