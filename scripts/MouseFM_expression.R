library("MouseFM")

# Get threshold and groupsize parameters
threshold <- as.integer(snakemake@params[["threshold"]])
groupnumber <- as.integer(snakemake@params[["groupsize"]])

# Read in mapping of strain names in expression file to strain names in MouseFM
strain_mapping <- read.table("data/immgen_strain_mapping.txt",sep="\t", header=TRUE)
immgen_strains_in_mousefm <- strain_mapping[strain_mapping$MouseFM_strain_names!="",]

# Read in cis eQTLs of study PMID 252679730
cis_eqtls <- read.table("data/cis_eqtls_pmid_252679730.txt",header=TRUE,sep="\t")
dim(cis_eqtls)

# Read in gene anno; this is the gencode.vM25.annotation.gtf with a last, tab-delimited column added which lists the genename
gene_anno <- read.table("anno/mouse_gene_anno.txt",sep="\t")
# keep only genes
anno_genes <- gene_anno[gene_anno$V3 == "gene",]
head(anno_genes)

# Read in the expression data for the neutrophils (Granulocytes) GSE60336 (PMID: 25267973)
gn_data <- read.csv(file="expression/GSE60336_Normalized_Data.csv",header=TRUE)
dim(gn_data) 
length(unique(gn_data$ProbeSetID)) #24922
length(unique(gn_data$GeneSymbol)) #21755

# Read in the expression data for the CD4+ T Cells GSE60337 (PMID: 25267973)
t4_data <- read.csv(file="expression/GSE60337_Normalized_Data.csv",header=TRUE)
dim(t4_data) 
length(unique(t4_data$ProbeSetID)) #24922
length(unique(t4_data$GeneSymbol)) #21755

# Compute the mean expression
gn_data$mean <- rowMeans(gn_data[,3:length(gn_data[1,])])
t4_data$mean <- rowMeans(t4_data[,3:length(t4_data[1,])])

# Histogram of mean expression
hist(log10(gn_data$mean),breaks=100)
hist(log10(t4_data$mean),breaks=100)

# Boxplots of expression values per sample
boxplot(log10(gn_data[,3:(length(gn_data[1,])-1)]),las=2,cex.axis=0.25)
boxplot(log10(t4_data[,3:(length(t4_data[1,])-1)]),las=2,cex.axis=0.25)


# Keep only strains available in MouseFM

# Samples to strains for GSE60336
samples_GSE60336 <- read.table("data/samples_GSE60336.txt",sep="\t",header=TRUE,comment.char="")
samples_GSE60336_mousefm <- samples_GSE60336[samples_GSE60336$strain %in% immgen_strains_in_mousefm$Immgen_strain_names,]

gn_data_selected <- gn_data[,colnames(gn_data) %in% samples_GSE60336_mousefm$sample]
gn_data_selected$GeneSymbol <- gn_data$GeneSymbol
gn_data_selected$ProbeSetID <- gn_data$ProbeSetID
# Compute the mean expression for the MouseFM strains only
gn_data_selected$mean <- rowMeans(gn_data_selected[,1:(length(gn_data_selected[1,])-2)])
# Keep only genes expressed in MouseFM strains, according to publication, mean>120 expression level on intensity scale
gn_data_selected_expressed <- gn_data_selected[gn_data_selected$mean>120,]
gn_annotated <- merge(gn_data_selected_expressed,anno_genes,by.x="GeneSymbol",by.y="V10")

# How many probes and genes are left?
length(unique(gn_annotated$ProbeSetID))
length(unique(gn_annotated$GeneSymbol))

# Samples to strains for GSE60337
samples_GSE60337 <- read.table("data/samples_GSE60337.txt",sep="\t",header=TRUE,comment.char="")
samples_GSE60337_mousefm <- samples_GSE60337[samples_GSE60337$strain %in% immgen_strains_in_mousefm$Immgen_strain_names,]

