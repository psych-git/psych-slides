---
title       : 
subtitle    : 
author      : 
job         : 
framework   : revealjs
revealjs    : {theme: sky, transition: none, center: "false"} 
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
    color: #380000;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal h3 {
    color: #380000;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal h2 {
    color: #380000;
    padding-bottom: 10px;
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal p {
    font-family: 'Helvetica', 'Arial', sans-serif;
}

.reveal body {
    font-family: 'Helvetica', 'Arial', sans-serif;
}



</style>


## Making Tables in Slidify



--- 

This is the dataframe that I'm going to turn into a series of nice looking tables:


```r
df <- data.frame(State=c("Alabama", "Alaska", "Arizona", "Arkansas"),
           Flower=c("Camellia", "Forget-me-not", "Saguaro cactus blossom", "Apple blossom"),
           Amphibian=c("Red Hills Salamander", "none", "Arizona Tree Frog", "none"),
           Bird=c("Northern Flicker", "Willow ptarmigan", "Cactus wren", "Northern mockingbird")
           )
df
```

```
##      State                 Flower            Amphibian
## 1  Alabama               Camellia Red Hills Salamander
## 2   Alaska          Forget-me-not                 none
## 3  Arizona Saguaro cactus blossom    Arizona Tree Frog
## 4 Arkansas          Apple blossom                 none
##                   Bird
## 1     Northern Flicker
## 2     Willow ptarmigan
## 3          Cactus wren
## 4 Northern mockingbird
```

<br>
<small>It doesn't neatly fit across the screen</small>

---

The HTML code for writing this table would be as follows:

```
<table id="tabletype" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


```

<br>

<small>`tabletype` refers to the series of instructions in the css style sheet belonging to that table type.</small>

---

For instance, here is the style sheet for a very simple grid table type:

```
/*GRIDTABLE STYLE*/
table#gridtable {font-family: 'Helvetica', 'Arial', sans-serif; font-size:16px; color:#333333; border-width: 1px; border-color: #666666; border-collapse:collapse;}
table#gridtable th {font-size:18px;border-width: 1px; padding: 8px; border-style: solid;border-color: #666666; background-color: #dedede;}
table#gridtable td {border-width: 1px; padding: 8px; border-style: solid; border-color: #666666; background-color: #ffffff;}
```

<br>
<small>The result of this is on the next slide</small>


---

#### Simple Grid Table type


<br>


<table id="gridtable" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>

---  

The following slides give you some example tables styles that can be written into the custom css and referred to in slidify presentations.  They are all available at [this github page](https://github.com/psych-git/psych-slides/tree/master/revealjs/assets/css).

<br>

All of these tables do require you to write out the table in the long HTML format.  This is fine for tiny tables like the example here, but would be super annoying for any large table.   There are options for turning R output into HTML style code, but I haven't worked out what might be the best solution just yet.

<br>
All of the following are created by simply modifying the custom css.

---

#### Another very Simple style

<br>


<table id="simple" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


---

#### Zebra Style with colored lines 

<br>

<table id="zebra1" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


---

#### Zebra Style with solid lines and header filled

<br>

<table id="zebra" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


---

#### Box - Rows change color when hovered over


<br>


<table id="box" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>

---

#### Another box style

<br>


<table id="onecol" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


--- 

#### Minimal - Text changes weight when hovered over


<br>


<table id="minimal" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


---

#### Another Simple Hover Table


<br>


<table id="hoverTable" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


---


#### Clean, modern looking hover table

<br>

<table id="flattable" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>

---



#### A green version of the previous example

<br>

<table id="flattable3" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>


---

#### Another table

<br>

<table id="another" style="width:100%">
  <tr>
    <th>State</th>
    <th>Flower</th>
    <th>Amphibian</th>
    <th>Bird</th>
  </tr>
  <tr>
    <td data-th="State">Alabama</td>
    <td data-th="Flower">Camellia</td>
    <td data-th="Amphibian">Red Hills Salamander</td>
    <td data-th="Bird">Northern Flicker</td>
  </tr>
  <tr>
    <td data-th="State">Alaska</td>
    <td data-th="Flower">Forget-me-not</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Willow ptarmigan</td>
  </tr>
  <tr>
    <td data-th="State">Arizona</td>
    <td data-th="Flower">Saguaro cactus blossom</td>
    <td data-th="Amphibian">Arizona Tree Frog</td>
    <td data-th="Bird">Cactus wren</td>
  </tr>
  <tr>
    <td data-th="State">Arkansas</td>
    <td data-th="Flower">Apple blossom</td>
    <td data-th="Amphibian">none</td>
    <td data-th="Bird">Northern mockingbird</td>
  </tr>
</table>

