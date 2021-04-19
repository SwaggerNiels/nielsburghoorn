<!-- Will render the image with a title underneath, see: https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes -->
{{< figure src="image.jpeg" title="The title" caption="the caption" width="100" height="100">}}

<!-- Highlights code -->
{{< highlight html >}}
<section id="main">
  <div>
   <h1 id="title">{{ .Title }}</h1>
    {{ range .Pages }}
        {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
{{< /highlight >}}