t4_data_selected <- t4_data[,colnames(t4_data) %in% samples_GSE60337_mousefm$sample]
t4_data_selected$GeneSymbol <- t4_data$GeneSymbol
t4_data_selected$ProbeSetID <- t4_data$ProbeSetID
# Compute the mean expression for the MouseFM strains only
t4_data_selected$mean <- rowMeans(t4_data_selected[,1:(length(t4_data_selected[1,])-2)])
# Keep only genes expressed in MouseFM strains, according to publication, mean>120 expression level on intensity scale
t4_data_selected_expressed <- t4_data_selected[t4_data_selected$mean>120,]
t4_annotated <- merge(t4_data_selected_expressed,anno_genes,by.x="GeneSymbol",by.y="V10")

# How many probes and genes are left?
length(unique(t4_annotated$ProbeSetID))
length(unique(t4_annotated$GeneSymbol))


###############################################################################
################# GN dataset ##################################################
###############################################################################


i <- 0
for (genenumber in 2:length(gn_annotated[,1])){

  i <- i+1
  print(i)
  
  # Check mean expression
  gene <- gn_annotated[genenumber,]
  gene_expression<- gene[,2:43]
  gene_expression_with_gene <- samples_GSE60336_mousefm
  gene_expression_with_gene$expression<- as.vector(as.numeric(gene_expression))
  gene_expression_with_gene <- gene_expression_with_gene[order(gene_expression_with_gene$expression),]
  gene_expression_with_gene$factor_strain <- factor(gene_expression_with_gene$strain,levels=unique(gene_expression_with_gene$strain))
  
  #print(summary(gene_expression_with_gene))
  #plot(gene_expression_with_gene$factor_strain,gene_expression_with_gene$expression,las=2)
  
  # We require a minimum of 5 strains per group and now check if we see a robust
  # grouping between samples from 5, 6, 7, ..., 20-5=15 strains
  # Hereby, we order the strains tested by the order that results from ordering samples by expression
  strain_order <- unique(gene_expression_with_gene$strain)
  
  max_median_diff = 0
  
  for(first_group_size in groupnumber:(20-groupnumber)){
    expr_first_group <- gene_expression_with_gene[gene_expression_with_gene$strain %in% strain_order[1:first_group_size],]
    expr_second_group <- gene_expression_with_gene[gene_expression_with_gene$strain %in% strain_order[first_group_size+1:length(strain_order)],]
    median_expression_first_group <- median(expr_first_group$expression)
    sd_expression_first_group <- sd(expr_first_group$expression)
    median_expression_second_group <- median(expr_second_group$expression)
    sd_expression_second_group <- sd(expr_second_group$expression)
    #print(expr_first_group)
    #print(expr_second_group)
    
    # Remember the maximum median difference
    median_diff <- abs(median_expression_second_group-median_expression_first_group)
    #print(median_diff)
    
    if(median_diff>max_median_diff)
    {
      first_group_size_for_max <- first_group_size
      max_median_diff = median_diff
      median_expression_first_group_for_max <- median_expression_first_group
      median_expression_second_group_for_max <- median_expression_second_group
      sd_for_max <- max(sd_expression_first_group,sd_expression_second_group)
    }
  }
    
  #print(gene$GeneSymbol)
      
  # Call MouseFM for this example
  mousefm_strains_first <- strain_mapping[strain_mapping$Immgen_strain_names %in% strain_order[1:first_group_size_for_max],2]
  mousefm_strains_second <- strain_mapping[strain_mapping$Immgen_strain_names %in% strain_order[first_group_size_for_max+1:length(strain_order)],2]
  #print(length(mousefm_strains_first))
  #print(length(mousefm_strains_second))
  
  # Get chromosome, start and end of the gene of interest
  gene_info_for_finemappig <- anno_genes[anno_genes$V10 == gene$GeneSymbol,]
  chrom <- gene_info_for_finemappig[1,]$V1
  start <- gene_info_for_finemappig[1,]$V4
  end <- gene_info_for_finemappig[1,]$V5
  strand <- gene_info_for_finemappig[1,]$V7
  
  #print(paste("Chrom: ",chrom,", Start: ",start,", End: ",end,", Strand: ",strand,sep=""))
  
  # The start should be, as in eQTL studies, 1MB from the TSS
  # Here, for simplification, we use 1MB from the start of the gene, if the gene is located
  # on the - strand, then we have to go 1MB from the end (because start<end in gtf file
  # even with the gene is located on the minus strand)
  if(strand == "-"){
    startfm <- max(1,end-1000000)
    endfm <- end+1000000
  }
  else
  {
    startfm <- max(1,start-1000000)
    endfm <- start+1000000
  }
  res_finemap <- finemap(chr=chrom, start=startfm, end=endfm, strain1=mousefm_strains_first, strain2=mousefm_strains_second,thr1=threshold,thr2=threshold)

  # If compatble variants were found
  if(dim(res_finemap)[1] != 0)
  {
    path <- paste("results/GN/thr_",threshold,"/grp_",groupnumber,"/other/",sep="")
    # If this is a previously etected cis eQTL probe
    if(gene$ProbeSetID %in% cis_eqtls$ProbeSetID)
    {
      #print(res_finemap$rsid)
      #print(cis_eqtls[cis_eqtls$ProbeSetID==gene$ProbeSetID,]$BesteQTL)
      # If the variant was a previously reported cis eQTL variant
      if(cis_eqtls[cis_eqtls$ProbeSetID==gene$ProbeSetID,]$BesteQTL %in% res_finemap$rsid)
      {
        path <- paste("results/GN/thr_",threshold,"/grp_",groupnumber,"/validated/",sep="")
      }
      else
      {
        path <- paste("results/GN/thr_",threshold,"/grp_",groupnumber,"/detected/",sep="")
      }
    }
    write.table(file=paste(path,gene$GeneSymbol,"_",gene$ProbeSetID,".txt",sep=""),x=res_finemap,row.names=FALSE)
    pdf(paste(path,gene$GeneSymbol,"_",gene$ProbeSetID,".pdf",sep=""))
    plot(gene_expression_with_gene$factor_strain,gene_expression_with_gene$expression,las=2,main=paste(gene$GeneSymbol," (",first_group_size_for_max,"/",20-first_group_size_for_max,")",sep=""))
    dev.off()
    plot(gene_expression_with_gene$factor_strain,gene_expression_with_gene$expression,las=2,main=paste(gene$GeneSymbol," (",first_group_size_for_max,"/",20-first_group_size_for_max,")",sep=""))
  }
}

