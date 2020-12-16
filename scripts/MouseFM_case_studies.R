# Install the package e.g. via Bioconductor or from Github
# BiocManager::install("MouseFM")
# devtools::install_github('matmu/MouseFM', build_vignettes = TRUE)

library(MouseFM)
library(GenomicRanges)

help(package=MouseFM)
help(avail_strains)
help(avail_consequences)
help(annotate_mouse_genes)

all_chrom <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11","chr12","chr13","chr14","chr15","chr16","chr17","chr18","chr19")

# Interfrontal bone example
strains_with_ifb <- c("C57BL_6J","C57L_J","CBA_J","NZB_B1NJ")
strains_without_ifb <- c("C3H_HEJ","MOLF_EiJ","NZW_LacJ","WSB_EiJ","SPRET_EiJ")
result_ifb_all <- finemap(chr=all_chrom, strain1=strains_with_ifb, strain2=strains_without_ifb)
dim(result_ifb_all)
genes_ifb <- annotate_mouse_genes(result_ifb_all)
result_ifb_all_filtered <- finemap(chr=all_chrom, strain1=strains_with_ifb, strain2=strains_without_ifb,impact=c("HIGH","MODERATE")) 
dim(result_ifb_all_filtered)
genes_ifb_filtered <- annotate_mouse_genes(result_ifb_all_filtered)
result_ifb_all_filtered_annotated <- annotate_consequences(result_ifb_all_filtered)

# Select MODERATE and HIGH impact annotations
result_ifb_all_filtered_annotated_high <- result_ifb_all_filtered_annotated[result_ifb_all_filtered_annotated$impact %in% c("MODERATE","HIGH"),]

# Print regions
old_pos <- -1000000
old_chrom <- 1
num_locus <- 0
num_snvs_per_locus <- 0
for(i in 1:length(result_ifb_all[,1])){
  chrom <- result_ifb_all[i,1]
  pos <- result_ifb_all[i,2]
  if(!(chrom == old_chrom) || !(pos-old_pos<1000000)){
    if(!old_pos == -1000000){
      print(paste("Locus end: ",old_chrom,old_pos))
      print(paste("Number SNVs per locus: ",num_snvs_per_locus))
    }
    print(paste("Locus start: ",chrom,pos))   
    num_locus <- num_locus+1
    num_snvs_per_locus <- 0
  }
  old_chrom <- chrom
  old_pos <- pos
  num_snvs_per_locus <- num_snvs_per_locus+1
}
print(paste("Locus end: ",old_chrom,old_pos))
print(paste("Number SNVs per locus: ",num_snvs_per_locus))
print(paste("Number of loci: ",num_locus))

# Albinism example
strains_with_albinism <- c("AKR_J","A_J","BALB_cJ","NZW_LacJ","RF_J","ST_bJ","BUB_BnJ","FVB_NJ","KK_HiJ","NOD_ShiLtJ")
strains_without_albinism <- c("C57BL_6J","C57BL_6NJ","129P2_OlaHsd","129S1_SvImJ","129S5SvEvBrd","C3H_HeH","C3H_HeJ","C57BL_10J","C57BR_cdJ","C57L_J","C58_J","CAST_EiJ","CBA_J","DBA_1J","DBA_2J","I_LnJ","LEWES_EiJ","LP_J","MOLF_EiJ","NZB_B1NJ","NZO_HlLtJ","PWK_PhJ","SEA_GnJ","SPRET_EiJ","WSB_EiJ","ZALENDE_EiJ")
result_albinism_all <- finemap(chr=all_chrom, strain1=strains_with_albinism, strain2=strains_without_albinism)
dim(result_albinism_all)
genes_albinism <- annotate_mouse_genes(result_albinism_all)
result_albinism_all_filtered <- finemap(chr=all_chrom, strain1=strains_with_albinism, strain2=strains_without_albinism,impact=c("MODERATE","HIGH"))
dim(result_albinism_all_filtered)
annotate_mouse_genes(result_albinism_all_filtered)
genes_albinism_filtered <- annotate_mouse_genes(result_albinism_all_filtered)
result_albinism_all_filtered_annotated <- annotate_consequences(result_albinism_all_filtered)

# Print regions
old_pos <- -1000000
old_chrom <- 1
num_locus <- 0
num_snvs_per_locus <- 0
for(i in 1:length(result_albinism_all[,1])){
  chrom <- result_albinism_all[i,1]
  pos <- result_albinism_all[i,2]
  if(!(chrom == old_chrom) || !(pos-old_pos<1000000)){
    if(!old_pos == -1000000){
      print(paste("Locus end: ",old_chrom,old_pos))
      print(paste("Number SNVs per locus: ",num_snvs_per_locus))
    }
    print(paste("Locus start: ",chrom,pos))   
    num_locus <- num_locus+1
    num_snvs_per_locus <- 0
  }
  old_chrom <- chrom
  old_pos <- pos
  num_snvs_per_locus <- num_snvs_per_locus+1
}
print(paste("Locus end: ",old_chrom,old_pos))
print(paste("Number SNVs per locus: ",num_snvs_per_locus))
print(paste("Number of loci: ",num_locus))


# DCC example (dystrophic cardiac calcification)
# Strains taken from Tab. 5 Aherrahrou et al., Physiol Genomics, 2007
# NZW, 129S1, C3H, DBA, BALB/C, NZB
strains_with_dcc <- c("C3H_HeJ","NZW_LacJ","129S1_SvImJ","C3H_HeH","C3H_HeJ","DBA_1J","DBA_2J","BALB_cJ","NZB_B1NJ")
# CBA, FVB, MRL, AKR, C57
strains_without_dcc <- c("CBA_J","FVB_NJ","AKR_J","C57BL_10J","C57BL_6J","C57BL_6NJ","C57BR_cdJ","C57L_J")
result_dcc_all <- finemap(chr=all_chrom, strain1=strains_with_dcc, strain2=strains_without_dcc)
dim(result_dcc_all)
result_dcc_all_filtered <- finemap(chr=all_chrom, strain1=strains_with_dcc, strain2=strains_without_dcc,impact=c("MODERATE","HIGH"))
dim(result_dcc_all_filtered)
dcc_genes <- annotate_mouse_genes(result_dcc_all_filtered)
result_dcc_all_filtered_annotated <- annotate_consequences(result_dcc_all_filtered)
result_dcc_all_filtered_annotated_high <- result_dcc_all_filtered_annotated[result_dcc_all_filtered_annotated[,4] %in% c("MODERATE","HIGH"),]

# Print regions
old_pos <- -1000000
old_chrom <- 1
num_locus <- 0
num_snvs_per_locus <- 0
for(i in 1:length(result_dcc_all[,1])){
  chrom <- result_dcc_all[i,1]
  pos <- result_dcc_all[i,2]
  if(!(chrom == old_chrom) || !(pos-old_pos<1000000)){
    if(!old_pos == -1000000){
      print(paste("Locus end: ",old_chrom,old_pos))
      print(paste("Number SNVs per locus: ",num_snvs_per_locus))
    }
    print(paste("Locus start: ",chrom,pos))   
    num_locus <- num_locus+1
    num_snvs_per_locus <- 0
  }
  old_chrom <- chrom
  old_pos <- pos
  num_snvs_per_locus <- num_snvs_per_locus+1
}
print(paste("Locus end: ",old_chrom,old_pos))
print(paste("Number SNVs per locus: ",num_snvs_per_locus))
print(paste("Number of loci: ",num_locus))

