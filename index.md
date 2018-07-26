
---
title: "Ice Detention Centers as of 2015"
author: "Kathy Targowski Ashenfelter"
date: "7/25/2018"
output:
  slidy_presentation: default
  ioslides_presentation: default
  beamer_presentation: default
---
## Introduction

This app reads in, processes, and prepares data from the Immigrations and Custom Enforcement (ICE) Freedom of Information (FOIA) data library. The dataset visualized for this project was the list of addresses for all of the ICE Detention Centers located in the United States as of 2015. Since these Centers have been the focus of much press and debate lately, this app helps to contextualize issues such as long-distance parent-child geographical separation when each is sent to different detention center.




## The Data

- Data are available from Immigration and Customs Enforcement Freedom of Information Act Website
- This app reads the data directly from the ICE site and geocodes the addresses into a coordinate format usable by the ggmap package
- Locations are clustered by proximity of location
- Interactive elements are zooming, clicking, mouse hover features



##  Prepare R Environment

```{r setup, ECHO=TRUE}
#knitr::opts_chunk$set(echo = FALSE)
require(rsconnect)
utils::packageDescription("rsconnect")
require(utils)
library(openxlsx)
require(RCurl)
require(httr)
library(ggmap)
require(utils)
library(devtools)
library(shiny)
library(rmarkdown)
library(openxlsx)
library(tmap)
library(tmaptools)
library(knitr)
library(compiler)
library(sourcetools)
library(ggplot2)
library(leaflet)
library(data.table)
library(htmltools)
library(htmlwidgets)
library(rjson)
library(RJSONIO)
library(jsonlite)
library(curl)
curlGlobalInit(flags = c("ssl", "win32"))
library(packrat)
# packrat::.snapshotImpl(".", snapshot.sources = FALSE)
# httr::config(ssl_verifypeer = FALSE)
httr::set_config( config(ssl_verifypeer = 0L) )
#options(shinyapps.http.trace = TRUE)
options(shinyapps.service_url = "https://kashenfelter.shinyapps.io")

options(rsconnect.check.certificate = FALSE)
options(rsconnect.max.bundle.size = 1000000000)
httr::config(ssl_verifypeer = FALSE)
Sys.unsetenv("http_proxy")
Sys.unsetenv("https_proxy")
```

## Obtaining and Preparing the Data

```{r, echo=TRUE}
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
head(data)
```

## Geocoding the Data


```{r, echo=TRUE}
#Commented out for this presentation because of API connection limitations and slow processing speed 
# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
#for(i in 1:nrow(data))
# {
#   # Print("Working...")
#   result <- geocode(data$addresses[i], output = "latlona", source = "dsk")
#   data$lon[i] <- as.numeric(result[1])
#   data$lat[i] <- as.numeric(result[2])
#   data$geoAddress[i] <- as.character(result[3])
# }
# Write a CSV file containing the data to the working directory
#write.csv(data, "ice_data_geocoded.csv", row.names=FALSE)

```



## Visit the Live App Online

- The live app is hosted at: https://kashenfelter.shinyapps.io/leaflet_ice/
- Github Repository with all code can be found here: https://github.com/kashenfelter/kashenfelter.github.io
- The presentation pitch deck is located here: https://github.com/kashenfelter/kashenfelter.github.io/blob/master/ICE_Facilities_Presentation/ICE_Detention_Facilities_20180725_final_Iioslides.Rmd

- Thank you!  
  


