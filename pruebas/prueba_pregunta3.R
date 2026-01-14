#PRUEBA para comprobar conllu_nlp.R

#Inicializar el prueba
script <- "conllu_nlp.R"
entrada <- "es_ancora-up-test.conllu"
salida <- "test_salida.pdf"

#PRUEBA 1: Ejecución con argumentos correctos
cmd <- paste("Rscript", script, entrada, salida)
status <- system(cmd)

if (status != 0) {
  cat("TEST FALLADO: El programa no se ejecutó correctamente.\n")
}

if (!file.exists(salida)) {
  cat("TEST FALLADO: El PDF no se ha generado.\n")
}

if (file.info(salida)$size == 0) {
  cat("TEST FALLADO: El PDF está vacío.\n")
}

cat("TEST PASADO: El programa se ha ejecutado correctamente, con resultados deseados.\n")

#PRUEBA 2: Falta de argumentos
cmd <- paste("Rscript", script, entrada)
status <- system(cmd)

if (status == 0) {
  cat("TEST FALLADO: El programa no se paró cuando faltan argumentos.\n")
} else{
  cat("TEST PASADO: El programa sí se paró cuando faltan argumentos.\n")
}

#PRUEBA 3: Fichero de entrada con extensión incorrecta
cmd <- paste("Rscript", script, "entrada.txt", salida)
status <- system(cmd)

if (status == 0) {
  cat("TEST FALLADO: El programa no se paró cuando el fichero de entrada tiene extensión incorrecta.\n")
} else{
  cat("TEST PASADO: El programa sí se paró cuando el fichero de entrada tiene extensión incorrecta.\n")
}

#PRUEBA 4: FIchero de salida con extensión incorrexta
cmd <- paste("Rscript", script, entrada, "salida.txt")
status <- system(cmd)

if (status == 0) {
  cat("TEST FALLADO: El programa no se paró cuando el fichero de salida tiene extensión incorrecta.\n")
} else{
  cat("TEST PASADO: El programa sí se paró cuando el fichero de salida tiene extensión incorrecta.\n")
}

