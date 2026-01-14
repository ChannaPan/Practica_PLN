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


#PREGUNTA 2
# ¿Cuántos verbos distintos se utilizan?

# En la cuarta columna sale el tipo de cada 
# palabra. Por tanto, las palabras que en V4 
# tengan "VERB", son verbos. Además, la tercera
# fila indica el infinitivo de los verbos, lo
# que permite ver si son distintos o nó.

# En la segunda columna aparecen las formas
# verbales originales, de donde se puede sacar
# su frecuencia para un histograma.

#Filtro las filas con verbos
filas_verbos <- datos[datos$V4 == "VERB", ]
#Guardo todos los verbos
verbos <- filas_verbos$V3
#Cuento los verbos distintos
num_verbos_distintos <- length(unique(verbos))

cat("Numero de verbos distintos analizados en fichero:", num_verbos_distintos)
#Me salen 987 verbos distintos

#Guardo todas las formas verbales
formas <- filas_verbos$V2
#Saco las frecuencias de las formas
freq_formas <- table(formas)

barplot(freq_formas,
        las = 2,
        cex.names = 0.5,
        main = "Formas verbales en el CoNLL-U",
        xlab = "Forma verbal",
        ylab = "Frecuencia")