# Write an empty "done" file
cat(NULL,file=paste("results/GN/thr_",threshold,"/grp_",groupnumber,"/detected/done",sep=""))
cat(NULL,file=paste("results/GN/thr_",threshold,"/grp_",groupnumber,"/validated/done",sep=""))
cat(NULL,file=paste("results/GN/thr_",threshold,"/grp_",groupnumber,"/other/done",sep=""))


###############################################################################
################# T4 dataset ##################################################
###############################################################################

i <- 0
for (genenumber in 2:length(t4_annotated[,1])){

  i <- i+1
  print(i)
  
  # Check mean expression
  gene <- t4_annotated[genenumber,]
  gene_expression<- gene[,2:44]
  gene_expression_with_gene <- samples_GSE60337_mousefm
  gene_expression_with_gene$expression<- as.vector(as.numeric(gene_expression))
  gene_expression_with_gene <- gene_expression_with_gene[order(gene_expression_with_gene$expression),]
  gene_expression_with_gene$factor_strain <- factor(gene_expression_with_gene$strain,levels=unique(gene_expression_with_gene$strain))
  
  summary(gene_expression_with_gene)
  #plot(gene_expression_with_gene$factor_strain,gene_expression_with_gene$expression,las=2)
  
  # We require a minimum of 5 strains per group and now check if we see a robust
  # grouping between samples from 5, 6, 7, ..., 20-5=15 strains
  # Hereby, we order the strains tested by the order that results from ordering samples by expression
  strain_order <- unique(gene_expression_with_gene$strain)
  
  max_median_diff = 0
  
  for(first_group_size in groupnumber:(20-groupnumber)){
    expr_first_group <- gene_expression_with_gene[gene_expression_with_gene$strain %in% strain_order[1:first_group_size],]
    expr_second_group <- gene_expression_with_gene[gene_expression_with_gene$strain %in% strain_order[first_group_size+1:length(strain_order)],]
    median_expression_first_group <- median(expr_first_group$expression)
    sd_expression_first_group <- sd(expr_first_group$expression)
    median_expression_second_group <- median(expr_second_group$expression)
    sd_expression_second_group <- sd(expr_second_group$expression)
    
    # Remember the maximum median difference
    median_diff <- abs(median_expression_second_group-median_expression_first_group)
    
    if(median_diff>max_median_diff)
    {
      first_group_size_for_max <- first_group_size
      max_median_diff = median_diff
      median_expression_first_group_for_max <- median_expression_first_group
      median_expression_second_group_for_max <- median_expression_second_group
      sd_for_max <- max(sd_expression_first_group,sd_expression_second_group)
    }
  }
    
  #print(gene$GeneSymbol)
      
  # Call MouseFM for this example
  mousefm_strains_first <- strain_mapping[strain_mapping$Immgen_strain_names %in% strain_order[1:first_group_size_for_max],2]
  mousefm_strains_second <- strain_mapping[strain_mapping$Immgen_strain_names %in% strain_order[first_group_size_for_max+1:length(strain_order)],2]
  #print(length(mousefm_strains_first))
  #print(length(mousefm_strains_second))
  
  # Get chromosome, start and end of the gene of interest
  gene_info_for_finemappig <- anno_genes[anno_genes$V10 == gene$GeneSymbol,]
  chrom <- gene_info_for_finemappig[1,]$V1
  start <- gene_info_for_finemappig[1,]$V4
  end <- gene_info_for_finemappig[1,]$V5
  strand <- gene_info_for_finemappig[1,]$V7
  
  #print(paste("Chrom: ",chrom,", Start: ",start,", End: ",end,", Strand: ",strand,sep=""))
  
  # The start should be, as in eQTL studies, 1MB from the TSS
  # Here, for simplification, we use 1MB from the start of the gene, if the gene is located
  # on the - strand, then we have to go 1MB from the end (because start<end in gtf file
  # even with the gene is located on the minus strand)
  if(strand == "-"){
    startfm <- max(1,end-1000000)
    endfm <- end+1000000
  }
  else
  {
    startfm <- max(1,start-1000000)
    endfm <- start+1000000
  }
  res_finemap <- finemap(chr=chrom, start=startfm, end=endfm, strain1=mousefm_strains_first, strain2=mousefm_strains_second,thr1=threshold,thr2=threshold)

  # If compatble variants were found
  if(dim(res_finemap)[1] != 0)
  {
    path <- paste("results/T4/thr_",threshold,"/grp_",groupnumber,"/other/",sep="")
    # If this is a previously etected cis eQTL probe
    if(gene$ProbeSetID %in% cis_eqtls$ProbeSetID)
    {
      #print(res_finemap$rsid)
      #print(cis_eqtls[cis_eqtls$ProbeSetID==gene$ProbeSetID,]$BesteQTL)
      # If the variant was a previously reported cis eQTL variant
      if(cis_eqtls[cis_eqtls$ProbeSetID==gene$ProbeSetID,]$BesteQTL %in% res_finemap$rsid)
      {
        path <- paste("results/T4/thr_",threshold,"/grp_",groupnumber,"/validated/",sep="")
      }
      else
      {
        path <- paste("results/T4/thr_",threshold,"/grp_",groupnumber,"/detected/",sep="")
      }
    }
    write.table(file=paste(path,gene$GeneSymbol,"_",gene$ProbeSetID,".txt",sep=""),x=res_finemap,row.names=FALSE)
    pdf(paste(path,gene$GeneSymbol,"_",gene$ProbeSetID,".pdf",sep=""))
    plot(gene_expression_with_gene$factor_strain,gene_expression_with_gene$expression,las=2,main=paste(gene$GeneSymbol," (",first_group_size_for_max,"/",20-first_group_size_for_max,")",sep=""))
    dev.off()
    plot(gene_expression_with_gene$factor_strain,gene_expression_with_gene$expression,las=2,main=paste(gene$GeneSymbol," (",first_group_size_for_max,"/",20-first_group_size_for_max,")",sep=""))
  }
}

# Write an empty "done" file
cat(NULL,file=paste("results/T4/thr_",threshold,"/grp_",groupnumber,"/detected/done",sep=""))
cat(NULL,file=paste("results/T4/thr_",threshold,"/grp_",groupnumber,"/validated/done",sep=""))
cat(NULL,file=paste("results/T4/thr_",threshold,"/grp_",groupnumber,"/other/done",sep=""))
