Horror Films
================

  - [Scraping Data](#scraping-data)
  - [Plotting Data](#plotting-data)

## Scraping Data

Since we are rolling up on the spookiest holiday, it might be worth
pulling in some data on horror movies. Not surprisingly, Wikipedia has
some information about the top-grossing horror movies of all time.

``` r
library(rvest)

topGrossingLink <- "https://en.wikipedia.org/wiki/List_of_highest-grossing_horror_films"

horrorMovies <- read_html(topGrossingLink) %>% 
  html_table(fill = TRUE) %>% 
  `[[`(1)

rmarkdown::paged_table(horrorMovies)
```

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["Rank"],"name":[1],"type":["int"],"align":["right"]},{"label":["Film"],"name":[2],"type":["chr"],"align":["left"]},{"label":["Worldwide gross"],"name":[3],"type":["chr"],"align":["left"]},{"label":["Year"],"name":[4],"type":["int"],"align":["right"]},{"label":["Franchise or basis"],"name":[5],"type":["chr"],"align":["left"]},{"label":["Studio"],"name":[6],"type":["chr"],"align":["left"]},{"label":["Ref"],"name":[7],"type":["chr"],"align":["left"]}],"data":[{"1":"1","2":"It","3":"$700,381,748","4":"2017","5":"It","6":"New Line Cinema","7":"[1]"},{"1":"2","2":"The Sixth Sense","3":"$672,806,292","4":"1999","5":"N/A","6":"Hollywood Pictures","7":"[2]"},{"1":"3","2":"War of the Worlds","3":"$591,745,540","4":"2005","5":"The War of the Worlds","6":"Amblin Entertainment","7":"[3]"},{"1":"4","2":"I Am Legend","3":"$585,349,010","4":"2007","5":"I Am Legend","6":"Village Roadshow Pictures","7":"[4]"},{"1":"5","2":"World War Z","3":"$540,007,876","4":"2013","5":"World War Z","6":"Skydance Productions","7":"[5]"},{"1":"6","2":"The Meg","3":"$530,243,742","4":"2018","5":"The Meg","6":"Warner Bros. Pictures","7":"[6]"},{"1":"7","2":"Godzilla","3":"$529,076,069","4":"2014","5":"Godzilla","6":"Legendary Pictures","7":"[7]"},{"1":"8","2":"It Chapter Two","3":"$473,093,228","4":"2019","5":"It","6":"Warner Bros. Pictures","7":"[8]"},{"1":"9","2":"Jaws","3":"$470,653,000","4":"1975","5":"Jaws","6":"Universal Pictures","7":"[9]"},{"1":"10","2":"The Exorcist","3":"$441,306,145","4":"1973","5":"The Exorcist","6":"Hoya Productions","7":"[10]"},{"1":"11","2":"The Mummy Returns","3":"$433,013,274","4":"2001","5":"The Mummy","6":"Universal Pictures","7":"[11]"},{"1":"12","2":"The Mummy","3":"$415,933,406","4":"1999","5":"The Mummy","6":"Universal Pictures","7":"[12]"},{"1":"13","2":"The Mummy","3":"$409,231,607","4":"2017","5":"The Mummy","6":"Universal Pictures","7":"[13]"},{"1":"14","2":"Signs","3":"$408,247,917","4":"2002","5":"N/A","6":"Blinding Edge Pictures","7":"[14]"},{"1":"15","2":"Prometheus","3":"$403,354,469","4":"2012","5":"Alien","6":"Scott Free Productions","7":"[15]"},{"1":"16","2":"The Mummy: Tomb of the Dragon Emperor","3":"$401,128,639","4":"2008","5":"The Mummy","6":"Universal Pictures","7":"[16]"},{"1":"17","2":"Godzilla: King of the Monsters","3":"$385,900,138","4":"2019","5":"Godzilla","6":"Legendary Pictures","7":"[17]"},{"1":"18","2":"Godzilla","3":"$379,014,294","4":"1998","5":"Godzilla","6":"Centropolis Entertainment","7":"[18]"},{"1":"19","2":"The Nun","3":"$365,550,119","4":"2018","5":"The Conjuring Universe","6":"New Line Cinema","7":"[19]"},{"1":"20","2":"Hannibal","3":"$351,692,268","4":"2001","5":"Hannibal Lecter","6":"Dino De Laurentiis Company","7":"[20]"},{"1":"21","2":"A Quiet Place","3":"$340,939,361","4":"2018","5":"N/A","6":"Platinum Dunes","7":"[21]"},{"1":"22","2":"The Conjuring 2","3":"$320,392,818","4":"2016","5":"The Conjuring Universe","6":"New Line Cinema","7":"[19]"},{"1":"23","2":"The Conjuring","3":"$319,494,638","4":"2013","5":"The Conjuring Universe","6":"New Line Cinema","7":"[19]"},{"1":"24","2":"Resident Evil: The Final Chapter","3":"$312,242,626","4":"2017","5":"Resident Evil","6":"Constantin Film","7":"[22]"},{"1":"25","2":"Annabelle: Creation","3":"$306,515,884","4":"2017","5":"The Conjuring Universe","6":"New Line Cinema","7":"[19]"},{"1":"26","2":"Van Helsing","3":"$300,257,475","4":"2004","5":"Dracula","6":"Sommers Company / Stillking Films","7":"[23]"},{"1":"27","2":"Resident Evil: Afterlife","3":"$300,228,084","4":"2010","5":"Resident Evil","6":"Constantin Film","7":"[24]"},{"1":"28","2":"Shutter Island","3":"$294,804,195","4":"2010","5":"Shutter Island","6":"Phoenix Pictures","7":"[25]"},{"1":"29","2":"Split","3":"$278,454,358","4":"2017","5":"Unbreakable","6":"Blinding Edge Pictures","7":"[26]"},{"1":"30","2":"Scary Movie","3":"$278,019,771","4":"2000","5":"Scary Movie","6":"Dimension Films","7":"[27]"},{"1":"31","2":"The Silence of the Lambs","3":"$272,742,922","4":"1991","5":"Clarice Starling","6":"Strong Heart/Demme Production","7":"[28]"},{"1":"32","2":"Annabelle","3":"$257,047,661","4":"2014","5":"The Conjuring Universe","6":"New Line Cinema","7":"[19]"},{"1":"33","2":"The Village","3":"$256,697,520","4":"2004","5":"N/A","6":"Blinding Edge Pictures","7":"[29]"},{"1":"34","2":"Halloween","3":"$255,498,536","4":"2018","5":"Halloween","6":"Blumhouse Productions","7":"[30]"},{"1":"35","2":"Get Out","3":"$255,407,663","4":"2017","5":"N/A","6":"Blumhouse Productions","7":"[31]"},{"1":"36","2":"Us","3":"$254,732,150","4":"2019","5":"N/A","6":"Monkeypaw Productions","7":"[32]"},{"1":"37","2":"The Blair Witch Project","3":"$248,639,099","4":"1999","5":"Blair Witch","6":"Haxan Films","7":"[33]"},{"1":"38","2":"The Ring","3":"$248,218,486","4":"2002","5":"The Ring","6":"DreamWorks Pictures","7":"[34]"},{"1":"39","2":"Unbreakable","3":"$248,118,121","4":"2000","5":"Unbreakable","6":"Blinding Edge Pictures","7":"[35]"},{"1":"40","2":"Glass","3":"$246,985,576","4":"2019","5":"Unbreakable","6":"Blinding Edge Pictures","7":"[36]"},{"1":"41","2":"Dark Shadows","3":"$245,527,149","4":"2012","5":"Dark Shadows","6":"Village Roadshow Pictures","7":"[37]"},{"1":"42","2":"Alien: Covenant","3":"$240,891,763","4":"2017","5":"Alien","6":"20th Century Fox","7":"[38]"},{"1":"43","2":"Resident Evil: Retribution","3":"$240,004,424","4":"2012","5":"Resident Evil","6":"Constantin Film","7":"[39]"},{"1":"44","2":"Constantine","3":"$230,884,728","4":"2005","5":"Hellblazer","6":"Warner Bros. Pictures","7":"[40]"},{"1":"45","2":"Annabelle Comes Home","3":"$228,552,591","4":"2019","5":"The Conjuring Universe","6":"New Line Cinema","7":"[41]"},{"1":"46","2":"Interview with the Vampire","3":"$223,664,608","4":"1994","5":"The Vampire Chronicles","6":"The Geffen Film Company","7":"[42]"},{"1":"47","2":"Scary Movie 3","3":"$220,673,217","4":"2003","5":"Scary Movie","6":"Dimension Films","7":"[43]"},{"1":"48","2":"Dracula Untold","3":"$217,124,280","4":"2014","5":"Dracula","6":"Universal Pictures","7":"[44]"},{"1":"49","2":"Bram Stoker's Dracula","3":"$215,862,692","4":"1992","5":"Dracula","6":"American Zoetrope","7":"[45]"},{"1":"50","2":"End of Days","3":"$211,989,043","4":"1999","5":"N/A","6":"Beacon Pictures","7":"[46]"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

As per usual, we will likely need to clean some of those dollar values
up just a little bit:

``` r
horrorMovies$`Worldwide gross` <- gsub("\\$|,", 
                                       "", 
                                       horrorMovies$`Worldwide gross`)

horrorMovies$`Worldwide gross` <- as.numeric(horrorMovies$`Worldwide gross`)
```

All looks good now\!

|                                                  |                            |
| :----------------------------------------------- | :------------------------- |
| Name                                             | horrorMovies$Worldwide gr… |
| Number of rows                                   | 50                         |
| Number of columns                                | 1                          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |                            |
| Column type frequency:                           |                            |
| numeric                                          | 1                          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |                            |
| Group variables                                  | None                       |

Data summary

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate |      mean |        sd |        p0 |       p25 |       p50 |       p75 |      p100 | hist  |
| :------------- | ---------: | -------------: | --------: | --------: | --------: | --------: | --------: | --------: | --------: | :---- |
| data           |          0 |              1 | 347166804 | 125496259 | 211989043 | 248323639 | 303386680 | 408985684 | 700381748 | ▇▃▂▂▁ |

Which studios tend to do well with making money off horror?

``` r
library(data.table)

horrorMovies <- as.data.table(horrorMovies)

sortedStudio <- horrorMovies[, 
                             .(average = mean(`Worldwide gross`)), 
                             by = Studio][order(-average)]

rmarkdown::paged_table(sortedStudio)
```

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["Studio"],"name":[1],"type":["chr"],"align":["left"]},{"label":["average"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"Hollywood Pictures","2":"672806292"},{"1":"Amblin Entertainment","2":"591745540"},{"1":"Skydance Productions","2":"540007876"},{"1":"Legendary Pictures","2":"457488104"},{"1":"Hoya Productions","2":"441306145"},{"1":"Village Roadshow Pictures","2":"415438080"},{"1":"Warner Bros. Pictures","2":"411407233"},{"1":"Scott Free Productions","2":"403354469"},{"1":"Universal Pictures","2":"391180701"},{"1":"Centropolis Entertainment","2":"379014294"},{"1":"New Line Cinema","2":"356847923"},{"1":"Dino De Laurentiis Company","2":"351692268"},{"1":"Platinum Dunes","2":"340939361"},{"1":"Sommers Company / Stillking Films","2":"300257475"},{"1":"Phoenix Pictures","2":"294804195"},{"1":"Blinding Edge Pictures","2":"287700698"},{"1":"Constantin Film","2":"284158378"},{"1":"Strong Heart/Demme Production","2":"272742922"},{"1":"Blumhouse Productions","2":"255453100"},{"1":"Monkeypaw Productions","2":"254732150"},{"1":"Dimension Films","2":"249346494"},{"1":"Haxan Films","2":"248639099"},{"1":"DreamWorks Pictures","2":"248218486"},{"1":"20th Century Fox","2":"240891763"},{"1":"The Geffen Film Company","2":"223664608"},{"1":"American Zoetrope","2":"215862692"},{"1":"Beacon Pictures","2":"211989043"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

## Plotting Data

Just for the fun of it, let’s do some plotting over the years:

``` r
library(plotly)

plot_ly(horrorMovies, x = ~Year, y = ~`Worldwide gross`,
        type = "scatter", mode = "markers",
        text = ~paste("Film: ", Film, '<br>Studio: ', Studio, sep = ""))
```

<!--html_preserve-->

<div id="htmlwidget-9456921f11dd1a50f6e9" class="plotly html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-9456921f11dd1a50f6e9">{"x":{"visdat":{"cc833d26d430":["function () ","plotlyVisDat"]},"cur_data":"cc833d26d430","attrs":{"cc833d26d430":{"x":{},"y":{},"mode":"markers","text":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"Year"},"yaxis":{"domain":[0,1],"automargin":true,"title":"`Worldwide gross`"},"hovermode":"closest","showlegend":false},"source":"A","config":{"showSendToCloud":false},"data":[{"x":[2017,1999,2005,2007,2013,2018,2014,2019,1975,1973,2001,1999,2017,2002,2012,2008,2019,1998,2018,2001,2018,2016,2013,2017,2017,2004,2010,2010,2017,2000,1991,2014,2004,2018,2017,2019,1999,2002,2000,2019,2012,2017,2012,2005,2019,1994,2003,2014,1992,1999],"y":[700381748,672806292,591745540,585349010,540007876,530243742,529076069,473093228,470653000,441306145,433013274,415933406,409231607,408247917,403354469,401128639,385900138,379014294,365550119,351692268,340939361,320392818,319494638,312242626,306515884,300257475,300228084,294804195,278454358,278019771,272742922,257047661,256697520,255498536,255407663,254732150,248639099,248218486,248118121,246985576,245527149,240891763,240004424,230884728,228552591,223664608,220673217,217124280,215862692,211989043],"mode":"markers","text":["Film: It<br>Studio: New Line Cinema","Film: The Sixth Sense<br>Studio: Hollywood Pictures","Film: War of the Worlds<br>Studio: Amblin Entertainment","Film: I Am Legend<br>Studio: Village Roadshow Pictures","Film: World War Z<br>Studio: Skydance Productions","Film: The Meg<br>Studio: Warner Bros. Pictures","Film: Godzilla<br>Studio: Legendary Pictures","Film: It Chapter Two<br>Studio: Warner Bros. Pictures","Film: Jaws<br>Studio: Universal Pictures","Film: The Exorcist<br>Studio: Hoya Productions","Film: The Mummy Returns<br>Studio: Universal Pictures","Film: The Mummy<br>Studio: Universal Pictures","Film: The Mummy<br>Studio: Universal Pictures","Film: Signs<br>Studio: Blinding Edge Pictures","Film: Prometheus<br>Studio: Scott Free Productions","Film: The Mummy: Tomb of the Dragon Emperor<br>Studio: Universal Pictures","Film: Godzilla: King of the Monsters<br>Studio: Legendary Pictures","Film: Godzilla<br>Studio: Centropolis Entertainment","Film: The Nun<br>Studio: New Line Cinema","Film: Hannibal<br>Studio: Dino De Laurentiis Company","Film: A Quiet Place<br>Studio: Platinum Dunes","Film: The Conjuring 2<br>Studio: New Line Cinema","Film: The Conjuring<br>Studio: New Line Cinema","Film: Resident Evil: The Final Chapter<br>Studio: Constantin Film","Film: Annabelle: Creation<br>Studio: New Line Cinema","Film: Van Helsing<br>Studio: Sommers Company / Stillking Films","Film: Resident Evil: Afterlife<br>Studio: Constantin Film","Film: Shutter Island<br>Studio: Phoenix Pictures","Film: Split<br>Studio: Blinding Edge Pictures","Film: Scary Movie<br>Studio: Dimension Films","Film: The Silence of the Lambs<br>Studio: Strong Heart/Demme Production","Film: Annabelle<br>Studio: New Line Cinema","Film: The Village<br>Studio: Blinding Edge Pictures","Film: Halloween<br>Studio: Blumhouse Productions","Film: Get Out<br>Studio: Blumhouse Productions","Film: Us<br>Studio: Monkeypaw Productions","Film: The Blair Witch Project<br>Studio: Haxan Films","Film: The Ring<br>Studio: DreamWorks Pictures","Film: Unbreakable<br>Studio: Blinding Edge Pictures","Film: Glass<br>Studio: Blinding Edge Pictures","Film: Dark Shadows<br>Studio: Village Roadshow Pictures","Film: Alien: Covenant<br>Studio: 20th Century Fox","Film: Resident Evil: Retribution<br>Studio: Constantin Film","Film: Constantine<br>Studio: Warner Bros. Pictures","Film: Annabelle Comes Home<br>Studio: New Line Cinema","Film: Interview with the Vampire<br>Studio: The Geffen Film Company","Film: Scary Movie 3<br>Studio: Dimension Films","Film: Dracula Untold<br>Studio: Universal Pictures","Film: Bram Stoker's Dracula<br>Studio: American Zoetrope","Film: End of Days<br>Studio: Beacon Pictures"],"type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

We saw some averages for the studios earlier, so let’s get a better idea
about each studios distribution within the list:

``` r
plot_ly(horrorMovies, x = ~`Worldwide gross`, y = ~Studio, 
        type = "box")
```

<!--html_preserve-->

<div id="htmlwidget-0ce46afb543ed6fd1009" class="plotly html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-0ce46afb543ed6fd1009">{"x":{"visdat":{"cc8345cbd4c9":["function () ","plotlyVisDat"]},"cur_data":"cc8345cbd4c9","attrs":{"cc8345cbd4c9":{"x":{},"y":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"box"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"`Worldwide gross`"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Studio","type":"category","categoryorder":"array","categoryarray":["20th Century Fox","Amblin Entertainment","American Zoetrope","Beacon Pictures","Blinding Edge Pictures","Blumhouse Productions","Centropolis Entertainment","Constantin Film","Dimension Films","Dino De Laurentiis Company","DreamWorks Pictures","Haxan Films","Hollywood Pictures","Hoya Productions","Legendary Pictures","Monkeypaw Productions","New Line Cinema","Phoenix Pictures","Platinum Dunes","Scott Free Productions","Skydance Productions","Sommers Company / Stillking Films","Strong Heart/Demme Production","The Geffen Film Company","Universal Pictures","Village Roadshow Pictures","Warner Bros. Pictures"]},"hovermode":"closest","showlegend":false},"source":"A","config":{"showSendToCloud":false},"data":[{"fillcolor":"rgba(31,119,180,0.5)","x":[700381748,672806292,591745540,585349010,540007876,530243742,529076069,473093228,470653000,441306145,433013274,415933406,409231607,408247917,403354469,401128639,385900138,379014294,365550119,351692268,340939361,320392818,319494638,312242626,306515884,300257475,300228084,294804195,278454358,278019771,272742922,257047661,256697520,255498536,255407663,254732150,248639099,248218486,248118121,246985576,245527149,240891763,240004424,230884728,228552591,223664608,220673217,217124280,215862692,211989043],"y":["New Line Cinema","Hollywood Pictures","Amblin Entertainment","Village Roadshow Pictures","Skydance Productions","Warner Bros. Pictures","Legendary Pictures","Warner Bros. Pictures","Universal Pictures","Hoya Productions","Universal Pictures","Universal Pictures","Universal Pictures","Blinding Edge Pictures","Scott Free Productions","Universal Pictures","Legendary Pictures","Centropolis Entertainment","New Line Cinema","Dino De Laurentiis Company","Platinum Dunes","New Line Cinema","New Line Cinema","Constantin Film","New Line Cinema","Sommers Company / Stillking Films","Constantin Film","Phoenix Pictures","Blinding Edge Pictures","Dimension Films","Strong Heart/Demme Production","New Line Cinema","Blinding Edge Pictures","Blumhouse Productions","Blumhouse Productions","Monkeypaw Productions","Haxan Films","DreamWorks Pictures","Blinding Edge Pictures","Blinding Edge Pictures","Village Roadshow Pictures","20th Century Fox","Constantin Film","Warner Bros. Pictures","New Line Cinema","The Geffen Film Company","Dimension Films","Universal Pictures","American Zoetrope","Beacon Pictures"],"type":"box","orientation":"h","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->
