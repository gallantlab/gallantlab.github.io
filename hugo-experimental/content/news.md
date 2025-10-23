---
title: "News"
description: "All news and announcements from the Gallant Lab"
menu: "main"
weight: 9
---

## Latest News

{{ range (where .Site.RegularPages "Section" "news").ByDate.Reverse }}
<div class="news-item card fade-in" style="margin: 2rem 0;">
  {{ if .Params.image }}
  <div class="publication-card" style="display: flex; gap: 2rem;">
    <div class="publication-image" style="flex-shrink: 0; width: 150px;">
      <img src="{{ .Params.image }}" alt="{{ .Params.alt }}" style="width: 100%; height: auto; border-radius: 8px;">
    </div>
    <div class="publication-info" style="flex: 1;">
      <p class="publication-date" style="color: var(--text-gray); font-size: 0.85rem; margin: 0 0 0.5rem 0;">{{ .Date.Format "January 2, 2006" }}</p>
      <div class="publication-description">
        {{ if .Params.first_sentence }}
          {{ .Params.first_sentence | safeHTML }}
        {{ end }}
        {{ if .Params.remaining_description }}
          {{ .Params.remaining_description | safeHTML }}
        {{ end }}
      </div>
    </div>
  </div>
  {{ else }}
  <div>
    <p class="publication-date" style="color: var(--text-gray); font-size: 0.85rem; margin: 0 0 0.5rem 0;">{{ .Date.Format "January 2, 2006" }}</p>
    <div class="publication-description">
      {{ if .Params.first_sentence }}
        {{ .Params.first_sentence | safeHTML }}
      {{ end }}
      {{ if .Params.remaining_description }}
        {{ .Params.remaining_description | safeHTML }}
      {{ end }}
    </div>
  </div>
  {{ end }}
</div>
{{ end }}
