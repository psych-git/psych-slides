---
title       : 
subtitle    : 
author      : 
job         : 
framework   : revealjs
revealjs    : {theme: moon, transition: none, center: "false"} 
highlighter : highlight.js
hitheme     : github 
widgets     : [mathjax]
mode        : selfcontained 
url         : {lib: ./libraries}
knit        : slidify::knit2slides
---

<style>

.reveal h4 {
    color: #00BFFF;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal h3 {
    color: #00BFFF;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal h2 {
    color: #00BFFF;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal body {
    font-family: 'Helvetica', 'Arial', sans-serif;
}

</style>




## Making slidify presentations

<br>

A sort-of tutorial

<br>
<br>

<small> Presentation by [James Curley & Matti Vuore](http://github.com/psych-git) / [@jalapic](http://twitter.com/jalapic) /  [@vuorre](http://twitter.com/vuorre) </small>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

---


### This presentation

<br>

You may or may not be interested to know that this presentation is written in R.  [Slidify](http://www.slidify.org) is an R package that compiles [R-Markdown](http://rmarkdown.rstudio.com/) scripts into html slideshows. The conversion from R-Markdown to html is done via "frameworks." [reveal.js](http://revealjs.com/) is one such framework. 

<br>

.fragment Matti Vuore and I are trying to put together some sample templates of <font color="red">Slidify</font> to make it easier for others in the Psych department (and the world) to learn.  

<br>

.fragment The code for this presentation can be found [here](http://github.com/psych-git)

--- 

### Presentation Overview

<br>

* Each slide will feature some things that can be done in slidify

<br>

* If you want to recreate the slides you can copy the themes and template from the original code

<br>

* We're learning too, so we might not yet have figured out the 'best' way to do things...

---

### Setting the default style

<br>

These are items contained in the YAML. We will describe this in more detail later.

<br>


```
---
framework   : revealjs
revealjs    : {theme: moon, transition: none, center: "false"} 
highlighter : highlight.js
hitheme     : github 
widgets     : [mathjax]
mode        : selfcontained 
url         : {lib: ./libraries}
knit        : slidify::knit2slides
---
```

---

### Setting the default style

<font size="5">Most of the slide style is set by editing the YAML.  However, you can also add in some HTML style code underneath your YAML right at the top of your RMarkdown document. This will change the look of all slides in the presentation. Here, we are changing the colors, gap between headers and body text and font type used.   (Admission - I'm not sure the 'body' one is working...)</font>

```
<style>

.reveal h4 {
    color: #00BFFF;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal h3 {
    color: #00BFFF;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal h2 {
    color: #00BFFF;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal body {
    font-family: 'Helvetica', 'Arial', sans-serif;
}

</style>
```


---


### Setting the default style

<font size="5"> Another option is to use code similar to the previous slide and save it as a CSS file in a folder 'assets/css'.  Each custom layout can then be referred back to when demarking a new slide in RMarkdown. We'll discuss this option more later.</font>


---

### Changing the look of individual slides

<br>
Probably the quickest and easiest way to change individual features of individual slides is to add little bits of HTML to our RMarkdown code.

<br>
The next few slides provide some examples...


---

### HTML

<br>

With a little bit of HTML, we can do all sorts of things.

<ol>
<li class="fragment roll-in">roll-in</p>
<li class="fragment fade-in">fade-in</p>
<li class="fragment highlight-red">highlight-red</p>
<li class="fragment highlight-green">highlight-green</p>
<li class="fragment highlight-blue">highlight-blue</p>
</ol>

<div class="fragment grow">grow</div>
<div class="fragment shrink">shrink</div>


---

### HTML

<br>

Can apply multiple format changes to same piece of text:

<br>

<span class="fragment fade-in">
        <span class="fragment fade-out">I'll fade in, then out</span>
    </span>

<br>


<span class="fragment fade-in">
   <span class="fragment highlight-blue">
      <span class="fragment highlight-green">
        <span class="fragment highlight-red">
          <span class="fragment fade-out">I'll fade in, then go blue, then go green, then go red, then goodbye</span>
    </span>
</span>
</span>
</span>

<br>


---

### Setting the order of appearing things

<br>
It's also possible to make things appear out of sequence on the screen:

<br>

<font color=#1E90FF>
<p class="fragment" data-fragment-index="3">This appears last</p>

<p class="fragment" data-fragment-index="1">This appears first</p>

<p class="fragment" data-fragment-index="2">This appears second</p>
</font>

<br>

<small>* if anyone has a better way of doing this let us know!</small>

---

### <font color="pink">Using HTML to customize slides</font>

<br>

<font size="6"> You can customize the position, size and color of text quite simply using HTML </font>

<br>

You can also make some text <b> bold </b> and other text <i> italicize </i>

<br>

Text <strong> can be strong </strong> or even  <em> emphasized </em> though in browsers these look the same as bold and italicized.

<br>


---

### <font color="pink">Using HTML to customize slides</font>

<br>


<font size="5"> <mark>It might have escaped your notice but this text is marked </mark> </font>

<br>

<font size="5"> All of this is actually <del>very</del> somewhat easy by just adding some HTML tags</font>

<br>

<font size="5"> I have <u> underlined several words </u> in this sentence also. </font>

<br>

<font size="5"> Your probably noticed that these lines are smaller than the previous slide  - yep, that's done by adding HTML tags too</font>


---

### <font color="pink">Using HTML to customize slides</font>

<br>

In fact, all regular HTML tags will work...

<br>

<bdo dir="rtl">Not sure that there would ever be a need for this one</bdo>


---

### Modifying individual slides with CSS

<br>

As well as modifying the look of text using **RMarkdown** and <b>HTML</b>, it's also possible to change things up by adding in a bit of CSS on the fly.  As you can see here, <span style="color:#33FF99; font-weight:bold">the text changes color and gets bolder after adding some CSS inline code.</span>

<br>

Now I'm also writing inline CSS text but <span style="text-shadow: 2px 2px #FFFFFF">have added a shadow</span> - why you'd want to is your business.
