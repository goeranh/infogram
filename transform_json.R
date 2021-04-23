### Transformera data till JSON-format.


# libs --------------------------------------------------------------------

library(tidyverse)
library(jsonlite)


# data --------------------------------------------------------------------

df <- iris

df_js <- toJSON(df, pretty = TRUE)

df_js

write_json(df_js, "df_json.json")

