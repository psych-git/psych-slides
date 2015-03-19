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
assets:
  js:
    - "http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"
    - "http://bartaz.github.io/sandbox.js/jquery.highlight.js"
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

.reveal p {
    font-family: 'Helvetica', 'Arial', sans-serif;
}


</style>




## Making slidify presentations

<br>

A sort-of tutorial

<br>
<br>

<small> Presentation by [James Curley & Matti Vuore](http://github.com/psych-git) / [@jalapic](http://twitter.com/jalapic) /  [@vuorre](http://twitter.com/vuorre) </small>


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

### YAML

<br>

```
revealjs    : {theme: moon, transition: none, center: "false"} 
```
<br>

<small>

- [theme:moon](https://github.com/hakimel/reveal.js/blob/master/css/theme/source/moon.scss) refers to a clean looking solarized dark background (the one that you're looking at)

<br>

- [transition: none](http://lab.hakim.se/reveal-js/#/transitions) refers to the types of transition we'd like between the slides, you can find options by clicking the link. We've just gone for the straightforward, non-distracting basic transition.

<br>

- [center: "false"](http://stackoverflow.com/questions/22446161/can-i-align-reveal-js-slides-to-the-top-of-the-page) makes sure that all headings are fixed to the top of the slide. The default is "true" which would center the the headings and text vertically within each slide

</small>

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



---


### inline CSS works pretty well

with a bit of practice

<br>

<p style="color:blue;margin-left:30px;">This paragraph has a left margin of 30px.</p>

<br>

<p style="color:yellow;margin-left:100px;">This paragraph has a left margin of 100px.</p>

<br>

<p style="color:lime;margin-right:100px;">This paragraph has a right margin of 100px.</p>

<br>

<p align="left"; style="color:#8A2BE2;"> This sentence is left aligned and is purple</p>

---

### Changing line heights

<br>
<p style="margin: 5px 0">This is line one.</p>
<p style="margin: 5px 0">Here is another line.</p>
<p style="margin: 8px 0">Here is yet another line.</p>
<p style="margin: 12px 0">Do you notice the intervals getting bigger?</p>
<p style="margin: 20px 0">Even bigger?</p>
<p style="margin: 50px 0">This is the biggest gap yet!</p>
<p style="margin: 100px 0">I'm a long way away from the others. </p>


---

### Changing line heights

<br>

<p style="line-height: 1em">This is a really long sentence and we can change the gap between the different lines by simplying adding in a 'line-height' HTML tag</p>

<br>

<p style="line-height: 1.8em">This is a really long sentence and we can change the gap between the different lines by simplying adding in a 'line-height' HTML tag</p>


---

### Other text effects

<br>

<marquee behavior="scroll" direction="left" scrollamount="10">Your continuous scroll text goes here ... I wonder if this is a good idea or not ?</marquee>


---


### Formatting text lists

<br>

* This list contains just the default formats

<br>

* The only extra thing written in RMarkdown are some line-break tags in HTML

<br>

* Notice that the starting point of each letter is different if the text wraps over multiple lines or not

---


### Formatting text lists


<br>

<p align="justify"> * This list is a bit different</p>

<br>

<p align="justify"> * Here we've wrapped every line in a 'p align = justify' piece of HTML</p>

<br>

<p align="justify"> * Consequently it has justified the text making it tight from margin to margin but we've lost our bullets - they've been replaced by asteriks.</p>


---

### Formatting text lists

<br>

You can also write an ordered list using the `<ul>` tag

<br>

<ul>
  <li>Notice that this list uses bullets</li>
  <li>And that everything in the list... </li>
  <li> starts at the same point</li>
</ul>



---
    

### Nested text lists

<br>
I haven't found a good way of making line breaks in a nested list without using HTML tags just yet:
<br>
<br>

<ul>
<li>Choice A</li>
<br>
<li>Choice B
  <ol>
    <li>Sub item 1</li>
    <li>Sub item 2</li>
  </ol>
</li>
<br>
<li>Choice C</li>
<br>
</ul>  
  

---

### Formatting text lists

<br>

Sometimes you might want to change the types of bullet used:

<br>

<ul style="list-style-type:circle">
  <li>Circles</li>
  <li>are produced by changing</li>
  <li>the ul style using css</li>
</ul>


<br>

<ul style="list-style-type:square">
  <li>Squares</li>
  <li>are produced by changing</li>
  <li>the ul style using css </li>
</ul>


---

### Adding in an image

You can do this for each individual slide using HTML if you want to change positioning or size...

<br>

<div style='text-align: center;'>
    <img height='400' src='https://extension.unh.edu/sites/default/files/images/4HAnSci/inquisitive-cat300.png' />
</div>



--- &twocol

### Images plus text in columns

This is some text that is going above the columns

<br>


*** =left
<div style='text-align: center;'>
    <img height='380' width= '340' src='http://www.cats.org.uk/uploads/images/pages/cat_care_main.jpg' />
</div>

*** =right

<br>

<p class="fragment" data-fragment-index="1"><span style="color:orange;">You should see two cats</span></p>

<br>

<p class="fragment" data-fragment-index="2"><span style="color:yellow;">One is black and white and the other one is ginger</span></p>

<br>

<p class="fragment" data-fragment-index="3"><span style="color:#FF3333;">Are they friends?</span></p>

<br>




--- &twocolvar

### Two Column Layout   

This slide has two columns of unequal widths

<br>

*** =left

<div style='text-align: center;'>
    <img height='380' width= '300' src='http://www.wildlifeextra.com/resources/listimg/world/Africa_13/meerkat@body.jpg' />
</div>


*** =right


<p align="justify"><font size="5"><span style="color:teal;">  - this side is much wider than the picture side of the slide, and takes up far more space </p></font></style>

<br>

<p align="justify"><font size="5"><span style="color:teal;">  - this is done by saving a default layout in assets/layouts and referring to it at the slide divider </p></font></style>

<br>

<p align="justify"><font size="5"><span style="color:teal;">   - the width of the picture is 300px </p></font></style>



--- &threecol

### Three Column Layout   

This slide has three columns of equal widths

<br>

*** =left

text on the left

*** =center

text in the middle


*** =right

text on the right



--- &threecol

### Three Column Layout   

This slide has three columns of equal widths

<br>

*** =left

<div style='text-align: center;'>
    <img height='150' width= '100' src='http://thefeaturedcreature.com/wp-content/uploads/2012/10/16840_gross1.jpg' />
</div>


*** =center

<div style='text-align: center;'>
    <img height='150' width= '100' src='http://featuredcreature.com/wp-content/uploads/2011/07/Capture.jpg' />
</div>



*** =right

<div style='text-align: center;'>
    <img height='150' width= '100' src='http://thefeaturedcreature.com/wp-content/uploads/2012/10/histrionica1.jpg' />
</div>


---


### Figure captions

<br>

to do


---

### A dividing line
<hr noshade size=4 color='red'>

<br>

Above this text is a line that is red and right underneath the header.

<br>

Although this is working, I'm not sure if this is the best way to do this as the `<hr>` tag is not supposed to be used in HTML5


---


### Backgrounds

--- ds:soothe

"soothe"

--- ds:alert

"alert"

--- ds:mint

"mint"

--- ds:blackout

"blackout"

--- ds:whiteout

"whiteout"

--- ds:sunset

"sunset"

--- ds:greenjs

And finally a custom one in /assets/css/custom.css.

---
