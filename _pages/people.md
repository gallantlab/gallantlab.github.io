---
layout: page
permalink: /people/
title: People
nav: true
nav_order: 3
---

## Principal Investigator

<div class="alumni-grid">
{% for person in site.data.people.principal_investigator %}
{% include person_profile_compact.liquid person=person %}
{% endfor %}
</div>

## Current Lab Members

<div class="alumni-grid">
{% for person in site.data.people.current_members %}
{% include person_profile_compact.liquid person=person %}
{% endfor %}
</div>

## Alumni

<div class="alumni-grid">
{% for person in site.data.people.alumni %}
{% include person_profile_compact.liquid person=person %}
{% endfor %}
</div>
