
## Run batches of R scripts. Handy if you want scripts to run after another finishes while you're away from the machine

library(tidyverse)

#### Batch process scripts ####

scripts <- c(                                           # List scripts in the order you want to run them
 "./R scripts/se2e/strathE2E.01 INITIALISE MODEL.R",
 "./R scripts/se2e/strathE2E.02 COMPILE BOUNDARY FILE.R",
 "./R scripts/se2e/strathE2E.03 COMPILE PHYSICS FILE.R",            
 "./R scripts/se2e/strathE2E.04 COMPILE PHYSICAL PARAMETERS.R",     
 "./R scripts/se2e/strathE2E.05 NULL FISHING FLEET.R",    
 "./R scripts/se2e/strathE2E.06 EVENT TIMINGS.R",    
 "./R scripts/se2e/strathE2E.07 MODEL CLEANUP.R",
 "./R scripts/se2e/strathE2E.08 PLOT UPDATE.R"                   
) %>% 
  map(MiMeMo.tools::execute)                                                           # Run the scripts

