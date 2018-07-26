library(shiny)
library(rmarkdown)
library(openxlsx)
library(tmap)
library(tmaptools)
library(ggmap)
library(knitr)
library(compiler)
library(sourcetools)
library(ggplot2)
library(ggmap)
library(shiny)
library(leaflet)
library(data.table)
library(htmltools)
library(htmlwidgets)
library(rsconnect)
library(rjson)
library(RJSONIO)
library(jsonlite)
library(curl)
library(RCurl)

#devtools::session_info() 
#rsconnect::appDependencies()
#options(encoding = "UTF-8")

#options(rpubs.upload.method = "internal")
options(shinyapps.http.trace = TRUE)
options(shinyapps.service_url = "http://api.shinyapps.io/v1")
options(rsconnect.check.certificate=FALSE)
options(shinyapps.http = "rcurl")


########################################

data<- read.xlsx("https://www.ice.gov/doclib/foia/dfs/2015IceDetentionFacilityListing.xlsx", sheet = 2, startRow = 7, colNames = TRUE,
          rowNames = FALSE, detectDates = FALSE, skipEmptyRows = TRUE,
          skipEmptyCols = TRUE, rows = NULL, cols = NULL, check.names = FALSE,
          namedRegion = NULL, na.strings = "NA", fillMergedCells = FALSE)

Address = data$Address
City = data$City
State = data$State
Zip = data$Zip

data$addresses = paste0(Address,"," ,City,"," , State,"," , Zip, ",", "United States of America")
data$addresses[data$DETLOC=='WVNORTH'] <- "112 Northern Regional Correctional Drive, Moundsville, WV 26041, United States of America"

#function(x) rle(as.character(x))$values)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
for(i in 1:nrow(data))
{
  # Print("Working...")
  result <- geocode(data$addresses[i], output = "latlona", source = "dsk")
  data$lon[i] <- as.numeric(result[1])
  data$lat[i] <- as.numeric(result[2])
  data$geoAddress[i] <- as.character(result[3])
}
# Write a CSV file containing the data to the working directory
write.csv(data, "ice_data.csv", row.names=FALSE)



