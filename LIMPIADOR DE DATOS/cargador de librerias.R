library(dplyr)
library(ggplot2)
library(data.table)
library(lubridate)
library(tidyr)
library(stringr)
library(gmailr)
library(googlesheets)
library(httpuv)
library(shiny)

gs_auth()
generador_de_clientes = gs_title("GENERADOR DE CLIENTES")
contactados = gs_read(generador_de_clientes,ws="CONTACTADOS")
respuestas = gs_read(generador_de_clientes,ws="RESPUESTAS")
reunion_hecha = gs_read(generador_de_clientes,ws= "REUNION HECHA")
Resumen_mensual = gs_title("RESUMEN MENSUAL AREA COMERCIAL")
datos_deals = gs_read(Resumen_mensual,ws="Datos CRM")


words_to_eliminate = gs_read(generador_de_clientes, ws= "LISTA DE CARACTERES PARA ELIMINAR")



