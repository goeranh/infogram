### Transformera data till JSON-format.


# libs --------------------------------------------------------------------

library(tidyverse)
library(jsonlite)
library(rjson)

# data --------------------------------------------------------------------

id <- sample(1:150, size = 20)
df <- as_tibble(iris[id, ])
df <- df %>% select(Species, everything())

df_js <- toJSON(df,
                dataframe = "values")

df_js
write(df_js, "df_json2.json")


class(df)

nm <- as_tibble(names(df))
bind_rows(nm, df)

mx <- as.matrix(df)
colnames(mx)
rownames(mx)
toJSON(mx)
df2 <- rbind(colnames(mx), mx) %>% as_tibble()
df2_js <- toJSON(df2, dataframe = "values")
df2_js
write(df2_js, "df_json2.json")


df <- read_excel("data/vgr_data.xlsx",
                 skip = 2)
wf <- df %>% group_by(Datum) %>%
  summarise(sjh_tot = sum(Inneliggande, na.rm = TRUE),
            iva = sum(`varav IVA`, na.rm = TRUE)) %>%
  filter(between(row_number(), 1, 10))

class(wf)
toJSON(wf)
mx <- as.matrix(wf)
vec <- as.vector(mx[1, ])
toJSON(mx)

for (i in 1:10){

  tmp <- as.vector(mx[i, ])

  vec <- cat(vec, ", [", tmp, "]", sep = ",")

}
mx
mx_js <- toJSON(mx)
write(mx_js, "mx_js.json")

read_file("mx_js.json")


from_json <- fromJSON("live.json")
toJSON(from_json)

map()

toJSON(wf)
as.matrix(wf)
mx_chr <- as.character(toJSON(mx))

write(mx_chr, "mx_chr.txt")


xx <- wf %>%
  mutate(js = pmap(., ~toJSON(dataframe = "rows")))

xx$js

wfjs <- wf %>% toJSON(dataframe = "values")

nomjs <- toJSON(names(wf))
names(wf)
wfjscat <- as.character(wfjs)

str_remove(wfjscat, )

length(wfjscat)


cat(nomjs, wfjs, sep = ",")

from_json
class(from_json)
ar <- as.array(mx)
class(ar)
class(mx)
dim(ar)
dimnames(ar)
mx2 <- rbind(dimnames(mx)[[2]], mx)
mx2js <- toJSON(mx2)
write(mx2js, "covid_json.json")



# transform tibble to json ------------------------------------------------


