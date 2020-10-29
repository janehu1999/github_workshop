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

DT::datatable(horrorMovies)
```

<!--html_preserve-->

<div id="htmlwidget-6a79e6f282225669fc0b" class="datatables html-widget" style="width:100%;height:auto;">

</div>

<script type="application/json" data-for="htmlwidget-6a79e6f282225669fc0b">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"],[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50],["It","The Sixth Sense","War of the Worlds","I Am Legend","World War Z","The Meg","Godzilla","It Chapter Two","Jaws","The Exorcist","The Mummy Returns","The Mummy","The Mummy","Signs","Prometheus","The Mummy: Tomb of the Dragon Emperor","Godzilla: King of the Monsters","Godzilla","The Nun","Hannibal","A Quiet Place","The Conjuring 2","The Conjuring","Resident Evil: The Final Chapter","Annabelle: Creation","Van Helsing","Resident Evil: Afterlife","Shutter Island","Split","Scary Movie","The Silence of the Lambs","Annabelle","The Village","Halloween","Get Out","Us","The Blair Witch Project","The Ring","Unbreakable","Glass","Dark Shadows","Alien: Covenant","Resident Evil: Retribution","Constantine","Annabelle Comes Home","Interview with the Vampire","Scary Movie 3","Dracula Untold","Bram Stoker's Dracula","End of Days"],["$700,381,748","$672,806,292","$591,745,540","$585,349,010","$540,007,876","$530,243,742","$529,076,069","$473,093,228","$470,653,000","$441,306,145","$433,013,274","$415,933,406","$409,231,607","$408,247,917","$403,354,469","$401,128,639","$385,900,138","$379,014,294","$365,550,119","$351,692,268","$340,939,361","$320,392,818","$319,494,638","$312,242,626","$306,515,884","$300,257,475","$300,228,084","$294,804,195","$278,454,358","$278,019,771","$272,742,922","$257,047,661","$256,697,520","$255,498,536","$255,407,663","$254,732,150","$248,639,099","$248,218,486","$248,118,121","$246,985,576","$245,527,149","$240,891,763","$240,004,424","$230,884,728","$228,552,591","$223,664,608","$220,673,217","$217,124,280","$215,862,692","$211,989,043"],[2017,1999,2005,2007,2013,2018,2014,2019,1975,1973,2001,1999,2017,2002,2012,2008,2019,1998,2018,2001,2018,2016,2013,2017,2017,2004,2010,2010,2017,2000,1991,2014,2004,2018,2017,2019,1999,2002,2000,2019,2012,2017,2012,2005,2019,1994,2003,2014,1992,1999],["It","N/A","The War of the Worlds","I Am Legend","World War Z","The Meg","Godzilla","It","Jaws","The Exorcist","The Mummy","The Mummy","The Mummy","N/A","Alien","The Mummy","Godzilla","Godzilla","The Conjuring Universe","Hannibal Lecter","N/A","The Conjuring Universe","The Conjuring Universe","Resident Evil","The Conjuring Universe","Dracula","Resident Evil","Shutter Island","Unbreakable","Scary Movie","Clarice Starling","The Conjuring Universe","N/A","Halloween","N/A","N/A","Blair Witch","The Ring","Unbreakable","Unbreakable","Dark Shadows","Alien","Resident Evil","Hellblazer","The Conjuring Universe","The Vampire Chronicles","Scary Movie","Dracula","Dracula","N/A"],["New Line Cinema","Hollywood Pictures","Amblin Entertainment","Village Roadshow Pictures","Skydance Productions","Warner Bros. Pictures","Legendary Pictures","Warner Bros. Pictures","Universal Pictures","Hoya Productions","Universal Pictures","Universal Pictures","Universal Pictures","Blinding Edge Pictures","Scott Free Productions","Universal Pictures","Legendary Pictures","Centropolis Entertainment","New Line Cinema","Dino De Laurentiis Company","Platinum Dunes","New Line Cinema","New Line Cinema","Constantin Film","New Line Cinema","Sommers Company / Stillking Films","Constantin Film","Phoenix Pictures","Blinding Edge Pictures","Dimension Films","Strong Heart/Demme Production","New Line Cinema","Blinding Edge Pictures","Blumhouse Productions","Blumhouse Productions","Monkeypaw Productions","Haxan Films","DreamWorks Pictures","Blinding Edge Pictures","Blinding Edge Pictures","Village Roadshow Pictures","20th Century Fox","Constantin Film","Warner Bros. Pictures","New Line Cinema","The Geffen Film Company","Dimension Films","Universal Pictures","American Zoetrope","Beacon Pictures"],["[1]","[2]","[3]","[4]","[5]","[6]","[7]","[8]","[9]","[10]","[11]","[12]","[13]","[14]","[15]","[16]","[17]","[18]","[19]","[20]","[21]","[19]","[19]","[22]","[19]","[23]","[24]","[25]","[26]","[27]","[28]","[19]","[29]","[30]","[31]","[32]","[33]","[34]","[35]","[36]","[37]","[38]","[39]","[40]","[41]","[42]","[43]","[44]","[45]","[46]"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Rank<\/th>\n      <th>Film<\/th>\n      <th>Worldwide gross<\/th>\n      <th>Year<\/th>\n      <th>Franchise or basis<\/th>\n      <th>Studio<\/th>\n      <th>Ref<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,4]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

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

<div id="htmlwidget-f90d8e80222ac84bf0ce" class="plotly html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-f90d8e80222ac84bf0ce">{"x":{"visdat":{"ccf7121d142c":["function () ","plotlyVisDat"]},"cur_data":"ccf7121d142c","attrs":{"ccf7121d142c":{"x":{},"y":{},"mode":"markers","text":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"Year"},"yaxis":{"domain":[0,1],"automargin":true,"title":"`Worldwide gross`"},"hovermode":"closest","showlegend":false},"source":"A","config":{"showSendToCloud":false},"data":[{"x":[2017,1999,2005,2007,2013,2018,2014,2019,1975,1973,2001,1999,2017,2002,2012,2008,2019,1998,2018,2001,2018,2016,2013,2017,2017,2004,2010,2010,2017,2000,1991,2014,2004,2018,2017,2019,1999,2002,2000,2019,2012,2017,2012,2005,2019,1994,2003,2014,1992,1999],"y":[700381748,672806292,591745540,585349010,540007876,530243742,529076069,473093228,470653000,441306145,433013274,415933406,409231607,408247917,403354469,401128639,385900138,379014294,365550119,351692268,340939361,320392818,319494638,312242626,306515884,300257475,300228084,294804195,278454358,278019771,272742922,257047661,256697520,255498536,255407663,254732150,248639099,248218486,248118121,246985576,245527149,240891763,240004424,230884728,228552591,223664608,220673217,217124280,215862692,211989043],"mode":"markers","text":["Film: It<br>Studio: New Line Cinema","Film: The Sixth Sense<br>Studio: Hollywood Pictures","Film: War of the Worlds<br>Studio: Amblin Entertainment","Film: I Am Legend<br>Studio: Village Roadshow Pictures","Film: World War Z<br>Studio: Skydance Productions","Film: The Meg<br>Studio: Warner Bros. Pictures","Film: Godzilla<br>Studio: Legendary Pictures","Film: It Chapter Two<br>Studio: Warner Bros. Pictures","Film: Jaws<br>Studio: Universal Pictures","Film: The Exorcist<br>Studio: Hoya Productions","Film: The Mummy Returns<br>Studio: Universal Pictures","Film: The Mummy<br>Studio: Universal Pictures","Film: The Mummy<br>Studio: Universal Pictures","Film: Signs<br>Studio: Blinding Edge Pictures","Film: Prometheus<br>Studio: Scott Free Productions","Film: The Mummy: Tomb of the Dragon Emperor<br>Studio: Universal Pictures","Film: Godzilla: King of the Monsters<br>Studio: Legendary Pictures","Film: Godzilla<br>Studio: Centropolis Entertainment","Film: The Nun<br>Studio: New Line Cinema","Film: Hannibal<br>Studio: Dino De Laurentiis Company","Film: A Quiet Place<br>Studio: Platinum Dunes","Film: The Conjuring 2<br>Studio: New Line Cinema","Film: The Conjuring<br>Studio: New Line Cinema","Film: Resident Evil: The Final Chapter<br>Studio: Constantin Film","Film: Annabelle: Creation<br>Studio: New Line Cinema","Film: Van Helsing<br>Studio: Sommers Company / Stillking Films","Film: Resident Evil: Afterlife<br>Studio: Constantin Film","Film: Shutter Island<br>Studio: Phoenix Pictures","Film: Split<br>Studio: Blinding Edge Pictures","Film: Scary Movie<br>Studio: Dimension Films","Film: The Silence of the Lambs<br>Studio: Strong Heart/Demme Production","Film: Annabelle<br>Studio: New Line Cinema","Film: The Village<br>Studio: Blinding Edge Pictures","Film: Halloween<br>Studio: Blumhouse Productions","Film: Get Out<br>Studio: Blumhouse Productions","Film: Us<br>Studio: Monkeypaw Productions","Film: The Blair Witch Project<br>Studio: Haxan Films","Film: The Ring<br>Studio: DreamWorks Pictures","Film: Unbreakable<br>Studio: Blinding Edge Pictures","Film: Glass<br>Studio: Blinding Edge Pictures","Film: Dark Shadows<br>Studio: Village Roadshow Pictures","Film: Alien: Covenant<br>Studio: 20th Century Fox","Film: Resident Evil: Retribution<br>Studio: Constantin Film","Film: Constantine<br>Studio: Warner Bros. Pictures","Film: Annabelle Comes Home<br>Studio: New Line Cinema","Film: Interview with the Vampire<br>Studio: The Geffen Film Company","Film: Scary Movie 3<br>Studio: Dimension Films","Film: Dracula Untold<br>Studio: Universal Pictures","Film: Bram Stoker's Dracula<br>Studio: American Zoetrope","Film: End of Days<br>Studio: Beacon Pictures"],"type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

We saw some averages for the studios earlier, so let’s get a better idea
about each studios distribution within the list:

``` r
plot_ly(horrorMovies, x = ~`Worldwide gross`, y = ~Studio, 
        type = "box")
