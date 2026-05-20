#make a quick species tree for each opsin using the open tree of life 

#clean the workspace
rm(list=ls(all=TRUE))  

#load/install necessary packages
install.packages("rotl")
library(rotl)
library(ape)

#make tree ####
#first list the latin names of each species used in the opsin alignment
species <- c("Homo sapiens", "Mus musculus", "Canis lupus familiaris", "Bos taurus", 
             "Felis catus", "Lynx canadensis", "Equus caballus", "Camelus dromedarius", 
             "Sus scrofa", "Hippopotamus amphibius kiboko", "Giraffa camelopardalis", 
             "Okapia johnstoni", "Bos indicus", "Bos mutus", "Capra hircus", "Oryx dammah", 
             "Ovis canadensis", "Cervus canadensis", "Muntiacus reevesi", "Odocoileus virginianus", 
             "Rangifer tarandus tarandus", "Bison bison", "Dama dama", "Cervus elaphus")

# Get OTT ids for each species
taxa <- tnrs_match_names(names = species)

# Build a tree
tree <- tol_induced_subtree(ott_ids = taxa$ott_id)

# Remove " ott" followed by digits at the end of each tip label
tree$tip.label <- sub("_ott\\d+$", "", tree$tip.label)

plot(tree, main = "Species tree from Open Tree of Life")

#did not try to rename node labels in R, as hidden internal nodes make the file too large and R studio will crash. 

#save tree file
write.tree(tree, file = "/Users/emerflanagan/Desktop/MSc_Project/phylogeny/species_tree/species_tree.tree")


