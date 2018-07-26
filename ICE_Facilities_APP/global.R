#http://slidify.org/publish.html
options(rpubs.upload.method = "internal")
#options(shinyapps.http.trace = TRUE)
options(shinyapps.service_url = "https://kashenfelter.shinyapps.io")

options(rsconnect.check.certificate = FALSE)
options(rsconnect.max.bundle.size = 1000000000)
httr::config(ssl_verifypeer = FALSE)
library(utils)
library(rsconnect)
library(openssl)
library(leaflet)
library(shiny)
library(htmltools)
library(htmlwidgets)
library(lwgeom)
library(gdalUtils)
library(shiny)
library(rmarkdown)
library(openxlsx)
library(tmap)
library(tmaptools)
library(ggmap)
library(knitr)
library(sourcetools)
library(ggplot2)
library(ggmap)
library(data.table)
library(htmltools)
library(rjson)
library(RJSONIO)
library(jsonlite)
library(curl)
library(RCurl)
library(ROAuth)
library(httr)
library(git2r)
library(rstan)
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)
#git2r::cred_token()
#credentials$handshake()
library(knitr)
#options(rsconnect.max.bundle.size=1000000000)
knitr::opts_chunk$set(echo = FALSE)
#library(compiler)

#options(RCurlOptions = list(verbose = TRUE, cainfo = system.file("CurlSSL", "shinyapps.io.pem", ssl.verifypeer = FALSE)))

#options(RCurlOptions = list(verbose = TRUE, cainfo = system.file("CurlSSL", "cert-rstudio.pem", ssl.verifypeer = FALSE)))

options(RCurlOptions = list(verbose = TRUE, capath = file.path("~/cert-rstudio.pem", ssl.verifypeer = FALSE)))

#options(RCurlOptions = list(cainfo = paste0( tempdir() , "/cacert.pem" )))


#rsconnect::addServer("https://shinyapps.io")
# 
# rsconnect::addServer("https://api.shinyapps.io//v1")
# 
# rsconnect::addServer("https://api.shinyapps.io")
# 



#system("echo | openssl s_client -connect shinyapps.io:443 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p")