```

<!--html_preserve-->

<div id="htmlwidget-1526790ed6bc8b352306" class="plotly html-widget" style="width:672px;height:480px;">

</div>

<script type="application/json" data-for="htmlwidget-1526790ed6bc8b352306">{"x":{"visdat":{"ccf7431be8e6":["function () ","plotlyVisDat"]},"cur_data":"ccf7431be8e6","attrs":{"ccf7431be8e6":{"x":{},"y":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"box"}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"xaxis":{"domain":[0,1],"automargin":true,"title":"`Worldwide gross`"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Studio","type":"category","categoryorder":"array","categoryarray":["20th Century Fox","Amblin Entertainment","American Zoetrope","Beacon Pictures","Blinding Edge Pictures","Blumhouse Productions","Centropolis Entertainment","Constantin Film","Dimension Films","Dino De Laurentiis Company","DreamWorks Pictures","Haxan Films","Hollywood Pictures","Hoya Productions","Legendary Pictures","Monkeypaw Productions","New Line Cinema","Phoenix Pictures","Platinum Dunes","Scott Free Productions","Skydance Productions","Sommers Company / Stillking Films","Strong Heart/Demme Production","The Geffen Film Company","Universal Pictures","Village Roadshow Pictures","Warner Bros. Pictures"]},"hovermode":"closest","showlegend":false},"source":"A","config":{"showSendToCloud":false},"data":[{"fillcolor":"rgba(31,119,180,0.5)","x":[700381748,672806292,591745540,585349010,540007876,530243742,529076069,473093228,470653000,441306145,433013274,415933406,409231607,408247917,403354469,401128639,385900138,379014294,365550119,351692268,340939361,320392818,319494638,312242626,306515884,300257475,300228084,294804195,278454358,278019771,272742922,257047661,256697520,255498536,255407663,254732150,248639099,248218486,248118121,246985576,245527149,240891763,240004424,230884728,228552591,223664608,220673217,217124280,215862692,211989043],"y":["New Line Cinema","Hollywood Pictures","Amblin Entertainment","Village Roadshow Pictures","Skydance Productions","Warner Bros. Pictures","Legendary Pictures","Warner Bros. Pictures","Universal Pictures","Hoya Productions","Universal Pictures","Universal Pictures","Universal Pictures","Blinding Edge Pictures","Scott Free Productions","Universal Pictures","Legendary Pictures","Centropolis Entertainment","New Line Cinema","Dino De Laurentiis Company","Platinum Dunes","New Line Cinema","New Line Cinema","Constantin Film","New Line Cinema","Sommers Company / Stillking Films","Constantin Film","Phoenix Pictures","Blinding Edge Pictures","Dimension Films","Strong Heart/Demme Production","New Line Cinema","Blinding Edge Pictures","Blumhouse Productions","Blumhouse Productions","Monkeypaw Productions","Haxan Films","DreamWorks Pictures","Blinding Edge Pictures","Blinding Edge Pictures","Village Roadshow Pictures","20th Century Fox","Constantin Film","Warner Bros. Pictures","New Line Cinema","The Geffen Film Company","Dimension Films","Universal Pictures","American Zoetrope","Beacon Pictures"],"type":"box","orientation":"h","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->
