library(plotly)

#get rid of english and undefined language
Saturdaytweets.new<-subset(Saturdaytweets, !lang %in% c("en", "und"))

#languages with most users
a<-Saturdaytweets.new %>% 
  group_by(lang) %>%
  summarise(no_rows = length(lang))
a[order(-a$no_rows),]

#pick eight languages with most users
selected<-c("es", "tl", "in", "ht", "fr","ar", "pt", "ja")

Saturdaytweets.new<-Saturdaytweets.new[match(as.character(Saturdaytweets.new$lang), selected), ]
Saturdaytweets.new<-subset(Saturdaytweets, lang %in% selected)


#plot
g <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray95"),
  subunitcolor = toRGB("gray85"),
  countrycolor = toRGB("gray85"),
  countrywidth = 0.5,
  subunitwidth = 0.5
)

p <- plot_geo(Saturdaytweets.new, lat = ~place_lat, lon = ~place_lon) %>%
  add_markers( text = ~paste(lang),
               color = ~lang, symbol = I("circle"), hoverinfo = "text") %>%
  layout( title = 'lang', geo = g)
p
