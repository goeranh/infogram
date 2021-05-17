# libs --------------------------------------------------------------------

library(tidyverse)
library(readxl)
library(jsonlite)

# data --------------------------------------------------------------------

df <- read_excel("data/vgr_data.xlsx",
                 skip = 2) %>%
  filter(Datum < "2021-01-01")

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

