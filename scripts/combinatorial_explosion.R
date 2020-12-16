 
pdf("results/max_num_comb.pdf",width=5,height=5)
plot(1:37,rep(log10(74480058),times=37),type='l',ylim=c(0,12),ylab='log10 (maximum # genotype combinations)',xlab="Number of strains with alt allele")
add=TRUE
grid(col = "lightgray", lty = "dotted")
abline(h=log10(74480058),col="darkgray")
#abline(h=log10(9*74480058/10),col="darkgray")
#abline(h=log10(74480058/2),col="darkgray")
#abline(h=log10(74480058/10),col="darkgray")
#abline(h=log10(74480058/100),col="darkgray")

max_combinations <- rep(1,times=37)
for(num_strains in 2:37){
  prec_numbers <- choose(num_strains,0:num_strains)
  #lines(0:num_strains,log10(choose(num_strains,0:num_strains)),type="l")
  summed_numbers <- rep(1,times=length(prec_numbers))
  for(i in 1:num_strains+1){
      summed_numbers[i] <- summed_numbers[i-1]+prec_numbers[i]
      print(summed_numbers[i-1]+prec_numbers[i])
  }
  max_combinations[num_strains] <- summed_numbers[num_strains+1]
  lines(0:num_strains,log10(summed_numbers),type="l",col=rainbow(37)[num_strains])
}
dev.off()

pdf("results/legend.pdf")
plot(0,0)
legend_labels <- 1:37
legend("bottomright",fill=rainbow(37),title="Overall strain number",legend=legend_labels,cex=0.4,border="white",bty="n")
dev.off()