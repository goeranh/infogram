### Transformera data till JSON-format.


# libs --------------------------------------------------------------------

library(tidyverse)
library(jsonlite)
library(rjson)

# data --------------------------------------------------------------------

id <- sample(1:150, size = 20)
df <- iris[id, ]

dfl <- df  %>% as.list()

df_js <- toJSON(df)
df_js <- toJSON(df,
                dataframe = "values")

df_js




from




write_json(df_js, "df_json.json")
write_json(mx_js, "mx_json.json")

write(df_js, "df_json2.json")

xx <- fromJSON(file = "live.json", simplify = T)
df_xx <- as.data.frame(xx)

df_js <- toJSON(list(traits = names(df),
            values = df))

lst1 <- vector(mode = "list",
               length = nrow(df))

for (i in 1:nrow(df)){
  lst1[[i]] <- df[i, ]

}

df_js <- toJSON(lst1)

jsoncars <- toJSON(mtcars)
cat(df_js)


mx <- df %>%
  select(Species, 2:5)
mx_names <- colnames(mx)
colnames(mx) <- NULL
rownames(mx) <- NULL
mx_js <- toJSON(mx)

mx_js
mx_js_names <- toJSON(mx_names)
mx_js <- cat("[", toJSON(mx_names), toJSON(mx))
gsub("] [[", "], [", mx_js)

array(df[1,])
vector(mode = "complex", length = 6)
