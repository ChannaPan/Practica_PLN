#Leer el fichero CONLL-U

fichero <- "es_ancora-up-test.conllu"
datos <- read.table(file = fichero, 
                    sep = '\t', 
                    header = FALSE, 
                    quote = "",
                    comment.char = "#",
                    blank.lines.skip = TRUE,
                    flush = TRUE,
                    fill=TRUE)
nrow(datos)