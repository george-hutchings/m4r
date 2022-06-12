#Knitting

rm(list = ls())
# Install a package manager and packages
if (!require("pacman")) {
  install.packages("pacman")
}
pacman::p_load(knitr, rstudioapi)
current_path = rstudioapi::getActiveDocumentContext()$path
setwd(dirname(current_path))

#to_run = "simulations_MAIN_rand_uniform.R"
to_run = "simulations_MAIN.R"
foldername = "simulations_file_june10/"

distribution = 't' # distribution

iterations = 100
for (distribution in c('n','t')){
for (uneven in c(TRUE, FALSE)) {
  if (uneven) {
    evenname = 'uneven'
  } else{
    evenname = 'even'
  }
  for (k in c(10)) {
    # name of form distribution, true #clusters, whether even or not
    name = paste0(foldername, distribution, as.character(k), evenname)
    #readline(prompt="Press [enter] to continue or [esc] to exit")
    print(paste('Computing.........', name))
    knitr::stitch(to_run, output = name) # knit
  }
}
}

# for (uneven in c(TRUE, FALSE)) {
#   if (uneven) {
#     evenname = 'uneven'
#   } else{
#     evenname = 'even'
#   }
#   for (k in c(10)) {
#     # name of form distribution, true #clusters, whether even or not
#     name = paste0(foldername, distribution, as.character(k), evenname, 'rand')
#     #readline(prompt="Press [enter] to continue or [esc] to exit")
#     print(paste('Computing.........', name))
#     knitr::stitch(to_run, output = name) # knit
#   }
# }