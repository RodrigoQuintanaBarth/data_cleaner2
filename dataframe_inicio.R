raw_data = read.csv(chosen_file)
last_obs = length(contactados$X4)
last_email = contactados$Email[last_obs]
first_obs_raw_data = match(last_email,raw_data$email)

data_frame_inicio = raw_data[first_obs_raw_data:length(raw_data$email),]
data_frame_inicio = select(data_frame_inicio,fullname,currdesignation,location,company,email)

