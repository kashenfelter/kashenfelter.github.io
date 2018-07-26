source("global.R")
httr::config(ssl_verifypeer = FALSE)
data<- read.csv("ice_data_geocoded.csv")

ui <- fluidPage(
  titlePanel("Immigration and Customs Enforcement (ICE) Detention Facilty Locations as of 2015"),
  leafletOutput("mymap")
)

server <- function(input, output, session) {
  output$mymap <- renderLeaflet({
    leaflet(data) %>%
      addTiles() %>%
      addMarkers(~lon, ~lat, label = ~htmlEscape(Name),
                 #popup = ~sprintf("Inspection Rating 2015 = %s", CY15.Rating), layerId = rownames(data),
                 popup = paste("Facility Code:", data$DETLOC, "<br>",
                               "Inspection Rating 2015:", data$CY15.Rating, "<br>",
                               "Capacity:", data$Capacity, "<br>",
                               "Facility Type:", data$Type.Detailed, "<br>",
                               "Gender:", data$'Male/Female'),layerId = NULL,
                 clusterOptions = markerClusterOptions(), clusterId = NULL
      )
    
  }) 
}  
shiny::shinyApp(ui, server)

