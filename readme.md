Horror Films
================

  - [Scraping Data](#scraping-data)
  - [Plotting Data](#plotting-data)
  - [Models](#models)

Did someone say Halloween?

![](jason.gif)

**NOT MY IMAGE. THE FINE FOLKS AT PARAMOUNT OWN IT**

## Scraping Data

Since we are rolling up on the spookiest holiday, it might be worth
pulling in some data on horror movies. Not surprisingly, Wikipedia has
some information about the top-grossing horror movies of all time.

``` r
library(data.table)
library(knitr)
library(kableExtra)
library(plotly)
library(rvest)

topGrossingLink <- "https://en.wikipedia.org/wiki/List_of_highest-grossing_horror_films"

horrorMovies <- read_html(topGrossingLink) %>% 
  html_table(fill = TRUE) %>% 
  `[[`(1)

kable_material(kable(horrorMovies), 
               c("striped", "hover"))
```

<table class=" lightable-material lightable-striped lightable-hover" style='font-family: "Source Sans Pro", helvetica, sans-serif; margin-left: auto; margin-right: auto;'>

<thead>

<tr>

<th style="text-align:right;">

Rank

</th>

<th style="text-align:left;">

Film

</th>

<th style="text-align:left;">

Worldwide gross

</th>

<th style="text-align:right;">

Year

</th>

<th style="text-align:left;">

Franchise or basis

</th>

<th style="text-align:left;">

Studio

</th>

<th style="text-align:left;">

Ref

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

It

</td>

<td style="text-align:left;">

$700,381,748

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

It

</td>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:left;">

\[1\]

</td>

</tr>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:left;">

The Sixth Sense

</td>

<td style="text-align:left;">

$672,806,292

</td>

<td style="text-align:right;">

1999

</td>

<td style="text-align:left;">

N/A

</td>

<td style="text-align:left;">

Hollywood Pictures

</td>

<td style="text-align:left;">

\[2\]

</td>

</tr>

<tr>

<td style="text-align:right;">

3

</td>

<td style="text-align:left;">

War of the Worlds

</td>

<td style="text-align:left;">

$591,745,540

</td>

<td style="text-align:right;">

2005

</td>

<td style="text-align:left;">

The War of the Worlds

</td>

<td style="text-align:left;">

Amblin Entertainment

</td>

<td style="text-align:left;">

\[3\]

</td>

</tr>

<tr>

<td style="text-align:right;">

4

</td>

<td style="text-align:left;">

I Am Legend

</td>

<td style="text-align:left;">

$585,349,010

</td>

<td style="text-align:right;">

2007

</td>

<td style="text-align:left;">

I Am Legend

</td>

<td style="text-align:left;">

Village Roadshow Pictures

</td>

<td style="text-align:left;">

\[4\]

</td>

</tr>

<tr>

<td style="text-align:right;">

5

</td>

<td style="text-align:left;">

World War Z

</td>

<td style="text-align:left;">

$540,007,876

</td>

<td style="text-align:right;">

2013

</td>

<td style="text-align:left;">

World War Z

</td>

<td style="text-align:left;">

Skydance Productions

</td>

<td style="text-align:left;">

\[5\]

</td>

</tr>

<tr>

<td style="text-align:right;">

6

</td>

<td style="text-align:left;">

The Meg

</td>

<td style="text-align:left;">

$530,243,742

</td>

<td style="text-align:right;">

2018

</td>

<td style="text-align:left;">

The Meg

</td>

<td style="text-align:left;">

Warner Bros. Pictures

</td>

<td style="text-align:left;">

\[6\]

</td>

</tr>

<tr>

<td style="text-align:right;">

7

</td>

<td style="text-align:left;">

Godzilla

</td>

<td style="text-align:left;">

$529,076,069

</td>

<td style="text-align:right;">

2014

</td>

<td style="text-align:left;">

Godzilla

</td>

<td style="text-align:left;">

Legendary Pictures

</td>

<td style="text-align:left;">

\[7\]

</td>

</tr>

<tr>

<td style="text-align:right;">

8

</td>

<td style="text-align:left;">

It Chapter Two

</td>

<td style="text-align:left;">

$473,093,228

</td>

<td style="text-align:right;">

2019

</td>

<td style="text-align:left;">

It

</td>

<td style="text-align:left;">

Warner Bros. Pictures

</td>

<td style="text-align:left;">

\[8\]

</td>

</tr>

<tr>

<td style="text-align:right;">

9

</td>

<td style="text-align:left;">

Jaws

</td>

<td style="text-align:left;">

$470,653,000

</td>

<td style="text-align:right;">

1975

</td>

<td style="text-align:left;">

Jaws

</td>

<td style="text-align:left;">

Universal Pictures

</td>

<td style="text-align:left;">

\[9\]

</td>

</tr>

<tr>

<td style="text-align:right;">

10

</td>

<td style="text-align:left;">

The Exorcist

</td>

<td style="text-align:left;">

$441,306,145

</td>

<td style="text-align:right;">

1973

</td>

<td style="text-align:left;">

The Exorcist

</td>

<td style="text-align:left;">

Hoya Productions

</td>

<td style="text-align:left;">

\[10\]

</td>

</tr>

<tr>

<td style="text-align:right;">

11

</td>

<td style="text-align:left;">

The Mummy Returns

</td>

<td style="text-align:left;">

$433,013,274

</td>

<td style="text-align:right;">

2001

</td>

<td style="text-align:left;">

The Mummy

</td>

<td style="text-align:left;">

Universal Pictures

</td>

<td style="text-align:left;">

\[11\]

</td>

</tr>

<tr>

<td style="text-align:right;">

12

</td>

<td style="text-align:left;">

The Mummy

</td>

<td style="text-align:left;">

$415,933,406

</td>

<td style="text-align:right;">

1999

</td>

<td style="text-align:left;">

The Mummy

</td>

<td style="text-align:left;">

Universal Pictures

</td>

<td style="text-align:left;">

\[12\]

</td>

</tr>

<tr>

<td style="text-align:right;">

13

</td>

<td style="text-align:left;">

The Mummy

</td>

<td style="text-align:left;">

$409,231,607

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

The Mummy

</td>

<td style="text-align:left;">

Universal Pictures

</td>

<td style="text-align:left;">

\[13\]

</td>

</tr>

<tr>

<td style="text-align:right;">

14

</td>

<td style="text-align:left;">

Signs

</td>

<td style="text-align:left;">

$408,247,917

</td>

<td style="text-align:right;">

2002

</td>

<td style="text-align:left;">

N/A

</td>

<td style="text-align:left;">

Blinding Edge Pictures

</td>

<td style="text-align:left;">

\[14\]

</td>

</tr>

<tr>

<td style="text-align:right;">

15

</td>

<td style="text-align:left;">

Prometheus

</td>

<td style="text-align:left;">

$403,354,469

</td>

<td style="text-align:right;">

2012

</td>

<td style="text-align:left;">

Alien

</td>

<td style="text-align:left;">

Scott Free Productions

</td>

<td style="text-align:left;">

\[15\]

</td>

</tr>

<tr>

<td style="text-align:right;">

16

</td>

<td style="text-align:left;">

The Mummy: Tomb of the Dragon Emperor

</td>

<td style="text-align:left;">

$401,128,639

</td>

<td style="text-align:right;">

2008

</td>

<td style="text-align:left;">

The Mummy

</td>

<td style="text-align:left;">

Universal Pictures

</td>

<td style="text-align:left;">

\[16\]

</td>

</tr>

<tr>

<td style="text-align:right;">

17

</td>

<td style="text-align:left;">

Godzilla: King of the Monsters

</td>

<td style="text-align:left;">

$385,900,138

</td>

<td style="text-align:right;">

2019

</td>

<td style="text-align:left;">

Godzilla

</td>

<td style="text-align:left;">

Legendary Pictures

</td>

<td style="text-align:left;">

\[17\]

</td>

</tr>

<tr>

<td style="text-align:right;">

18

</td>

<td style="text-align:left;">

Godzilla

</td>

<td style="text-align:left;">

$379,014,294

</td>

<td style="text-align:right;">

1998

</td>

<td style="text-align:left;">

Godzilla

</td>

<td style="text-align:left;">

Centropolis Entertainment

</td>

<td style="text-align:left;">

\[18\]

</td>

</tr>

<tr>

<td style="text-align:right;">

19

</td>

<td style="text-align:left;">

The Nun

</td>

<td style="text-align:left;">

$365,550,119

</td>

<td style="text-align:right;">

2018

</td>

<td style="text-align:left;">

The Conjuring Universe

</td>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:left;">

\[19\]

</td>

</tr>

<tr>

<td style="text-align:right;">

20

</td>

<td style="text-align:left;">

Hannibal

</td>

<td style="text-align:left;">

$351,692,268

</td>

<td style="text-align:right;">

2001

</td>

<td style="text-align:left;">

Hannibal Lecter

</td>

<td style="text-align:left;">

Dino De Laurentiis Company

</td>

<td style="text-align:left;">

\[20\]

</td>

</tr>

<tr>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

A Quiet Place

</td>

<td style="text-align:left;">

$340,939,361

</td>

<td style="text-align:right;">

2018

</td>

<td style="text-align:left;">

N/A

</td>

<td style="text-align:left;">

Platinum Dunes

</td>

<td style="text-align:left;">

\[21\]

</td>

</tr>

<tr>

<td style="text-align:right;">

22

</td>

<td style="text-align:left;">

The Conjuring 2

</td>

<td style="text-align:left;">

$320,392,818

</td>

<td style="text-align:right;">

2016

</td>

<td style="text-align:left;">

The Conjuring Universe

</td>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:left;">

\[19\]

</td>

</tr>

<tr>

<td style="text-align:right;">

23

</td>

<td style="text-align:left;">

The Conjuring

</td>

<td style="text-align:left;">

$319,494,638

</td>

<td style="text-align:right;">

2013

</td>

<td style="text-align:left;">

The Conjuring Universe

</td>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:left;">

\[19\]

</td>

</tr>

<tr>

<td style="text-align:right;">

24

</td>

<td style="text-align:left;">

Resident Evil: The Final Chapter

</td>

<td style="text-align:left;">

$312,242,626

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

Resident Evil

</td>

<td style="text-align:left;">

Constantin Film

</td>

<td style="text-align:left;">

\[22\]

</td>

</tr>

<tr>

<td style="text-align:right;">

25

</td>

<td style="text-align:left;">

Annabelle: Creation

</td>

<td style="text-align:left;">

$306,515,884

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

The Conjuring Universe

</td>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:left;">

\[19\]

</td>

</tr>

<tr>

<td style="text-align:right;">

26

</td>

<td style="text-align:left;">

Van Helsing

</td>

<td style="text-align:left;">

$300,257,475

</td>

<td style="text-align:right;">

2004

</td>

<td style="text-align:left;">

Dracula

</td>

<td style="text-align:left;">

Sommers Company / Stillking Films

</td>

<td style="text-align:left;">

\[23\]

</td>

</tr>

<tr>

<td style="text-align:right;">

27

</td>

<td style="text-align:left;">

Resident Evil: Afterlife

</td>

<td style="text-align:left;">

$300,228,084

</td>

<td style="text-align:right;">

2010

</td>

<td style="text-align:left;">

Resident Evil

</td>

<td style="text-align:left;">

Constantin Film

</td>

<td style="text-align:left;">

\[24\]

</td>

</tr>

<tr>

<td style="text-align:right;">

28

</td>

<td style="text-align:left;">

Shutter Island

</td>

<td style="text-align:left;">

$294,804,195

</td>

<td style="text-align:right;">

2010

</td>

<td style="text-align:left;">

Shutter Island

</td>

<td style="text-align:left;">

Phoenix Pictures

</td>

<td style="text-align:left;">

\[25\]

</td>

</tr>

<tr>

<td style="text-align:right;">

29

</td>

<td style="text-align:left;">

Split

</td>

<td style="text-align:left;">

$278,454,358

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

Unbreakable

</td>

<td style="text-align:left;">

Blinding Edge Pictures

</td>

<td style="text-align:left;">

\[26\]

</td>

</tr>

<tr>

<td style="text-align:right;">

30

</td>

<td style="text-align:left;">

Scary Movie

</td>

<td style="text-align:left;">

$278,019,771

</td>

<td style="text-align:right;">

2000

</td>

<td style="text-align:left;">

Scary Movie

</td>

<td style="text-align:left;">

Dimension Films

</td>

<td style="text-align:left;">

\[27\]

</td>

</tr>

<tr>

<td style="text-align:right;">

31

</td>

<td style="text-align:left;">

The Silence of the Lambs

</td>

<td style="text-align:left;">

$272,742,922

</td>

<td style="text-align:right;">

1991

</td>

<td style="text-align:left;">

Clarice Starling

</td>

<td style="text-align:left;">

Strong Heart/Demme Production

</td>

<td style="text-align:left;">

\[28\]

</td>

</tr>

<tr>

<td style="text-align:right;">

32

</td>

<td style="text-align:left;">

Annabelle

</td>

<td style="text-align:left;">

$257,047,661

</td>

<td style="text-align:right;">

2014

</td>

<td style="text-align:left;">

The Conjuring Universe

</td>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:left;">

\[19\]

</td>

</tr>

<tr>

<td style="text-align:right;">

33

</td>

<td style="text-align:left;">

The Village

</td>

<td style="text-align:left;">

$256,697,520

</td>

<td style="text-align:right;">

2004

</td>

<td style="text-align:left;">

N/A

</td>

<td style="text-align:left;">

Blinding Edge Pictures

</td>

<td style="text-align:left;">

\[29\]

</td>

</tr>

<tr>

<td style="text-align:right;">

34

</td>

<td style="text-align:left;">

Halloween

</td>

<td style="text-align:left;">

$255,498,536

</td>

<td style="text-align:right;">

2018

</td>

<td style="text-align:left;">

Halloween

</td>

<td style="text-align:left;">

Blumhouse Productions

</td>

<td style="text-align:left;">

\[30\]

</td>

</tr>

<tr>

<td style="text-align:right;">

35

</td>

<td style="text-align:left;">

Get Out

</td>

<td style="text-align:left;">

$255,407,663

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

N/A

</td>

<td style="text-align:left;">

Blumhouse Productions

</td>

<td style="text-align:left;">

\[31\]

</td>

</tr>

<tr>

<td style="text-align:right;">

36

</td>

<td style="text-align:left;">

Us

</td>

<td style="text-align:left;">

$254,732,150

</td>

<td style="text-align:right;">

2019

</td>

<td style="text-align:left;">

N/A

</td>

<td style="text-align:left;">

Monkeypaw Productions

</td>

<td style="text-align:left;">

\[32\]

</td>

</tr>

<tr>

<td style="text-align:right;">

37

</td>

<td style="text-align:left;">

The Blair Witch Project

</td>

<td style="text-align:left;">

$248,639,099

</td>

<td style="text-align:right;">

1999

</td>

<td style="text-align:left;">

Blair Witch

</td>

<td style="text-align:left;">

Haxan Films

</td>

<td style="text-align:left;">

\[33\]

</td>

</tr>

<tr>

<td style="text-align:right;">

38

</td>

<td style="text-align:left;">

The Ring

</td>

<td style="text-align:left;">

$248,218,486

</td>

<td style="text-align:right;">

2002

</td>

<td style="text-align:left;">

The Ring

</td>

<td style="text-align:left;">

DreamWorks Pictures

</td>

<td style="text-align:left;">

\[34\]

</td>

</tr>

<tr>

<td style="text-align:right;">

39

</td>

<td style="text-align:left;">

Unbreakable

</td>

<td style="text-align:left;">

$248,118,121

</td>

<td style="text-align:right;">

2000

</td>

<td style="text-align:left;">

Unbreakable

</td>

<td style="text-align:left;">

Blinding Edge Pictures

</td>

<td style="text-align:left;">

\[35\]

</td>

</tr>

<tr>

<td style="text-align:right;">

40

</td>

<td style="text-align:left;">

Glass

</td>

<td style="text-align:left;">

$246,985,576

</td>

<td style="text-align:right;">

2019

</td>

<td style="text-align:left;">

Unbreakable

</td>

<td style="text-align:left;">

Blinding Edge Pictures

</td>

<td style="text-align:left;">

\[36\]

</td>

</tr>

<tr>

<td style="text-align:right;">

41

</td>

<td style="text-align:left;">

Dark Shadows

</td>

<td style="text-align:left;">

$245,527,149

</td>

<td style="text-align:right;">

2012

</td>

<td style="text-align:left;">

Dark Shadows

</td>

<td style="text-align:left;">

Village Roadshow Pictures

</td>

<td style="text-align:left;">

\[37\]

</td>

</tr>

<tr>

<td style="text-align:right;">

42

</td>

<td style="text-align:left;">

Alien: Covenant

</td>

<td style="text-align:left;">

$240,891,763

</td>

<td style="text-align:right;">

2017

</td>

<td style="text-align:left;">

Alien

</td>

<td style="text-align:left;">

20th Century Fox

</td>

<td style="text-align:left;">

\[38\]

</td>

</tr>

<tr>

<td style="text-align:right;">

43

</td>

<td style="text-align:left;">

Resident Evil: Retribution

</td>

<td style="text-align:left;">

$240,004,424

</td>

<td style="text-align:right;">

2012

</td>

<td style="text-align:left;">

Resident Evil

</td>

<td style="text-align:left;">

Constantin Film

</td>

<td style="text-align:left;">

\[39\]

</td>

</tr>

<tr>

<td style="text-align:right;">

44

</td>

<td style="text-align:left;">

Constantine

</td>

<td style="text-align:left;">

$230,884,728

</td>

<td style="text-align:right;">

2005

</td>

<td style="text-align:left;">

Hellblazer

</td>

<td style="text-align:left;">

Warner Bros. Pictures

</td>

<td style="text-align:left;">

\[40\]

</td>

</tr>

<tr>

<td style="text-align:right;">

45

</td>

<td style="text-align:left;">

Annabelle Comes Home

</td>

<td style="text-align:left;">

$228,552,591

</td>

<td style="text-align:right;">

2019

</td>

<td style="text-align:left;">

The Conjuring Universe

</td>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:left;">

\[41\]

</td>

</tr>

<tr>

<td style="text-align:right;">

46

</td>

<td style="text-align:left;">

Interview with the Vampire

</td>

<td style="text-align:left;">

$223,664,608

</td>

<td style="text-align:right;">

1994

</td>

<td style="text-align:left;">

The Vampire Chronicles

</td>

<td style="text-align:left;">

The Geffen Film Company

</td>

<td style="text-align:left;">

\[42\]

</td>

</tr>

<tr>

<td style="text-align:right;">

47

</td>

<td style="text-align:left;">

Scary Movie 3

</td>

<td style="text-align:left;">

$220,673,217

</td>

<td style="text-align:right;">

2003

</td>

<td style="text-align:left;">

Scary Movie

</td>

<td style="text-align:left;">

Dimension Films

</td>

<td style="text-align:left;">

\[43\]

</td>

</tr>

<tr>

<td style="text-align:right;">

48

</td>

<td style="text-align:left;">

Dracula Untold

</td>

<td style="text-align:left;">

$217,124,280

</td>

<td style="text-align:right;">

2014

</td>

<td style="text-align:left;">

Dracula

</td>

<td style="text-align:left;">

Universal Pictures

</td>

<td style="text-align:left;">

\[44\]

</td>

</tr>

<tr>

<td style="text-align:right;">

49

</td>

<td style="text-align:left;">

Bram Stoker’s Dracula

</td>

<td style="text-align:left;">

$215,862,692

</td>

<td style="text-align:right;">

1992

</td>

<td style="text-align:left;">

Dracula

</td>

<td style="text-align:left;">

American Zoetrope

</td>

<td style="text-align:left;">

\[45\]

</td>

</tr>

<tr>

<td style="text-align:right;">

50

</td>

<td style="text-align:left;">

End of Days

</td>

<td style="text-align:left;">

$211,989,043

</td>

<td style="text-align:right;">

1999

</td>

<td style="text-align:left;">

N/A

</td>

<td style="text-align:left;">

Beacon Pictures

</td>

<td style="text-align:left;">

\[46\]

</td>

</tr>

</tbody>

</table>

As per usual, we will likely need to clean some of those dollar values
up just a little bit:

``` r
horrorMovies$`Worldwide gross` <- gsub("\\$|,", 
                                       "", 
                                       horrorMovies$`Worldwide gross`)

horrorMovies$`Worldwide gross` <- as.numeric(horrorMovies$`Worldwide gross`)
```

All looks good now\!

<table style='width: auto;'
        class='table table-condensed'>

<caption>

Data summary

</caption>

<thead>

<tr>

<th style="text-align:left;">

</th>

<th style="text-align:left;">

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Name

</td>

<td style="text-align:left;">

horrorMovies$Worldwide gr…

</td>

</tr>

<tr>

<td style="text-align:left;">

Number of rows

</td>

<td style="text-align:left;">

50

</td>

</tr>

<tr>

<td style="text-align:left;">

Number of columns

</td>

<td style="text-align:left;">

1

</td>

</tr>

<tr>

<td style="text-align:left;">

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

</td>

<td style="text-align:left;">

</td>

</tr>

<tr>

<td style="text-align:left;">

Column type frequency:

</td>

<td style="text-align:left;">

</td>

</tr>

<tr>

<td style="text-align:left;">

numeric

</td>

<td style="text-align:left;">

1

</td>

</tr>

<tr>

<td style="text-align:left;">

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

</td>

<td style="text-align:left;">

</td>

</tr>

<tr>

<td style="text-align:left;">

Group variables

</td>

<td style="text-align:left;">

None

</td>

</tr>

</tbody>

</table>

**Variable type: numeric**

<table>

<thead>

<tr>

<th style="text-align:left;">

skim\_variable

</th>

<th style="text-align:right;">

n\_missing

</th>

<th style="text-align:right;">

complete\_rate

</th>

<th style="text-align:right;">

mean

</th>

<th style="text-align:right;">

sd

</th>

<th style="text-align:right;">

p0

</th>

<th style="text-align:right;">

p25

</th>

<th style="text-align:right;">

p50

</th>

<th style="text-align:right;">

p75

</th>

<th style="text-align:right;">

p100

</th>

<th style="text-align:left;">

hist

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

data

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

347166804

</td>

<td style="text-align:right;">

125496259

</td>

<td style="text-align:right;">

211989043

</td>

<td style="text-align:right;">

248323639

</td>

<td style="text-align:right;">

303386680

</td>

<td style="text-align:right;">

408985684

</td>

<td style="text-align:right;">

700381748

</td>

<td style="text-align:left;">

▇▃▂▂▁

</td>

</tr>

</tbody>

</table>

Which studios tend to do well with making money off horror?

``` r
horrorMovies <- as.data.table(horrorMovies)

sortedStudio <- horrorMovies[, 
                             .(average = mean(`Worldwide gross`)), 
                             by = Studio][order(-average)]

kable_material(kable(sortedStudio), 
               c("striped", "hover"))
```

<table class=" lightable-material lightable-striped lightable-hover" style='font-family: "Source Sans Pro", helvetica, sans-serif; margin-left: auto; margin-right: auto;'>

<thead>

<tr>

<th style="text-align:left;">

Studio

</th>

<th style="text-align:right;">

average

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Hollywood Pictures

</td>

<td style="text-align:right;">

672806292

</td>

</tr>

<tr>

<td style="text-align:left;">

Amblin Entertainment

</td>

<td style="text-align:right;">

591745540

</td>

</tr>

<tr>

<td style="text-align:left;">

Skydance Productions

</td>

<td style="text-align:right;">

540007876

</td>

</tr>

<tr>

<td style="text-align:left;">

Legendary Pictures

</td>

<td style="text-align:right;">

457488104

</td>

</tr>

<tr>

<td style="text-align:left;">

Hoya Productions

</td>

<td style="text-align:right;">

441306145

</td>

</tr>

<tr>

<td style="text-align:left;">

Village Roadshow Pictures

</td>

<td style="text-align:right;">

415438080

</td>

</tr>

<tr>

<td style="text-align:left;">

Warner Bros. Pictures

</td>

<td style="text-align:right;">

411407233

</td>

</tr>

<tr>

<td style="text-align:left;">

Scott Free Productions

</td>

<td style="text-align:right;">

403354469

</td>

</tr>

<tr>

<td style="text-align:left;">

Universal Pictures

</td>

<td style="text-align:right;">

391180701

</td>

</tr>

<tr>

<td style="text-align:left;">

Centropolis Entertainment

</td>

<td style="text-align:right;">

379014294

</td>

</tr>

<tr>

<td style="text-align:left;">

New Line Cinema

</td>

<td style="text-align:right;">

356847923

</td>

</tr>

<tr>

<td style="text-align:left;">

Dino De Laurentiis Company

</td>

<td style="text-align:right;">

351692268

</td>

</tr>

<tr>

<td style="text-align:left;">

Platinum Dunes

</td>

<td style="text-align:right;">

340939361

</td>

</tr>

<tr>

<td style="text-align:left;">

Sommers Company / Stillking Films

</td>

<td style="text-align:right;">

300257475

</td>

</tr>

<tr>

<td style="text-align:left;">

Phoenix Pictures

</td>

<td style="text-align:right;">

294804195

</td>

</tr>

<tr>

<td style="text-align:left;">

Blinding Edge Pictures

</td>

<td style="text-align:right;">

287700698

</td>

</tr>

<tr>

<td style="text-align:left;">

Constantin Film

</td>

<td style="text-align:right;">

284158378

</td>

</tr>

<tr>

<td style="text-align:left;">

Strong Heart/Demme Production

</td>

<td style="text-align:right;">

272742922

</td>

</tr>

<tr>

<td style="text-align:left;">

Blumhouse Productions

</td>

<td style="text-align:right;">

255453100

</td>

</tr>

<tr>

<td style="text-align:left;">

Monkeypaw Productions

</td>

<td style="text-align:right;">

254732150

</td>

</tr>

<tr>

<td style="text-align:left;">

Dimension Films

</td>

<td style="text-align:right;">

249346494

</td>

</tr>

<tr>

<td style="text-align:left;">

Haxan Films

</td>

<td style="text-align:right;">

248639099

</td>

</tr>

<tr>

<td style="text-align:left;">

DreamWorks Pictures

</td>

<td style="text-align:right;">

248218486

</td>

</tr>

<tr>

<td style="text-align:left;">

20th Century Fox

</td>

<td style="text-align:right;">

240891763

</td>

</tr>

<tr>

<td style="text-align:left;">

The Geffen Film Company

</td>

<td style="text-align:right;">

223664608

</td>

</tr>

<tr>

<td style="text-align:left;">

American Zoetrope

</td>

<td style="text-align:right;">

215862692

</td>

</tr>

<tr>

<td style="text-align:left;">

Beacon Pictures

</td>

<td style="text-align:right;">

211989043

</td>

</tr>

</tbody>

</table>

## Plotting Data

Just for the fun of it, let’s do some plotting over the years:

``` r
plot_ly(horrorMovies, x = ~Year, y = ~`Worldwide gross`,
        type = "scatter", mode = "markers",
        text = ~paste("Film: ", Film, '<br>Studio: ', Studio, sep = ""))
```

<!--html_preserve-->

<div id="htmlwidget-ca11398698d973728d3c" class="plotly html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-ca11398698d973728d3c">{"x":{"visdat":{"d428758e4c2d":["function () ","plotlyVisDat"]},"cur_data":"d428758e4c2d","attrs":{"d428758e4c2d":{"x":{},"y":{},"mode":"markers","text":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"Year"},"yaxis":{"domain":[0,1],"automargin":true,"title":"`Worldwide gross`"},"hovermode":"closest","showlegend":false},"source":"A","config":{"showSendToCloud":false},"data":[{"x":[2017,1999,2005,2007,2013,2018,2014,2019,1975,1973,2001,1999,2017,2002,2012,2008,2019,1998,2018,2001,2018,2016,2013,2017,2017,2004,2010,2010,2017,2000,1991,2014,2004,2018,2017,2019,1999,2002,2000,2019,2012,2017,2012,2005,2019,1994,2003,2014,1992,1999],"y":[700381748,672806292,591745540,585349010,540007876,530243742,529076069,473093228,470653000,441306145,433013274,415933406,409231607,408247917,403354469,401128639,385900138,379014294,365550119,351692268,340939361,320392818,319494638,312242626,306515884,300257475,300228084,294804195,278454358,278019771,272742922,257047661,256697520,255498536,255407663,254732150,248639099,248218486,248118121,246985576,245527149,240891763,240004424,230884728,228552591,223664608,220673217,217124280,215862692,211989043],"mode":"markers","text":["Film: It<br>Studio: New Line Cinema","Film: The Sixth Sense<br>Studio: Hollywood Pictures","Film: War of the Worlds<br>Studio: Amblin Entertainment","Film: I Am Legend<br>Studio: Village Roadshow Pictures","Film: World War Z<br>Studio: Skydance Productions","Film: The Meg<br>Studio: Warner Bros. Pictures","Film: Godzilla<br>Studio: Legendary Pictures","Film: It Chapter Two<br>Studio: Warner Bros. Pictures","Film: Jaws<br>Studio: Universal Pictures","Film: The Exorcist<br>Studio: Hoya Productions","Film: The Mummy Returns<br>Studio: Universal Pictures","Film: The Mummy<br>Studio: Universal Pictures","Film: The Mummy<br>Studio: Universal Pictures","Film: Signs<br>Studio: Blinding Edge Pictures","Film: Prometheus<br>Studio: Scott Free Productions","Film: The Mummy: Tomb of the Dragon Emperor<br>Studio: Universal Pictures","Film: Godzilla: King of the Monsters<br>Studio: Legendary Pictures","Film: Godzilla<br>Studio: Centropolis Entertainment","Film: The Nun<br>Studio: New Line Cinema","Film: Hannibal<br>Studio: Dino De Laurentiis Company","Film: A Quiet Place<br>Studio: Platinum Dunes","Film: The Conjuring 2<br>Studio: New Line Cinema","Film: The Conjuring<br>Studio: New Line Cinema","Film: Resident Evil: The Final Chapter<br>Studio: Constantin Film","Film: Annabelle: Creation<br>Studio: New Line Cinema","Film: Van Helsing<br>Studio: Sommers Company / Stillking Films","Film: Resident Evil: Afterlife<br>Studio: Constantin Film","Film: Shutter Island<br>Studio: Phoenix Pictures","Film: Split<br>Studio: Blinding Edge Pictures","Film: Scary Movie<br>Studio: Dimension Films","Film: The Silence of the Lambs<br>Studio: Strong Heart/Demme Production","Film: Annabelle<br>Studio: New Line Cinema","Film: The Village<br>Studio: Blinding Edge Pictures","Film: Halloween<br>Studio: Blumhouse Productions","Film: Get Out<br>Studio: Blumhouse Productions","Film: Us<br>Studio: Monkeypaw Productions","Film: The Blair Witch Project<br>Studio: Haxan Films","Film: The Ring<br>Studio: DreamWorks Pictures","Film: Unbreakable<br>Studio: Blinding Edge Pictures","Film: Glass<br>Studio: Blinding Edge Pictures","Film: Dark Shadows<br>Studio: Village Roadshow Pictures","Film: Alien: Covenant<br>Studio: 20th Century Fox","Film: Resident Evil: Retribution<br>Studio: Constantin Film","Film: Constantine<br>Studio: Warner Bros. Pictures","Film: Annabelle Comes Home<br>Studio: New Line Cinema","Film: Interview with the Vampire<br>Studio: The Geffen Film Company","Film: Scary Movie 3<br>Studio: Dimension Films","Film: Dracula Untold<br>Studio: Universal Pictures","Film: Bram Stoker's Dracula<br>Studio: American Zoetrope","Film: End of Days<br>Studio: Beacon Pictures"],"type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

We saw some averages for the studios earlier, so let’s get a better idea
about each studios distribution within the list:

``` r
plot_ly(horrorMovies, x = ~`Worldwide gross`, y = ~Studio, 
        type = "box")
```

<!--html_preserve-->

<div id="htmlwidget-84513f88c1ef1d28f5b2" class="plotly html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-84513f88c1ef1d28f5b2">{"x":{"visdat":{"d428754c71eb":["function () ","plotlyVisDat"]},"cur_data":"d428754c71eb","attrs":{"d428754c71eb":{"x":{},"y":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"box"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"`Worldwide gross`"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Studio","type":"category","categoryorder":"array","categoryarray":["20th Century Fox","Amblin Entertainment","American Zoetrope","Beacon Pictures","Blinding Edge Pictures","Blumhouse Productions","Centropolis Entertainment","Constantin Film","Dimension Films","Dino De Laurentiis Company","DreamWorks Pictures","Haxan Films","Hollywood Pictures","Hoya Productions","Legendary Pictures","Monkeypaw Productions","New Line Cinema","Phoenix Pictures","Platinum Dunes","Scott Free Productions","Skydance Productions","Sommers Company / Stillking Films","Strong Heart/Demme Production","The Geffen Film Company","Universal Pictures","Village Roadshow Pictures","Warner Bros. Pictures"]},"hovermode":"closest","showlegend":false},"source":"A","config":{"showSendToCloud":false},"data":[{"fillcolor":"rgba(31,119,180,0.5)","x":[700381748,672806292,591745540,585349010,540007876,530243742,529076069,473093228,470653000,441306145,433013274,415933406,409231607,408247917,403354469,401128639,385900138,379014294,365550119,351692268,340939361,320392818,319494638,312242626,306515884,300257475,300228084,294804195,278454358,278019771,272742922,257047661,256697520,255498536,255407663,254732150,248639099,248218486,248118121,246985576,245527149,240891763,240004424,230884728,228552591,223664608,220673217,217124280,215862692,211989043],"y":["New Line Cinema","Hollywood Pictures","Amblin Entertainment","Village Roadshow Pictures","Skydance Productions","Warner Bros. Pictures","Legendary Pictures","Warner Bros. Pictures","Universal Pictures","Hoya Productions","Universal Pictures","Universal Pictures","Universal Pictures","Blinding Edge Pictures","Scott Free Productions","Universal Pictures","Legendary Pictures","Centropolis Entertainment","New Line Cinema","Dino De Laurentiis Company","Platinum Dunes","New Line Cinema","New Line Cinema","Constantin Film","New Line Cinema","Sommers Company / Stillking Films","Constantin Film","Phoenix Pictures","Blinding Edge Pictures","Dimension Films","Strong Heart/Demme Production","New Line Cinema","Blinding Edge Pictures","Blumhouse Productions","Blumhouse Productions","Monkeypaw Productions","Haxan Films","DreamWorks Pictures","Blinding Edge Pictures","Blinding Edge Pictures","Village Roadshow Pictures","20th Century Fox","Constantin Film","Warner Bros. Pictures","New Line Cinema","The Geffen Film Company","Dimension Films","Universal Pictures","American Zoetrope","Beacon Pictures"],"type":"box","orientation":"h","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

## Models

Let’s see if we can get into any relationships between movie information
and money.

We can load in our `horrorOut` data:

``` r
load("data/horrorOut.RData")
```

And join it with our highest-grossing data:

``` r
horrorOut$Year <- as.integer(horrorOut$Year)

allData <- merge.data.table(horrorMovies, horrorOut, 
                            by.x = c("Film", "Year"), 
                            by.y = c("Title", "Year"))
dim(allData)
```

    ## [1] 48 32

It looks like we lost a few movies\!

I suppose you never know what might be creeping around with your data
until you try to work with it\!

![](pennywise.gif)

``` r
horrorMovies$Film[!horrorMovies$Film %in% horrorOut$Title]
```

    ## [1] "Resident Evil: The Final Chapter" "Interview with the Vampire"

``` r
horrorOut$Title[!horrorMovies$Film %in% horrorOut$Title]
```

    ## [1] "Resident Evil the Final Chapter: Explore the Hive" 
    ## [2] "Interview with the Vampire: The Vampire Chronicles"

That’s just silly…but since it is just a few, we won’t worry about a
fuzzy join.

``` r
horrorMovies$Film[
  horrorMovies$Film == "Resident Evil: The Final Chapter"
  ] <- "Resident Evil the Final Chapter: Explore the Hive"

horrorMovies$Film[
  horrorMovies$Film == "Interview with the Vampire"
  ] <- "Interview with the Vampire: The Vampire Chronicles"
```

Now, we should be set to join:

``` r
allData <- merge.data.table(horrorMovies, horrorOut, 
                            by.x = c("Film", "Year"), 
                            by.y = c("Title", "Year"))
```

As per usual, we will need to clean up some variables before we can use
them:

``` r
ratingVars <- c("Internet Movie Database", 
                "Metacritic", 
                "Rotten Tomatoes")

# We need to remove special characters in the ratings columns:

allData[, 
        (ratingVars) := lapply(.SD, function(x) {
          as.numeric(gsub("/[0-1]+|%", "", x))
        }), 
        .SDcols = ratingVars]

# And let's multiply IMDB by 10 to put it on the same scale as the others:

allData$`Internet Movie Database` <- allData$`Internet Movie Database` * 10
```
