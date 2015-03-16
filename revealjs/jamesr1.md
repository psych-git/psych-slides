---
title       : 
subtitle    : 
author      : 
job         : 
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
revealjs    : {theme: beige, transition: none, center: "false"} # default, sky, night, beige, simple, moon, white
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : github      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
url         : {lib: ./libraries}
knit        : slidify::knit2slides
---

## Honing our R skills & mindset

<br>

Some vaguely interesting programming problems in R

<br>
<br>

<small> Presentation by [Prof James Curley, Columbia University](http://github.com/jalapic) / [@jalapic](http://twitter.com/jalapic) </small>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

---

### This presentation

You may or may not be interested to know that this presentation is written in R.  [Slidify](http://www.slidify.org) is an R package that compiles [R-Markdown](http://rmarkdown.rstudio.com/) scripts into html slideshows. The conversion from R-Markdown to html is done via "frameworks." [reveal.js](http://revealjs.com/) is one such framework. 

<br>

.fragment Matti Vuore and I are trying to put together some sample templates of <font color="red">Slidify</font> to make it easier for others in the Psych department (and the world) to learn.  



--- 

#### Thank You Matti 

![handclap](clap.gif)

---

### Idea behind this presentation

<br>

.fragment - get everyone thinking programatically and logically about problems

<br>

.fragment - begin to appreciate how quick*, useful and reproducible working with R can be 

<br>

.fragment <small>*relatively speaking - e.g. compared to excel, spss, stata </small>

<br>

--- 

### Format of the presentation

<br>

.fragment - Most examples are taken from [stackoverflow](stackoverflow.com) - thank you to the community there for questions, answers and discussion.

<br>

.fragment - I present each problem up front with a question and a desired result. 

<br>

.fragment - We will then spend a little while thinking about ways we might logically address the problem.

<br>

.fragment - I then provide some alternative solutions.



--- 

### Problem 1: 

#### <font color="brown">How to find the number of identical elements in two vectors?</font> 

<br>

```
a <- letters[1:5]
b <- c('a','k','w','p','b','b')

a
#[1] a b c d e

b
#[1] a k w p b b
```
<br>

<p align="left"><font size="4">For each element of <b>'a'</b>, return how many are found in <b>'b'</b>...</font></p>

```
# desired result
# 1  2  0  0  0

```


--- 

### <h4 align="left"><font color="brown">Solution 1a - A fairly slow but intuitive approach</font></h4>

<p align="left"><font size="5"> 1. Use <font color="blue">sapply</font> to apply a function over each element of the vector in succession</font></p>

<p align="left"><font size="5"> 2. That function is to <font color="blue">sum</font> all instances that are TRUE where that element is equal to each element of <b>'b'</b></font></p>

<br>



```r
a <- letters[1:5]
b <- c('a','k','w','p','b','b')


sapply(a, function(x) sum(x==b))
```

```
## a b c d e 
## 1 2 0 0 0
```

```r
# e.g.
a[1]==b
```

```
## [1]  TRUE FALSE FALSE FALSE FALSE FALSE
```

---


### <h4 align="left"><font color="brown">Solution 1b - A fairly fast and intuitive approach</font></h4>

<p align="left"><font size="5"> 1. Make <b>'b'</b> a factor comprised of the levels of <b>'a'</b></font></p>

<p align="left"><font size="5"> 2. Use <font color="blue">table</font> to get frequency counts of each level</font></p>

<br>



```r
#2. (medium)

table(factor(b,levels=a)) 
```

```
## 
## a b c d e 
## 1 2 0 0 0
```

```r
# This works because when factorizing 'b', NAs will be produced if not in 'a'
factor(b, levels=a)
```

```
## [1] a    <NA> <NA> <NA> b    b   
## Levels: a b c d e
```

---

### <h4 align="left"><font color="brown">Solution 1c - The fastest </font></h4>

<p align="left"><font size="5"> 1. Use <font color="blue">match</font> to find index of <b>'a'</b> that each <b>'b'</b> is located</font></p>

<p align="left"><font size="5"> 2. Use <font color="blue">tabulate</font> to get frequency counts of each index of <b>'a'</b></font></p>

<br>

```r
tabulate(match(b, a), length(a))
```

```
## [1] 1 2 0 0 0
```

```r
a
```

```
## [1] "a" "b" "c" "d" "e"
```

```r
b
```

```
## [1] "a" "k" "w" "p" "b" "b"
```

```r
match(b,a)
```

```
## [1]  1 NA NA NA  2  2
```

```r
# tabulate works as it tabulates the indexes
# using length(a) ensures that there is one count for each possible value.
```


--- 


### Problem 2: 

#### <font color="brown">Count number of times a value has already been seen?</font> 

<br>

```
v <- c(1, 3, 1, 2, 4, 2, 1, 3)

```
<br>

```
# desired result
# 0 0 1 0 0 1 2 1

```

--- 

### <h4 align="left"><font color="brown">Solution 2a - base r approach</font></h4>

<p align="left"><font size="5"> 1. Use <font color="blue">ave</font> to group <b>v</b> by each unique element of <b>'v'</b> </font></p>

<p align="left"><font size="5"> 2. Use <font color="blue">seq_along</font> the function to obtain occurrence number of each element</font></p>

<p align="left"><font size="5"> 3. Subtract one to get how many times each has already been seen</font></p>

<br>



```r
v <- c(1, 3, 1, 2, 4, 2, 1, 3)

ave(v, v, FUN=seq_along)-1
```

```
## [1] 0 0 1 0 0 1 2 1
```

```r
#can you see how it works ?
seq_along(v)
```

```
## [1] 1 2 3 4 5 6 7 8
```


--- 

### <h4 align="left"><font color="brown">Solution 2b - dplyr approach </font></h4>

<p align="left"><font size="5"> 1. Those that use <font color="blue">dplyr</font> regularly may be logically more comfortable using <font color="blue">group_by</font>. </font></p>

<p align="left"><font size="5"> 2. Using <font color="blue">mutate</font> adds a new variable to each observation, which by using <font color="blue">row_number</font> is the successive instance of each in this case.</font></p>

<p align="left"><font size="5"> 3. Subtract one to get how many times each has already been seen rather than the exact occurence</font></p>



```r
library(dplyr)
data.frame(v) %>% group_by(v) %>% mutate(count = row_number()-1)
```

```
## Source: local data frame [8 x 2]
## Groups: v
## 
##   v count
## 1 1     0
## 2 3     0
## 3 1     1
## 4 2     0
## 5 4     0
## 6 2     1
## 7 1     2
## 8 3     1
```


--- 

### <h4 align="left"><font color="brown">Solution 2c - not recommended but interesting </font></h4>

<p align="left"><font size="5"> The <font color="blue">make.unique</font> function does what you think in a very useful way for our purpose, and then we use <font color="blue">regular expressions</font> to get rid of the element indexes that we don't need.</font></p>




```r
v.u <- make.unique(as.character(v)) # it only works on character vectors so you must convert first
v.u
```

```
## [1] "1"   "3"   "1.1" "2"   "4"   "2.1" "1.2" "3.1"
```

```r
as.integer(sub("^$","0",sub("[0-9]+\\.?","",v.u)))
```

```
## [1] 0 0 1 0 0 1 2 1
```

```r
#these might help explain...
sub("[0-9]+\\.?","",v.u)
```

```
## [1] ""  ""  "1" ""  ""  "1" "2" "1"
```

```r
tmp <- sub("[0-9]+\\.?","",v.u)
sub("^$","0", tmp)
```

```
## [1] "0" "0" "1" "0" "0" "1" "2" "1"
```


--- 


### Problem 3: 

#### <font color="brown">Find the indices of last occurrence of the unique elements in a vector</font> 

<br>


```
q <- scan(text="1 2 1 2 1 1 1 3 1 2 2 3 3 3 1 1 1 4 1 1 1 4 1 5 5 6
                6 2 3 3 4 4 2 2 2 2 2 3 3 3 1 4 4 4 3 2 5 5 5 5")

```
<br>

```
# desired result
# 41 46 45 44 50 27

```

---

### <h4 align="left"><font color="brown">Solution 3a - non duplicated values </font></h4>

<p align="left"><font size="5"> Use <font color="blue">duplicated</font> to identify whether an element is duplicated.  The <font color="blue">fromLast</font> checks for duplicated values from the end of the vector.  All duplicated values return <b>TRUE</b>, the first instance returns <b>FALSE</b>.</font></p>

<p align="left"><font size="5"> The <font color="blue">!</font> actually checks for the inverse - i.e. not duplicated, and then <font color="blue">which</font> can be used to identify the position of the element. The result then needs to be ordered according to its alphanumeric position</font></p>


<br>


```r
q <- scan(text="1 2 1 2 1 1 1 3 1 2 2 3 3 3 1 1 1 4 1 1 1 4 1 5 5 6
                6 2 3 3 4 4 2 2 2 2 2 3 3 3 1 4 4 4 3 2 5 5 5 5")


i <- which(!duplicated(q,fromLast=T))
i[order(q[i])]
```

```
## [1] 41 46 45 44 50 27
```


--- 


### <h4 align="left"><font color="brown">Solution 3a - non duplicated values </font></h4>

<p align="left"><font size="5"> Further explanation:</font></p>


<br>


```r
q <- scan(text="1 2 1 2 1 1 1 3 1 2 2 3 3 3 1 1 1 4 1 1 1 4 1 5 5 6
                6 2 3 3 4 4 2 2 2 2 2 3 3 3 1 4 4 4 3 2 5 5 5 5")

duplicated(q)
```

```
##  [1] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
## [12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
## [23]  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [34]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [45]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

```r
duplicated(q, fromLast=T)
```

```
##  [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [12]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [23]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
## [34]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
## [45] FALSE FALSE  TRUE  TRUE  TRUE FALSE
```


--- 


### <h4 align="left"><font color="brown">Solution 3a - non duplicated values </font></h4>

<p align="left"><font size="5"> Further explanation:</font></p>


<br>


```r
q <- scan(text="1 2 1 2 1 1 1 3 1 2 2 3 3 3 1 1 1 4 1 1 1 4 1 5 5 6
                6 2 3 3 4 4 2 2 2 2 2 3 3 3 1 4 4 4 3 2 5 5 5 5")

!duplicated(q, fromLast=T)
```

```
##  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [23] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
## [34] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
## [45]  TRUE  TRUE FALSE FALSE FALSE  TRUE
```

```r
which(!duplicated(q, fromLast=T)) #this isn't ordered yet
```

```
## [1] 27 41 44 45 46 50
```


--- 

### <h4 align="left"><font color="brown">Solution 3a - non duplicated values </font></h4>

<p align="left"><font size="5"> Further explanation:</font></p>


<br>


```r
q <- scan(text="1 2 1 2 1 1 1 3 1 2 2 3 3 3 1 1 1 4 1 1 1 4 1 5 5 6
                6 2 3 3 4 4 2 2 2 2 2 3 3 3 1 4 4 4 3 2 5 5 5 5")

which(!duplicated(q, fromLast=T))
```

```
## [1] 27 41 44 45 46 50
```

```r
i <- which(!duplicated(q,fromLast=T))
i[order(q[i])]
```

```
## [1] 41 46 45 44 50 27
```


---

### <h4 align="left"><font color="brown">Solution 3b - tapply </font></h4>

<p align="left"><font size="5"> Use <font color="blue">tapply</font> to apply a function <font color="blue">max</font> over each unique value of the vector <b>'q'</b>, returning the corresponding value from the first argument, which in this case are the numbers 1 to 50 that come from <b>seq_along(q)</b>.</font></p>

<br>

<p align="left"><font size="5"> With <font color="blue">tapply</font> the first argument must be the same length as the input vector </font></p>


<br>


```r
q <- scan(text="1 2 1 2 1 1 1 3 1 2 2 3 3 3 1 1 1 4 1 1 1 4 1 5 5 6
                6 2 3 3 4 4 2 2 2 2 2 3 3 3 1 4 4 4 3 2 5 5 5 5")


tapply(seq_along(q), q, max)
```

```
##  1  2  3  4  5  6 
## 41 46 45 44 50 27
```


---

### <h4 align="left"><font color="brown">Solution 3c - security blanket dplyr approach </font></h4>

<p align="left"><font size="5"> 1. Turn the vector into a dataframe with one variable being the vector <b>'q'</b> and the other variable being the row number. </font></p>

<p align="left"><font size="5"> 2. Then use <font color="blue">group_by</font> to perform a function on each unique level of <b>'q'</b> which is to return the <b>max</b> row with <font color="blue">summarize</font> </font></p>



```r
q <- scan(text="1 2 1 2 1 1 1 3 1 2 2 3 3 3 1 1 1 4 1 1 1 4 1 5 5 6
                6 2 3 3 4 4 2 2 2 2 2 3 3 3 1 4 4 4 3 2 5 5 5 5")


library(dplyr)
data.frame(q, row=1:length(q)) %>% group_by(q) %>%  summarize(max(row))
```

```
## Source: local data frame [6 x 2]
## 
##   q max(row)
## 1 1       41
## 2 2       46
## 3 3       45
## 4 4       44
## 5 5       50
## 6 6       27
```


---

### Problem 4: 

#### <font color="brown">Remove observations with obvious typos</font> 

<br>

<p align="left"><font size="5"> Here is a dataframe called <b>Pat_File</b>. All observations should have the same <b>Sex</b> and <b>Age</b>.  When they do not and are obvious typos they need to be excluded from the dataframe. Imagine the dataframe has thousands of rows. </font></p>


<br>


```r
Pat_File
```

```
##   Case_ID Pat_ID Sex Age
## 1       1      1   1  33
## 2       2      1   1  33
## 3       3      1   1  33
## 4       4      1   1  76
## 5       5      2   2  19
## 6       6      2   2  19
## 7       7      2   1  49
## 8       8      3   1  15
```


---

### <h4 align="left"><font color="brown">Solution 4a - identify the modal value </font></h4>

<p align="left"><font size="5"> 1. A straightforward method would be to identify the <font color="blue">mode</font> of each <b>Case_ID</b> and filter those observations for each case that do not possess the modal value. Sadly this function doesn't exist in R.</font></p>

<p align="left"><font size="5"> 2. But we can make one ... </font></p>



```r
Mode <- function(x) { as.numeric(names(sort(-table(x)))[1])}

x <- c(3,6,4,2,4,6,4,2,4,5,7,4,3,2,1)
Mode(x)
```

```
## [1] 4
```


---

### <h4 align="left"><font color="brown">Solution 4a - cont. </font></h4>

<p align="left"><font size="5"> Here we <font color="blue">filter</font> using <b>dplyr</b> and our recently constructed <font color="blue">Mode</font> function: </font></p>

<br>


```r
#dplyr way:
Pat_File %>% group_by(Pat_ID) %>% filter(Age==Mode(Age) & Sex==Mode(Sex))
```

```
## Source: local data frame [6 x 4]
## Groups: Pat_ID
## 
##   Case_ID Pat_ID Sex Age
## 1       1      1   1  33
## 2       2      1   1  33
## 3       3      1   1  33
## 4       5      2   2  19
## 5       6      2   2  19
## 6       8      3   1  15
```


---

### <h4 align="left"><font color="brown">Solution 4a - cont. </font></h4>

<p align="left"><font size="5"> As an FYI, this can be done very quickly indeed in the <font color="blue">data.table</font> package. I don't plan to go through the syntax today!: </font></p>

<br>


```r
#data.table way:
library(data.table)

setDT(Pat_File)[, .SD[Age==Mode(Age) & Sex==Mode(Sex)] , by=Pat_ID]
```

```
##    Pat_ID Case_ID Sex Age
## 1:      1       1   1  33
## 2:      1       2   1  33
## 3:      1       3   1  33
## 4:      2       5   2  19
## 5:      2       6   2  19
## 6:      3       8   1  15
```


---

### Problem 5: 

#### <font color="brown">Finding the index of first changes in the elements of a vector</font> 

<br>


```
k <- c(1, 1, 1, 1, 1, 1, 1, 1.5, 1.5, 2, 2, 2, 2, 2, 1, 1, 1, 2, 2, 2)

```
<br>

```
# desired result
#  1  8 10 15 18

```

---

### <h4 align="left"><font color="brown">Solution 5a - use diff. </font></h4>

<p align="left"><font size="5"> Here we can use <font color="blue">diff</font> to calculate the difference between each successive element of the vector <b>'k'</b>. We can then find where these are not equal to 0 using <font color="blue">which</font>. We have to add one to each result to get the index of the original vector, as well as combine with '1' to represent the first element of the vector. </font></p>

<br>




```r
c(1,1+which(diff(k)!=0))
```

```
## [1]  1  8 10 15 18
```

```r
diff(k) #note one fewer results than input values
```

```
##  [1]  0.0  0.0  0.0  0.0  0.0  0.0  0.5  0.0  0.5  0.0  0.0  0.0  0.0 -1.0
## [15]  0.0  0.0  1.0  0.0  0.0
```

```r
which(diff(k)!=0)
```

```
## [1]  7  9 14 17
```

---

### Problem 6: 

#### <font color="brown">Count the number of negative values at the end of a vector</font> 

<br>


```
200 120 80 7 -12 -20 15 70 85 -12 -19 -43

# desired result
#  3

```
<br>

```
145 321 213 187 87 78 -23 -43 12 -35 21

# desired result
#  0

```

---

### <h4 align="left"><font color="brown">Solution 6a - count sign changes from end </font></h4>

<p align="left"><font size="5"> The great function <font color="blue">rle</font> calculates runs of identical sequences. By putting  <font color="blue">sign</font> in front of the vector, it will count the runs of positive and negative numbers (represented by -1s and +1s). Then using indexing, find the last result from <b>rle</b> and return that if the last run was negative, or zero if it wasn't.</font></p>

<br>


```r
j1 <- scan(text="200 120 80 7 -12 -20 15 70 85 -12 -19 -43")
j2 <- scan(text="145 321 213 187 87 78 -23 -43 12 -35 21")
```


```r
r <- rle(sign(j1))
n <- length(r$values)
ifelse(r$values[n] < 1, r$lengths[n], 0)
```

```
## [1] 3
```

```r
r <- rle(sign(j2))
n <- length(r$values)
ifelse(r$values[n] < 1, r$lengths[n], 0)
```

```
## [1] 0
```


---

### <h4 align="left"><font color="brown">Solution 6a - count sign changes from end </font></h4>

<p align="left"><font size="5"> Further explanation:</font></p>



```r
j1 <- scan(text="200 120 80 7 -12 -20 15 70 85 -12 -19 -43")

sign(j1)
```

```
##  [1]  1  1  1  1 -1 -1  1  1  1 -1 -1 -1
```

```r
rle(sign(j1))
```

```
## Run Length Encoding
##   lengths: int [1:4] 4 2 3 3
##   values : num [1:4] 1 -1 1 -1
```

```r
r <- rle(sign(j1))
n <- length(r$values)
n
```

```
## [1] 4
```

```r
ifelse(r$values[n] < 1, r$lengths[n], 0)
```

```
## [1] 3
```



---


### Problem 7: 

#### <font color="brown">How to turn a number into a Roman numeral?</font> 

<br>


```
yrs <- c(2014, 2015, 2016)

# desired result
#   MMXIV MMXV  MMXVI

```

---

### <h4 align="left"><font color="brown">Solution 7a - sorry - trick question </font></h4>

<p align="left"><font size="5">  There's already a function for it! It's called <font color="blue"> as.roman</font>  .</font></p>

<br>



```r
yrs <- c(2014, 2015, 2016)

as.roman(yrs) #cool
```

```
## [1] MMXIV MMXV  MMXVI
```



--- ds:soothe

### <font color="brown">In case you're curious about slidify</font>

<br>

#### <font color="green">These are some of the options...</font>

---

### HTML

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


### Text side by side

```<div class="twocol">```

<div class="twocol">
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, does anyone ever read these. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.
</div>

--- 

### Images side by side

We can put two images side by side using css in /assets/css/...

<div class="twocol">  
<img src='model.png' width=400>
<img src='model.png' width=400>
</div>

--- &twocol

### R plots side by side

Or by using a slide template saved as _templatename.html_ in /assets/layouts/

*** =left
![plot of chunk unnamed-chunk-24](assets/fig/unnamed-chunk-24-1.png) 

*** =right
![plot of chunk unnamed-chunk-25](assets/fig/unnamed-chunk-25-1.png) 

*** =fullwidth
This is better for plots generated in R. Using ```grid.arrange()``` would probably be best for these.


---

### Keyboard shortcuts

- Press escape to zoom out, and alt+click to zoom in
- b for blackout
- f for fullscreen
- s to show slide notes


--- 

### Embedded shiny app

<iframe src="https://jalapic.shinyapps.io/soccerteams/" width="100%" height="640px">Get a better web browser</iframe>
