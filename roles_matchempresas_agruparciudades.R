if(length(grep("Sales|SALES|Marketing|MARKETING|Assistant|ASSISTANT|Education|Business|BUSINESS|Account|ACCOUNT",no_duplicados_final$currdesignation)) != 0){

  roles_relevantes = no_duplicados_final[-grep("Sales|SALES|Marketing|MARKETING|Assistant|ASSISTANT|Education|Business|BUSINESS|Account|ACCOUNT",no_duplicados_final$currdesignation),]
  
  
  
}else{roles_relevantes = no_duplicados_final}

roles_relevantes$company = as.character(roles_relevantes$company)

   
 #Eliminador de palabras no humanas

for(i in 1:length(roles_relevantes$company)) {

company_split = str_split(roles_relevantes$company[i], " ")

            if(sum(company_split[[1]] %in% words_to_eliminate[[1]])!=0) {
              
              roles_relevantes$company[i]  = sub(words_to_eliminate[[1]][match(company_split[[1]],words_to_eliminate[[1]])[!is.na(match(company_split[[1]],words_to_eliminate[[1]]))]],"",roles_relevantes$company[i])
              
            }else {
              
              roles_relevantes$company[i] = roles_relevantes$company[i]
              
            }
  

}








