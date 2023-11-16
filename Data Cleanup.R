dat = District_Data_Transpose %>% 
  select(`All Students`:`Students with Disabilities`, `Economically Disadvantaged`:`Not Homeless`)

dat = dat %>% 
  na.omit()
