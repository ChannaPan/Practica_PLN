raw <- readLines("es_ancora-up-test.conllu", encoding = "UTF-8")

good_lines <- raw[sapply(strsplit(raw, "\t"), length) == 14]

df <- read.table(text = good_lines,
                 sep = "\t",
                 header = FALSE,
                 quote = "",
                 fill = TRUE)
nrow(df)

prueba
