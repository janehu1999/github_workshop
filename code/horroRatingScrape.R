############################
### Getting IMDB Reviews ###
############################

library(data.table)
library(httr)
library(jsonlite)
library(purrr)
library(rvest)

# First, we need to read in the top films:

topGrossingLink <- 
  "https://en.wikipedia.org/wiki/List_of_highest-grossing_horror_films"

horrorMovies <- read_html(topGrossingLink) %>% 
  html_table(fill = TRUE) %>% 
  `[[`(1)

# Now, we can create links for each movie:

movie <- gsub("\\s", "\\+", horrorMovies$Film)

movie <- tolower(gsub(":", "", movie))

year <- horrorMovies$Year

# Register for your own key here:
# http://www.omdbapi.com/apikey.aspx

omdbKey <- ""

searchGenerator <- glue::glue(
  "http://www.omdbapi.com/?t={movie}&type=movie&y={year}&apikey={omdbKey}"
)

horrorMovieInfo <- lapply(searchGenerator, function(x) {
  movieContent <- GET(x)
  
  movieOut <- fromJSON(content(movieContent, as = "text"))
})

horrorOut <- map_df(horrorMovieInfo, ~{

  movieOut <- .x
  if(length(movieOut$Ratings) == 0) {
    ratings <- data.table(`Internet Movie Database` = NA, 
                          Metacritic = NA,
                          `Rotten Tomatoes` = NA)
  } else {
    ratings <- as.data.table(movieOut$Ratings)
    
    ratings$ID <- 1
    
    ratings <- dcast(ratings, ID ~ Source, 
                     value.var = "Value", drop = FALSE)
    
    ratings <- ratings[, ID := NULL]
  }
  
  movieOut$Ratings <- NULL
  
  flatMovie <- flatten_df(movieOut)
  
  allInfo <- cbind(flatMovie, ratings)
})

save(horrorOut, file = "data/horrorOut.RData")
