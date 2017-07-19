no_duplicados = unique(data_frame_inicio)
not_in_planilla = no_duplicados[!(no_duplicados$email %in% c(contactados$Email,respuestas$Email,reunion_hecha$Email)),]
not_in_deal = not_in_planilla[!(not_in_planilla$company %in% datos_deals$`Associated Company`),]

no_duplicados_final = not_in_deal

