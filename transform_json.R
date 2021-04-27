### Transformera data till JSON-format.


# libs --------------------------------------------------------------------

library(tidyverse)
library(jsonlite)
library(rjson)

# data --------------------------------------------------------------------

id <- sample(1:150, size = 20)
df <- iris[id, ]
df <- df %>% select(Species, everything())

df_js <- toJSON(df,
                dataframe = "values")

df_js
write(df_js, "df_json2.json")


