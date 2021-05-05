### Skapar en arbetsfil med data för perioden 17 mars 2020 till 31 december som innehåller dagliga uppdateringar av antalet individer som vårdas på regionens
### sjukhus totalt och på IVA.


# libs --------------------------------------------------------------------

library(tidyverse)
library(readxl)
library(jsonlite)

# data --------------------------------------------------------------------

df <- read_excel("data/vgr_data.xlsx",
                 skip = 2)
wf <- df %>% group_by(Datum) %>%
  summarise(sjh_tot = sum(Inneliggande, na.rm = TRUE),
            iva = sum(`varav IVA`, na.rm = TRUE))

ggplot(wf, aes(x = Datum))+
  geom_line(aes(y = sjh_tot))+
  geom_line(aes(y = iva), color = 2)

write_csv(wf, "data/covid.csv")

wf_js <- toJSON(wf)

wf_mx <- as.matrix(wf)
toJSON(wf_mx)
coln <- colnames(wf_mx)
wf2 <- rbind(coln, wf_mx) %>% as_tibble()
wf2_js <- toJSON(wf2, dataframe = "values")
wf2_js
write(wf2_js, "covid_json.json")
