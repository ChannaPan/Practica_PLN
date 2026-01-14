#PRUEBA para comprobar codigo pregunta 1

#PRUEBA 1: ver que cuenta bien el numero de frases
#Dataframe sencillo
df_prueba <- data.frame(
  V1=c("1","2","1","2","3","1"),
  V2=c("La", "tienda", "La", "ciudad", "vieja", "Él")
)

#Pruebo mi codigo
frases_prueba <- df_prueba[df_prueba$V1==1,]
num_frases_prueba <- nrow(frases_prueba)

if (num_frases_prueba == 3) {
  cat("TEST PASADO: Numero de frases correcto.\n")
} else {
  cat("TEST FALLADO: Numero de frases incorrecto.\n")
}


#PRUEBA 2: Excepciones
#Compruebo que en los casos en que hay "1-2" y luego "1" y "2"
#(ocurre cuando la palabra es una contracción) cuenta el numero 
#de frases de manera correcta
df_prueba2 <- data.frame(
  V1=c("1","2","1-2","1","2","3"),
  V2=c("La", "tienda", "Al", "A", "el", "niño")
)
#Pruebo mi codigo
frases_prueba2 <- df_prueba2[df_prueba2$V1==1,]
num_frases_prueba2 <- nrow(frases_prueba2)

if (num_frases_prueba2 == 2) {
  cat("TEST PASADO: Numero de frases correcto.\n")
} else {
  cat("TEST FALLADO: Numero de frases incorrecto.\n")
}
