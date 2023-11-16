District_Data_Transpose[District_Data_Transpose == '-'] = NA

dat = District_Data_Transpose %>% 
  select(`All Students`:`Students with Disabilities`, `Economically Disadvantaged`:`Not in Foster Care`)


# Define the context of 'Learning Status' where we regress only against disability and ESL status
learning_status_df = District_Data_Transpose %>% 
  select(`All Students`, `General Education Students`, `Students with Disabilities`, `English Language Learner`, `Non-English Language Learner`)

learning_status_df = learning_status_df %>% 
  na.omit()


# School Data
School_Data[School_Data == '-'] = NA

learning_status_school_df = School_Data %>% 
  select(`All Students`, `General Education Students`, `Students with Disabilities`, `English Language Learner`, `Non-English Language Learner`)

learning_status_school_df = learning_status_school_df %>% 
  na.omit()
