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
  summarise(sjh_tot = sum(Inneliggande),
            iva = sum(`varav IVA`)) %>%
  filter(Datum < "2021-01-01")

ggplot(wf, aes(x = Datum))+
  geom_line(aes(y = sjh_tot))+
  geom_line(aes(y = iva), color = 2)

write_csv(wf, "data/covid.csv")

