setwd("D:/Desktop/LIMPIADOR DE DATOS")

chosen_file <- choose.files()

source("./cargador de librerias.R")
source("./dataframe_inicio.R")
source("./eliminador_duplicados.R")
source("./roles_matchempresas_agruparciudades.R")
source("./evaluador_matches.R")

View(datos_limpios_match)

write.csv(datos_limpios_match, file=choose.files(caption="Save As...", 
                                    filters = c("Comma Delimited Files (.csv)","*.csv")))



