### Detta script uppdaterar det diagram som redovisar antalet inneliggande patienter med covid-diagnos dag för dag.
### Det fungerar på följande sätt:
### 1. Det dagligen uppdaterade kalkylarket importeras till R-miljön
### 2. Informationen per sjukhusförvaltning summeras till regionnivå - kolumner: Datum; Totalt; Varav IVA
### 3. Transformerar data till radformaterad JSON (som text/character)
### 4. Sparar till covidupdate.json på https://github.com/Vastra-Gotalandsregionen/Vastra-Gotalandsregionen.github.io/tree/master/covid-statistik



# libs --------------------------------------------------------------------

library(tidyverse)
library(readxl)
library(jsonlite)

# data --------------------------------------------------------------------

df <- read_excel("data/vgr_data_3.xlsx",
                 sheet = 3,
                 skip = 2)

wf <- df %>% group_by(Datum) %>%
  summarise(sjh_tot = sum(Inneliggande, na.rm = TRUE),
            iva = sum(`varav IVA`, na.rm = TRUE))

wf_mx <- as.matrix(wf)

colnames <- c("Datum", "Totalt", "Varav IVA")

wf_mx2 <- rbind(colnames, wf_mx)
wfjs <- toJSON(wf_mx2)

wfjs_chr <- as.character(wfjs)
wfjs_chr <- paste("[", wfjs_chr, "]", sep = "")
write(wfjs_chr, "covid_json.json")

