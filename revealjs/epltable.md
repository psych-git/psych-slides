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




### formattable + slidify

<br>

[formattable](https://github.com/renkun-ken/formattable) is package by Kun Ren that makes formatting pretty tables in RMarkdown very easy!


<br>

[slidify](http://ramnathv.github.io/slidify/) is a package by Ramnath Vaidyanathan that makes making HTML slides in RMarkdown easy to make!

<br>

Here, I'm trying to use the two together...


---

### Example Table

<small>Data come from my [engsoccerdata](https://github.com/jalapic/engsoccerdata) package - these are summary stats for EPL teams 1992-2014 that played at least 400 games.</small>



```
## Source: local data frame [17 x 8]
## 
##                 team  gp wins losses draws points  ppg winpct
## 1  Manchester United 848  547    126   175   1816 2.14   0.65
## 2            Arsenal 848  460    167   221   1601 1.89   0.54
## 3            Chelsea 848  448    185   215   1559 1.84   0.53
## 4          Liverpool 848  422    213   213   1479 1.74   0.50
## 5  Tottenham Hotspur 848  336    293   219   1227 1.45   0.40
## 6            Everton 848  309    297   242   1169 1.38   0.36
## 7        Aston Villa 848  303    286   259   1168 1.38   0.36
## 8   Newcastle United 768  303    267   198   1107 1.44   0.39
## 9   Blackburn Rovers 696  262    250   184    970 1.39   0.38
## 10   Manchester City 658  261    232   165    948 1.44   0.40
## 11   West Ham United 692  225    292   175    850 1.23   0.33
## 12      Leeds United 468  189    154   125    692 1.48   0.40
## 13       Southampton 582  174    246   162    684 1.18   0.30
## 14     Middlesbrough 536  160    220   156    636 1.19   0.30
## 15            Fulham 494  150    208   136    586 1.19   0.30
## 16  Bolton Wanderers 494  149    217   128    575 1.16   0.30
## 17        Sunderland 494  131    239   124    517 1.05   0.27
```

---

#### Change format of the table in the following ways:

<div style='text-align: left; font-size: 75%;'>

<br>

&#10137;&nbsp;&nbsp; winpct is blue if the value is greater than 75%-quantile

<br>
<br>

&#10137;&nbsp;&nbsp; games played is bold when the value is equal to 848

<br>
<br>

&#10137;&nbsp;&nbsp; points and ppg is colorized by rank

</div>


---

<small>

|              team|                                         gp| wins| losses| draws|                                                                                                                      points|                                                                                                                         ppg|                                      winpct|
|-----------------:|------------------------------------------:|----:|------:|-----:|---------------------------------------------------------------------------------------------------------------------------:|---------------------------------------------------------------------------------------------------------------------------:|-------------------------------------------:|
| Manchester United| <span style="font-weight: bold">848</span>|  547|    126|   175| <span style="display: block; border-radius: 4px; background-color: #003300; padding-right: 4px; color: #FFFFFF">1816</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #000000; color: #FFFFFF">2.14</span>| <span style="color: mediumblue">0.65</span>|
|           Arsenal| <span style="font-weight: bold">848</span>|  460|    167|   221| <span style="display: block; border-radius: 4px; background-color: #004B00; padding-right: 4px; color: #FFFFFF">1601</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #1E1E00; color: #FFFFFF">1.89</span>| <span style="color: mediumblue">0.54</span>|
|           Chelsea| <span style="font-weight: bold">848</span>|  448|    185|   215| <span style="display: block; border-radius: 4px; background-color: #005000; padding-right: 4px; color: #FFFFFF">1559</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #242400; color: #FFFFFF">1.84</span>| <span style="color: mediumblue">0.53</span>|
|         Liverpool| <span style="font-weight: bold">848</span>|  422|    213|   213| <span style="display: block; border-radius: 4px; background-color: #005900; padding-right: 4px; color: #FFFFFF">1479</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #303000; color: #FFFFFF">1.74</span>|  <span style="color: mediumblue">0.5</span>|
| Tottenham Hotspur| <span style="font-weight: bold">848</span>|  336|    293|   219| <span style="display: block; border-radius: 4px; background-color: #007500; padding-right: 4px; color: #FFFFFF">1227</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #525200; color: #FFFFFF">1.45</span>|                            <span>0.4</span>|
|           Everton| <span style="font-weight: bold">848</span>|  309|    297|   242| <span style="display: block; border-radius: 4px; background-color: #007C00; padding-right: 4px; color: #FFFFFF">1169</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #5B5B00; color: #FFFFFF">1.38</span>|                           <span>0.36</span>|
|       Aston Villa| <span style="font-weight: bold">848</span>|  303|    286|   259| <span style="display: block; border-radius: 4px; background-color: #007C00; padding-right: 4px; color: #FFFFFF">1168</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #5B5B00; color: #FFFFFF">1.38</span>|                           <span>0.36</span>|
|  Newcastle United|                           <span>768</span>|  303|    267|   198| <span style="display: block; border-radius: 4px; background-color: #008300; padding-right: 4px; color: #FFFFFF">1107</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #535300; color: #FFFFFF">1.44</span>|                           <span>0.39</span>|
|  Blackburn Rovers|                           <span>696</span>|  262|    250|   184|  <span style="display: block; border-radius: 4px; background-color: #009200; padding-right: 4px; color: #FFFFFF">970</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #595900; color: #FFFFFF">1.39</span>|                           <span>0.38</span>|
|   Manchester City|                           <span>658</span>|  261|    232|   165|  <span style="display: block; border-radius: 4px; background-color: #009500; padding-right: 4px; color: #FFFFFF">948</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #535300; color: #FFFFFF">1.44</span>|                            <span>0.4</span>|
|   West Ham United|                           <span>692</span>|  225|    292|   175|  <span style="display: block; border-radius: 4px; background-color: #00A000; padding-right: 4px; color: #FFFFFF">850</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #6C6C00; color: #FFFFFF">1.23</span>|                           <span>0.33</span>|
|      Leeds United|                           <span>468</span>|  189|    154|   125|  <span style="display: block; border-radius: 4px; background-color: #00B100; padding-right: 4px; color: #FFFFFF">692</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #4F4F00; color: #FFFFFF">1.48</span>|                            <span>0.4</span>|
|       Southampton|                           <span>582</span>|  174|    246|   162|  <span style="display: block; border-radius: 4px; background-color: #00B200; padding-right: 4px; color: #FFFFFF">684</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #727200; color: #FFFFFF">1.18</span>|                            <span>0.3</span>|
|     Middlesbrough|                           <span>536</span>|  160|    220|   156|  <span style="display: block; border-radius: 4px; background-color: #00B800; padding-right: 4px; color: #FFFFFF">636</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #717100; color: #FFFFFF">1.19</span>|                            <span>0.3</span>|
|            Fulham|                           <span>494</span>|  150|    208|   136|  <span style="display: block; border-radius: 4px; background-color: #00BD00; padding-right: 4px; color: #FFFFFF">586</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #717100; color: #FFFFFF">1.19</span>|                            <span>0.3</span>|
|  Bolton Wanderers|                           <span>494</span>|  149|    217|   128|  <span style="display: block; border-radius: 4px; background-color: #00BE00; padding-right: 4px; color: #FFFFFF">575</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #757500; color: #FFFFFF">1.16</span>|                            <span>0.3</span>|
|        Sunderland|                           <span>494</span>|  131|    239|   124|  <span style="display: block; border-radius: 4px; background-color: #00C500; padding-right: 4px; color: #FFFFFF">517</span>| <span style="display: block; border-radius: 4px; padding-right: 4px; background-color: #828200; color: #000000">1.05</span>|                           <span>0.27</span>|
</small>


---

#### The code


```r
library(formattable)
formattable(myt400, list(
  winpct = formatter("span", style = function(x)
    style(color = ifelse(x > quantile(x, 0.75), "mediumblue", NA))),
  gp = formatter("span", style = function(x)
    style("font-weight" = ifelse(x == 848, "bold", NA))),
 points = formatter("span", style = function(x, m = 1 - x/max(x) * 0.8, ms = round(1-m)) 
    style("display" = "block", "border-radius" = "4px", "background-color" = rgb(0, m, 0),
          "padding-right" = "4px", "color" = rgb(1,1,1))),
   ppg = formatter("span", style = function(x, m = 1-x/max(x), ms = round(1-m))
    style("display" = "block", "border-radius" = "4px", "padding-right" = "4px",
          "background-color" = rgb(m, m, 0), "color" = rgb(ms,ms,ms)))))
```

<br>
<small>Also, I wrapped the R code chunk in `<small>` tags</small>
