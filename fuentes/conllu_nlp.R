# PREGUNTA 3
#Haz un programa connlu_nlp.R que reciba por argumentos el nombre del fichero 
#collu de entrada y el nombre de un fichero donde se escribirán las respuestas 
#a las preguntas anteriores.

#Para ejecutar el programa, introduce en el terminal:
#Rscript conllu_nlp.R nombre_fichero_entrada.conllu nombre_fichero_salida.pdf

# Leer argumentos introducidos 
args <- commandArgs(trailingOnly = TRUE)

#El programa se para si faltan argumentos
if (length(args) != 2) {
  stop("INTRODUCE EN EL TERMINAL: Rscript conllu_nlp.R nombre_fichero_entrada.conllu nombre_fichero_salida.pdf")
}

#Guardar los argumentos
fichero_entrada <- args[1]
fichero_salida <- args[2]

#El programa se para cuando las extensiones de los argumentos introducidos 
#no son .conllu y .pdf, respectivamente
if (!grepl("\\.conllu$", fichero_entrada)) {
  stop("EL FICHERO DE ENTRADA DEBE TENER EXTENSIÓN .conllu")
}

if (!grepl("\\.pdf$", fichero_salida)) {
  stop("EL FICHERO DE SALIDA DEBE TENER EXTENSIÓN .pdf")
}

# Leer el fichero CoNLL-U
datos <- read.table(file = fichero_entrada, 
                    sep = '\t', 
                    header = FALSE, 
                    quote = "",
                    comment.char = "#",
                    blank.lines.skip = TRUE,
                    flush = TRUE,
                    fill=TRUE)

# Resolver Pregunta 1
frases <- datos[datos$V1==1,]
num_frases <- nrow(frases)

# Resolver Pregunta 2
filas_verbos <- datos[datos$V4 == "VERB", ]
verbos <- filas_verbos$V3
num_verbos_distintos <- length(unique(verbos))

formas <- filas_verbos$V2
freq_formas <- table(formas)

# Generar el PDF con los resultados
pdf(fichero_salida)

plot.new()
title("Análisis del fichero CoNLL-U")

text(0, 0.8, paste("Fichero analizado:", fichero_entrada), adj = 0)
text(0, 0.7, paste("Número de frases:", num_frases), adj = 0)
text(0, 0.6, paste("Número de verbos distintos:", num_verbos_distintos), adj = 0)

#Gráfico de barras
barplot(freq_formas,
        las = 2,
        cex.names = 0.5,
        main = "Formas verbales en el CoNLL-U",
        xlab = "Forma verbal",
        ylab = "Frecuencia")

dev.off()

cat("Análisis completado.\nResultados guradados en:", fichero_salida, "\n")