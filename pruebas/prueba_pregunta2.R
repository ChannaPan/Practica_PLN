#PRUEBA para comprobar codigo pregunta 2

#PRUEBA 1: Ver que cuenta bien el numero de verbos distintos.
#Dataframe sencillo
df_prueba <- data.frame(
  V3=c("entrar","de", "acusar","destituir","entrar", "1989"),
  V4=c("VERB", "DET", "VERB", "VERB", "VERB", "NOUN")
)

#Pruebo mi código
filas_verbos_prueba <- df_prueba[df_prueba$V4 == "VERB", ]
verbos_prueba <- filas_verbos_prueba$V3
num_verbos_distintos_prueba <- length(unique(verbos_prueba))

if (num_verbos_distintos_prueba == 3) {
  cat("TEST PASADO: Numero de verbos distintos correcto.\n")
} else {
  cat("TEST FALLADO: Numero de verbos distintos incorrecto.\n")
}


#PRUEBA 2: Ver que guarda bien la frecuencia de las formas verbales.
#Dataframe sencillo
df_prueba2 <- data.frame(
  V2=c("entró","la", "acusaba","destituir","entró", "1989"),
  V4=c("VERB", "DET", "VERB", "VERB", "VERB", "NOUN")
)

#Pruebo mi código
filas_verbos_prueba2 <- df_prueba2[df_prueba2$V4 == "VERB", ]
formas_prueba2 <- filas_verbos_prueba2$V2
freq_formas_prueba2 <- table(formas_prueba2)

if (freq_formas_prueba2["acusaba"]==1 && freq_formas_prueba2["destituir"]==1 && freq_formas_prueba2["entró"]==2) {
  cat("TEST PASADO: Frecuencias de formas verbales correctas.\n")
} else {
  cat("TEST FALLADO: Frecuencias de formas verbales incorrectas.\n")
}
