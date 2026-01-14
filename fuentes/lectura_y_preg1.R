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


#PREGUNTA 1
# ¿Cuántas frases se analizan en este fichero?

# En la primera columna sale el numero de cada 
# palabra dentro de cada frase. Por tanto, al 
# inicio de cada frase, la primera palabra tiene 
# valor 1 en la columna V1

#Identifico aquellas filas con valor 1 en V1
frases <- datos[datos$V1==1,] 
#Cuento cuantas filas coinciden
num_frases <- nrow(frases)

cat("Numero de frases analizadas en fichero:", num_frases)
#Me salen 1721 frases
