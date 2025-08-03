---
layout: page
permalink: /people/
title: people
nav: true
nav_order: 3
---

## Principal Investigator

{% for person in site.data.people.principal_investigator %}
{% include person_profile.liquid person=person principal_investigator=true %}
{% endfor %}

## Current Lab Members

{% for person in site.data.people.current_members %}
{% include person_profile.liquid person=person %}
{% endfor %}

## Alumni

{% for person in site.data.people.alumni %}
{% include person_profile.liquid person=person %}
{% endfor %}
