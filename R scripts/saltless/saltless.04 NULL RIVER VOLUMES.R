
# Create an object for the compiling scripts defining 0 river input

#### Set up ####

rm(list=ls())                                                               # Wipe the brain

user_rivers <- expand.grid(Month = 1:12, 
                           Year = 1980:2099,
                           Runoff = 0)                                      # No river input
  
saveRDS(user_rivers, "./Objects/River volume input.rds")

