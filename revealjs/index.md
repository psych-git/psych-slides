---
title       : 
subtitle    : 
author      : 
job         : 
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
revealjs    : {theme: moon, transition: none} # sky, black, night, beige, simple, moon 
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : github      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
lib         : /library
knit        : slidify::knit2slides
---

<style>
.reveal h3 {
    color: #c1d192;
    text-align: center;
    padding-bottom: 10px;
    font-size: 140%;
}
</style>

# Presentation
### This is going to look fine

<small>[Matti](http://mvuorre.github.com)</small>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

---

## Slide 1

Add to this slide

<section>

---

Ok, here's some more text.

</section>

--- &vertical

## Vertical slides

Press down

***

Basement level 1


```r
plot(rnorm(100,0,1))
```

<img src="assets/fig/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="504" />

--- &vertical

## Incremental reveal

.fragment You can click  

.fragment Through stuff  

.fragment If you like.


---

## Incremental reveal with effects

> - point 1  

> - .highlight-red point 2  

> - .grow point 3  

> - .shrink point 4  

> - .highlight-blue point 5  

<script>
$('ul.incremental li').addClass('fragment')
</script>

---

Press escape to zoom out, and alt+click to zoom in

--- &vertical

## Vertical Slides

The next set of slides will be vertical slides.

***

## Slide 1

This is slide 1

***

## Embedded website

<iframe src='http://rpubs.com/mv2521/mcmc-animation' width = '960px' height = '600px'></iframe>

--- &vertical

# End

<style> 
.newspaper {
    -webkit-column-count: 3; /* Chrome, Safari, Opera */
    -moz-column-count: 3; /* Firefox */
    column-count: 3;
}
</style>

<div class="newspaper">
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.
</div>

--- ds:soothe

## Alternative ending

<style> 
.twocol {
    -webkit-column-count: 2; /* Chrome, Safari, Opera */
    -moz-column-count: 2; /* Firefox */
    column-count: 2;
}
</style>

<div class="twocol">  
<img src='model.png' width=400>
<img src='model.png' width=400>
</div>

--- background:"#ff0000"

<h2>All CSS color formats are supported, like rgba() or hsl().</h2>
