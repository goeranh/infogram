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
