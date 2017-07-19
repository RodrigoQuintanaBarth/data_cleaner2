

  match_level = numeric()
  
            for(i in 1:length(roles_relevantes$email)) {
              
              email = roles_relevantes$email[i]
              
              company = roles_relevantes$company[i]
              company = tolower(company)
              
              dominio = sub(".*[@]","",email)
              dominio = sub("[.].*","",dominio)
              letras_dominio = str_split(dominio,pattern="")
              letras_company = str_split(company,pattern="")
              letras_matches = letras_company[[1]] %in% letras_dominio[[1]]
              
              match_level[i] = sum(letras_matches) / length(letras_matches)
  }
  
  datos_limpios_match = cbind(roles_relevantes,match_level)
  
  
  
  companies_words = numeric()
  
  for(i in 1:length(roles_relevantes$company)) {
    
    company = roles_relevantes$company[i]
    
    
    palabras_company = str_split(company,pattern=" ")
    numero_palabras = length(palabras_company[[1]])
    
    companies_words[i] = numero_palabras
  }
  
  datos_limpios_match = cbind(datos_limpios_match,companies_words)
  
  fuentes = c()
  
  for(i in 1:length(roles_relevantes$location)) {
    
    location = roles_relevantes$location[i]
    
    if(length(grep("San Francisco",location))!=0) {fuentes[i] = "San Francisco"}else
    if(length(grep("San Diego",location))!=0) {fuentes[i] = "San Diego"}else
    if(length(grep("San Jose?",location))!=0) {fuentes[i] = "San Francisco"}else
    if(length(grep("Mountain View",location))!=0) {fuentes[i] = "San Francisco"}else
    if(length(grep("California",location))!=0) {fuentes[i] = "Los Angeles"}else
    if(length(grep("New York",location))!=0) {fuentes[i] = "New York"}else
    if(length(grep("Florida",location))!=0) {fuentes[i] = "Miami"}else
    if(length(grep("Washington",location))!=0) {fuentes[i] = "Seattle"}else
    if(length(grep("Austin",location))!=0) {fuentes[i] = "Austin"}else
    if(length(grep("Texas",location))!=0) {fuentes[i] = "Austin"}else
    if(length(grep("New Jersey",location))!=0) {fuentes[i] = "New York"} else{fuentes[i] = "Unknown"}
      
  }
  
  datos_limpios_match = cbind(datos_limpios_match,fuentes)
  datos_limpios_match = arrange(datos_limpios_match,fuentes,desc(match_level), companies_words)
  datos_limpios_match = select(datos_limpios_match,fuentes ,location,fullname,currdesignation,company,email, match_level, companies_words)
  
  
