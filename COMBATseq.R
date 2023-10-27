#Load sva library
library(sva)

#set the directory in which you want to work
setwd("/media/fmr/HDD2/RNAseq_using_Rsubread_GSE101705/")

#Remove the Gene column  and give only counts data
Counts <- read.csv("less_than_16_vs_any_bmi_2.csv", header = FALSE, sep = ',')

#convert counts data into matrix 
Counts_matrix <- as.matrix(Counts)
Counts_matrix

# define number of columns for each batch ( can be more than 2)
batch <- c(rep(1,16),rep(2,28))

#ComBat_seq
adjusted_counts <- ComBat_seq(counts = Counts_matrix, batch = batch, group = NULL)
adjusted_counts

#Write the adjusted counts to the file
write.table(adjusted_counts ,file="combatseq-normalised.tsv", sep ="  ")
