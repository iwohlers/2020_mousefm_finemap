
red <- rgb(228/255,32/255,50/255)
blue <- rgb(0/255,106/255,163/255)
yellow <- rgb(250/255,187/255,0)

pdf("results/num_finemapped.pdf",width=10,height=9.2)

par(mfrow=c(3,2))


########## GN, threshold 0 ################

# GN results; validated; threshold 0
gn_validated_thr0_grp1 <- read.table("results/GN/thr_0/grp_1/validated/summary.txt")
gn_validated_thr0_grp2 <- read.table("results/GN/thr_0/grp_2/validated/summary.txt")
gn_validated_thr0_grp3 <- read.table("results/GN/thr_0/grp_3/validated/summary.txt")
gn_validated_thr0_grp4 <- read.table("results/GN/thr_0/grp_4/validated/summary.txt")
gn_validated_thr0_grp5 <- read.table("results/GN/thr_0/grp_5/validated/summary.txt")
gn_validated_thr0_grp6 <- read.table("results/GN/thr_0/grp_6/validated/summary.txt")
gn_validated_thr0_grp7 <- read.table("results/GN/thr_0/grp_7/validated/summary.txt")
gn_validated_thr0_grp8 <- read.table("results/GN/thr_0/grp_8/validated/summary.txt")
gn_validated_thr0_grp9 <- read.table("results/GN/thr_0/grp_9/validated/summary.txt")
gn_validated_thr0_grp10 <- read.table("results/GN/thr_0/grp_10/validated/summary.txt")

num_gn_validated_thr0 <- rep(0,times=10)
num_gn_validated_thr0[1] <- length(gn_validated_thr0_grp1[,1])
num_gn_validated_thr0[2] <- length(gn_validated_thr0_grp2[,1])
num_gn_validated_thr0[3] <- length(gn_validated_thr0_grp3[,1])
num_gn_validated_thr0[4] <- length(gn_validated_thr0_grp4[,1])
num_gn_validated_thr0[5] <- length(gn_validated_thr0_grp5[,1])
num_gn_validated_thr0[6] <- length(gn_validated_thr0_grp6[,1])
num_gn_validated_thr0[7] <- length(gn_validated_thr0_grp7[,1])
num_gn_validated_thr0[8] <- length(gn_validated_thr0_grp8[,1])
num_gn_validated_thr0[9] <- length(gn_validated_thr0_grp9[,1])
num_gn_validated_thr0[10] <- length(gn_validated_thr0_grp10[,1])

# GN results; detected; threshold 0
gn_detected_thr0_grp1 <- read.table("results/GN/thr_0/grp_1/detected/summary.txt")
gn_detected_thr0_grp2 <- read.table("results/GN/thr_0/grp_2/detected/summary.txt")
gn_detected_thr0_grp3 <- read.table("results/GN/thr_0/grp_3/detected/summary.txt")
gn_detected_thr0_grp4 <- read.table("results/GN/thr_0/grp_4/detected/summary.txt")
gn_detected_thr0_grp5 <- read.table("results/GN/thr_0/grp_5/detected/summary.txt")
gn_detected_thr0_grp6 <- read.table("results/GN/thr_0/grp_6/detected/summary.txt")
gn_detected_thr0_grp7 <- read.table("results/GN/thr_0/grp_7/detected/summary.txt")
gn_detected_thr0_grp8 <- read.table("results/GN/thr_0/grp_8/detected/summary.txt")
gn_detected_thr0_grp9 <- read.table("results/GN/thr_0/grp_9/detected/summary.txt")
gn_detected_thr0_grp10 <- read.table("results/GN/thr_0/grp_10/detected/summary.txt")

num_gn_detected_thr0 <- rep(0,times=10)
num_gn_detected_thr0[1] <- length(gn_detected_thr0_grp1[,1])
num_gn_detected_thr0[2] <- length(gn_detected_thr0_grp2[,1])
num_gn_detected_thr0[3] <- length(gn_detected_thr0_grp3[,1])
num_gn_detected_thr0[4] <- length(gn_detected_thr0_grp4[,1])
num_gn_detected_thr0[5] <- length(gn_detected_thr0_grp5[,1])
num_gn_detected_thr0[6] <- length(gn_detected_thr0_grp6[,1])
num_gn_detected_thr0[7] <- length(gn_detected_thr0_grp7[,1])
num_gn_detected_thr0[8] <- length(gn_detected_thr0_grp8[,1])
num_gn_detected_thr0[9] <- length(gn_detected_thr0_grp9[,1])
num_gn_detected_thr0[10] <- length(gn_detected_thr0_grp10[,1])

# GN results; other; threshold 0
gn_other_thr0_grp1 <- read.table("results/GN/thr_0/grp_1/other/summary.txt")
gn_other_thr0_grp2 <- read.table("results/GN/thr_0/grp_2/other/summary.txt")
gn_other_thr0_grp3 <- read.table("results/GN/thr_0/grp_3/other/summary.txt")
gn_other_thr0_grp4 <- read.table("results/GN/thr_0/grp_4/other/summary.txt")
gn_other_thr0_grp5 <- read.table("results/GN/thr_0/grp_5/other/summary.txt")
gn_other_thr0_grp6 <- read.table("results/GN/thr_0/grp_6/other/summary.txt")
gn_other_thr0_grp7 <- read.table("results/GN/thr_0/grp_7/other/summary.txt")
gn_other_thr0_grp8 <- read.table("results/GN/thr_0/grp_8/other/summary.txt")
gn_other_thr0_grp9 <- read.table("results/GN/thr_0/grp_9/other/summary.txt")
gn_other_thr0_grp10 <- read.table("results/GN/thr_0/grp_10/other/summary.txt")

num_gn_other_thr0 <- rep(0,times=10)
num_gn_other_thr0[1] <- length(gn_other_thr0_grp1[,1])
num_gn_other_thr0[2] <- length(gn_other_thr0_grp2[,1])
num_gn_other_thr0[3] <- length(gn_other_thr0_grp3[,1])
num_gn_other_thr0[4] <- length(gn_other_thr0_grp4[,1])
num_gn_other_thr0[5] <- length(gn_other_thr0_grp5[,1])
num_gn_other_thr0[6] <- length(gn_other_thr0_grp6[,1])
num_gn_other_thr0[7] <- length(gn_other_thr0_grp7[,1])
num_gn_other_thr0[8] <- length(gn_other_thr0_grp8[,1])
num_gn_other_thr0[9] <- length(gn_other_thr0_grp9[,1])
num_gn_other_thr0[10] <- length(gn_other_thr0_grp10[,1])


########## GN, threshold 1 ################

# GN results; validated; threshold 1
gn_validated_thr1_grp1 <- NULL
gn_validated_thr1_grp2 <- read.table("results/GN/thr_1/grp_2/validated/summary.txt")
gn_validated_thr1_grp3 <- read.table("results/GN/thr_1/grp_3/validated/summary.txt")
gn_validated_thr1_grp4 <- read.table("results/GN/thr_1/grp_4/validated/summary.txt")
gn_validated_thr1_grp5 <- read.table("results/GN/thr_1/grp_5/validated/summary.txt")
gn_validated_thr1_grp6 <- read.table("results/GN/thr_1/grp_6/validated/summary.txt")
gn_validated_thr1_grp7 <- read.table("results/GN/thr_1/grp_7/validated/summary.txt")
gn_validated_thr1_grp8 <- read.table("results/GN/thr_1/grp_8/validated/summary.txt")
gn_validated_thr1_grp9 <- read.table("results/GN/thr_1/grp_9/validated/summary.txt")
gn_validated_thr1_grp10 <- read.table("results/GN/thr_1/grp_10/validated/summary.txt")

num_gn_validated_thr1 <- rep(0,times=10)
num_gn_validated_thr1[1] <- NA
num_gn_validated_thr1[2] <- length(gn_validated_thr1_grp2[,1])
num_gn_validated_thr1[3] <- length(gn_validated_thr1_grp3[,1])
num_gn_validated_thr1[4] <- length(gn_validated_thr1_grp4[,1])
num_gn_validated_thr1[5] <- length(gn_validated_thr1_grp5[,1])
num_gn_validated_thr1[6] <- length(gn_validated_thr1_grp6[,1])
num_gn_validated_thr1[7] <- length(gn_validated_thr1_grp7[,1])
num_gn_validated_thr1[8] <- length(gn_validated_thr1_grp8[,1])
num_gn_validated_thr1[9] <- length(gn_validated_thr1_grp9[,1])
num_gn_validated_thr1[10] <- length(gn_validated_thr1_grp10[,1])

# GN results; detected; threshold 1
gn_detected_thr1_grp1 <- NULL
gn_detected_thr1_grp2 <- read.table("results/GN/thr_1/grp_2/detected/summary.txt")
gn_detected_thr1_grp3 <- read.table("results/GN/thr_1/grp_3/detected/summary.txt")
gn_detected_thr1_grp4 <- read.table("results/GN/thr_1/grp_4/detected/summary.txt")
gn_detected_thr1_grp5 <- read.table("results/GN/thr_1/grp_5/detected/summary.txt")
gn_detected_thr1_grp6 <- read.table("results/GN/thr_1/grp_6/detected/summary.txt")
gn_detected_thr1_grp7 <- read.table("results/GN/thr_1/grp_7/detected/summary.txt")
gn_detected_thr1_grp8 <- read.table("results/GN/thr_1/grp_8/detected/summary.txt")
gn_detected_thr1_grp9 <- read.table("results/GN/thr_1/grp_9/detected/summary.txt")
gn_detected_thr1_grp10 <- read.table("results/GN/thr_1/grp_10/detected/summary.txt")

num_gn_detected_thr1 <- rep(0,times=10)
num_gn_detected_thr1[1] <- NA
num_gn_detected_thr1[2] <- length(gn_detected_thr1_grp2[,1])
num_gn_detected_thr1[3] <- length(gn_detected_thr1_grp3[,1])
num_gn_detected_thr1[4] <- length(gn_detected_thr1_grp4[,1])
num_gn_detected_thr1[5] <- length(gn_detected_thr1_grp5[,1])
num_gn_detected_thr1[6] <- length(gn_detected_thr1_grp6[,1])
num_gn_detected_thr1[7] <- length(gn_detected_thr1_grp7[,1])
num_gn_detected_thr1[8] <- length(gn_detected_thr1_grp8[,1])
num_gn_detected_thr1[9] <- length(gn_detected_thr1_grp9[,1])
num_gn_detected_thr1[10] <- length(gn_detected_thr1_grp10[,1])

# GN results; other; threshold 1
gn_other_thr1_grp1 <- NULL
gn_other_thr1_grp2 <- read.table("results/GN/thr_1/grp_2/other/summary.txt")
gn_other_thr1_grp3 <- read.table("results/GN/thr_1/grp_3/other/summary.txt")
gn_other_thr1_grp4 <- read.table("results/GN/thr_1/grp_4/other/summary.txt")
gn_other_thr1_grp5 <- read.table("results/GN/thr_1/grp_5/other/summary.txt")
gn_other_thr1_grp6 <- read.table("results/GN/thr_1/grp_6/other/summary.txt")
gn_other_thr1_grp7 <- read.table("results/GN/thr_1/grp_7/other/summary.txt")
gn_other_thr1_grp8 <- read.table("results/GN/thr_1/grp_8/other/summary.txt")
gn_other_thr1_grp9 <- read.table("results/GN/thr_1/grp_9/other/summary.txt")
gn_other_thr1_grp10 <- read.table("results/GN/thr_1/grp_10/other/summary.txt")

num_gn_other_thr1 <- rep(0,times=10)
num_gn_other_thr1[1] <- NA
num_gn_other_thr1[2] <- length(gn_other_thr1_grp2[,1])
num_gn_other_thr1[3] <- length(gn_other_thr1_grp3[,1])
num_gn_other_thr1[4] <- length(gn_other_thr1_grp4[,1])
num_gn_other_thr1[5] <- length(gn_other_thr1_grp5[,1])
num_gn_other_thr1[6] <- length(gn_other_thr1_grp6[,1])
num_gn_other_thr1[7] <- length(gn_other_thr1_grp7[,1])
num_gn_other_thr1[8] <- length(gn_other_thr1_grp8[,1])
num_gn_other_thr1[9] <- length(gn_other_thr1_grp9[,1])
num_gn_other_thr1[10] <- length(gn_other_thr1_grp10[,1])


########## GN, number evaluated plotting ################

plot(1:10,log10(num_gn_other_thr0),col=yellow,type="l",ylim=c(0.5,4.5),xlab="Minimum size of smaller group",ylab="log10 (# fine-mapped transcripts)", main="Neutrophils")
add=TRUE
lines(1:10,log10(num_gn_other_thr0),col=yellow,type="p",pch=16)
lines(1:10,log10(num_gn_detected_thr0),col=red,type="l")
lines(1:10,log10(num_gn_detected_thr0),col=red,type="p",pch=16)
lines(1:10,log10(num_gn_validated_thr0),col=blue,type="l")
lines(1:10,log10(num_gn_validated_thr0),col=blue,type="p",pch=16)

lines(1:10,log10(num_gn_other_thr1),col=yellow,type="l",lty=3)
lines(1:10,log10(num_gn_other_thr1),col=yellow,type="p",pch=16)
lines(1:10,log10(num_gn_detected_thr1),col=red,type="l",lty=3)
lines(1:10,log10(num_gn_detected_thr1),col=red,type="p",pch=16)
lines(1:10,log10(num_gn_validated_thr1),col=blue,type="l",lty=3)
lines(1:10,log10(num_gn_validated_thr1),col=blue,type="p",pch=16)

legend("topright", legend=c("No eQTL transcript","eQTL transcript","eQTL transcript/variant","Threshold 0","Threshold 1"),col=c(yellow,red,blue,"black","black"), lty=c(NA,NA,NA,1,3), pch=c(15,15,15,NA,NA))


########## T4, threshold 0 ################

# T4 results; validated; threshold 0
t4_validated_thr0_grp1 <- read.table("results/T4/thr_0/grp_1/validated/summary.txt")
t4_validated_thr0_grp2 <- read.table("results/T4/thr_0/grp_2/validated/summary.txt")
t4_validated_thr0_grp3 <- read.table("results/T4/thr_0/grp_3/validated/summary.txt")
t4_validated_thr0_grp4 <- read.table("results/T4/thr_0/grp_4/validated/summary.txt")
t4_validated_thr0_grp5 <- read.table("results/T4/thr_0/grp_5/validated/summary.txt")
t4_validated_thr0_grp6 <- read.table("results/T4/thr_0/grp_6/validated/summary.txt")
t4_validated_thr0_grp7 <- read.table("results/T4/thr_0/grp_7/validated/summary.txt")
t4_validated_thr0_grp8 <- read.table("results/T4/thr_0/grp_8/validated/summary.txt")
t4_validated_thr0_grp9 <- read.table("results/T4/thr_0/grp_9/validated/summary.txt")
t4_validated_thr0_grp10 <- read.table("results/T4/thr_0/grp_10/validated/summary.txt")

num_t4_validated_thr0 <- rep(0,times=10)
num_t4_validated_thr0[1] <- length(t4_validated_thr0_grp1[,1])
num_t4_validated_thr0[2] <- length(t4_validated_thr0_grp2[,1])
num_t4_validated_thr0[3] <- length(t4_validated_thr0_grp3[,1])
num_t4_validated_thr0[4] <- length(t4_validated_thr0_grp4[,1])
num_t4_validated_thr0[5] <- length(t4_validated_thr0_grp5[,1])
num_t4_validated_thr0[6] <- length(t4_validated_thr0_grp6[,1])
num_t4_validated_thr0[7] <- length(t4_validated_thr0_grp7[,1])
num_t4_validated_thr0[8] <- length(t4_validated_thr0_grp8[,1])
num_t4_validated_thr0[9] <- length(t4_validated_thr0_grp9[,1])
num_t4_validated_thr0[10] <- length(t4_validated_thr0_grp10[,1])

# T4 results; detected; threshold 0
t4_detected_thr0_grp1 <- read.table("results/T4/thr_0/grp_1/detected/summary.txt")
t4_detected_thr0_grp2 <- read.table("results/T4/thr_0/grp_2/detected/summary.txt")
t4_detected_thr0_grp3 <- read.table("results/T4/thr_0/grp_3/detected/summary.txt")
t4_detected_thr0_grp4 <- read.table("results/T4/thr_0/grp_4/detected/summary.txt")
t4_detected_thr0_grp5 <- read.table("results/T4/thr_0/grp_5/detected/summary.txt")
t4_detected_thr0_grp6 <- read.table("results/T4/thr_0/grp_6/detected/summary.txt")
t4_detected_thr0_grp7 <- read.table("results/T4/thr_0/grp_7/detected/summary.txt")
t4_detected_thr0_grp8 <- read.table("results/T4/thr_0/grp_8/detected/summary.txt")
t4_detected_thr0_grp9 <- read.table("results/T4/thr_0/grp_9/detected/summary.txt")
t4_detected_thr0_grp10 <- read.table("results/T4/thr_0/grp_10/detected/summary.txt")

num_t4_detected_thr0 <- rep(0,times=10)
num_t4_detected_thr0[1] <- length(t4_detected_thr0_grp1[,1])
num_t4_detected_thr0[2] <- length(t4_detected_thr0_grp2[,1])
num_t4_detected_thr0[3] <- length(t4_detected_thr0_grp3[,1])
num_t4_detected_thr0[4] <- length(t4_detected_thr0_grp4[,1])
num_t4_detected_thr0[5] <- length(t4_detected_thr0_grp5[,1])
num_t4_detected_thr0[6] <- length(t4_detected_thr0_grp6[,1])
num_t4_detected_thr0[7] <- length(t4_detected_thr0_grp7[,1])
num_t4_detected_thr0[8] <- length(t4_detected_thr0_grp8[,1])
num_t4_detected_thr0[9] <- length(t4_detected_thr0_grp9[,1])
num_t4_detected_thr0[10] <- length(t4_detected_thr0_grp10[,1])

# T4 results; other; threshold 0
t4_other_thr0_grp1 <- read.table("results/T4/thr_0/grp_1/other/summary.txt")
t4_other_thr0_grp2 <- read.table("results/T4/thr_0/grp_2/other/summary.txt")
t4_other_thr0_grp3 <- read.table("results/T4/thr_0/grp_3/other/summary.txt")
t4_other_thr0_grp4 <- read.table("results/T4/thr_0/grp_4/other/summary.txt")
t4_other_thr0_grp5 <- read.table("results/T4/thr_0/grp_5/other/summary.txt")
t4_other_thr0_grp6 <- read.table("results/T4/thr_0/grp_6/other/summary.txt")
t4_other_thr0_grp7 <- read.table("results/T4/thr_0/grp_7/other/summary.txt")
t4_other_thr0_grp8 <- read.table("results/T4/thr_0/grp_8/other/summary.txt")
t4_other_thr0_grp9 <- read.table("results/T4/thr_0/grp_9/other/summary.txt")
t4_other_thr0_grp10 <- read.table("results/T4/thr_0/grp_10/other/summary.txt")

num_t4_other_thr0 <- rep(0,times=10)
num_t4_other_thr0[1] <- length(t4_other_thr0_grp1[,1])
num_t4_other_thr0[2] <- length(t4_other_thr0_grp2[,1])
num_t4_other_thr0[3] <- length(t4_other_thr0_grp3[,1])
num_t4_other_thr0[4] <- length(t4_other_thr0_grp4[,1])
num_t4_other_thr0[5] <- length(t4_other_thr0_grp5[,1])
num_t4_other_thr0[6] <- length(t4_other_thr0_grp6[,1])
num_t4_other_thr0[7] <- length(t4_other_thr0_grp7[,1])
num_t4_other_thr0[8] <- length(t4_other_thr0_grp8[,1])
num_t4_other_thr0[9] <- length(t4_other_thr0_grp9[,1])
num_t4_other_thr0[10] <- length(t4_other_thr0_grp10[,1])


########## T4, threshold 1 ################

# T4 results; validated; threshold 1
t4_validated_thr1_grp1 <- NULL
t4_validated_thr1_grp2 <- read.table("results/T4/thr_1/grp_2/validated/summary.txt")
t4_validated_thr1_grp3 <- read.table("results/T4/thr_1/grp_3/validated/summary.txt")
t4_validated_thr1_grp4 <- read.table("results/T4/thr_1/grp_4/validated/summary.txt")
t4_validated_thr1_grp5 <- read.table("results/T4/thr_1/grp_5/validated/summary.txt")
t4_validated_thr1_grp6 <- read.table("results/T4/thr_1/grp_6/validated/summary.txt")
t4_validated_thr1_grp7 <- read.table("results/T4/thr_1/grp_7/validated/summary.txt")
t4_validated_thr1_grp8 <- read.table("results/T4/thr_1/grp_8/validated/summary.txt")
t4_validated_thr1_grp9 <- read.table("results/T4/thr_1/grp_9/validated/summary.txt")
t4_validated_thr1_grp10 <- read.table("results/T4/thr_1/grp_10/validated/summary.txt")

num_t4_validated_thr1 <- rep(0,times=10)
num_t4_validated_thr1[1] <- NA
num_t4_validated_thr1[2] <- length(t4_validated_thr1_grp2[,1])
num_t4_validated_thr1[3] <- length(t4_validated_thr1_grp3[,1])
num_t4_validated_thr1[4] <- length(t4_validated_thr1_grp4[,1])
num_t4_validated_thr1[5] <- length(t4_validated_thr1_grp5[,1])
num_t4_validated_thr1[6] <- length(t4_validated_thr1_grp6[,1])
num_t4_validated_thr1[7] <- length(t4_validated_thr1_grp7[,1])
num_t4_validated_thr1[8] <- length(t4_validated_thr1_grp8[,1])
num_t4_validated_thr1[9] <- length(t4_validated_thr1_grp9[,1])
num_t4_validated_thr1[10] <- length(t4_validated_thr1_grp10[,1])

# T4 results; detected; threshold 1
t4_detected_thr1_grp1 <- NULL
t4_detected_thr1_grp2 <- read.table("results/T4/thr_1/grp_2/detected/summary.txt")
t4_detected_thr1_grp3 <- read.table("results/T4/thr_1/grp_3/detected/summary.txt")
t4_detected_thr1_grp4 <- read.table("results/T4/thr_1/grp_4/detected/summary.txt")
t4_detected_thr1_grp5 <- read.table("results/T4/thr_1/grp_5/detected/summary.txt")
t4_detected_thr1_grp6 <- read.table("results/T4/thr_1/grp_6/detected/summary.txt")
t4_detected_thr1_grp7 <- read.table("results/T4/thr_1/grp_7/detected/summary.txt")
t4_detected_thr1_grp8 <- read.table("results/T4/thr_1/grp_8/detected/summary.txt")
t4_detected_thr1_grp9 <- read.table("results/T4/thr_1/grp_9/detected/summary.txt")
t4_detected_thr1_grp10 <- read.table("results/T4/thr_1/grp_10/detected/summary.txt")

num_t4_detected_thr1 <- rep(0,times=10)
num_t4_detected_thr1[1] <- NA
num_t4_detected_thr1[2] <- length(t4_detected_thr1_grp2[,1])
num_t4_detected_thr1[3] <- length(t4_detected_thr1_grp3[,1])
num_t4_detected_thr1[4] <- length(t4_detected_thr1_grp4[,1])
num_t4_detected_thr1[5] <- length(t4_detected_thr1_grp5[,1])
num_t4_detected_thr1[6] <- length(t4_detected_thr1_grp6[,1])
num_t4_detected_thr1[7] <- length(t4_detected_thr1_grp7[,1])
num_t4_detected_thr1[8] <- length(t4_detected_thr1_grp8[,1])
num_t4_detected_thr1[9] <- length(t4_detected_thr1_grp9[,1])
num_t4_detected_thr1[10] <- length(t4_detected_thr1_grp10[,1])

# T4 results; other; threshold 1
t4_other_thr1_grp1 <- NULL
t4_other_thr1_grp2 <- read.table("results/T4/thr_1/grp_2/other/summary.txt")
t4_other_thr1_grp3 <- read.table("results/T4/thr_1/grp_3/other/summary.txt")
t4_other_thr1_grp4 <- read.table("results/T4/thr_1/grp_4/other/summary.txt")
t4_other_thr1_grp5 <- read.table("results/T4/thr_1/grp_5/other/summary.txt")
t4_other_thr1_grp6 <- read.table("results/T4/thr_1/grp_6/other/summary.txt")
t4_other_thr1_grp7 <- read.table("results/T4/thr_1/grp_7/other/summary.txt")
t4_other_thr1_grp8 <- read.table("results/T4/thr_1/grp_8/other/summary.txt")
t4_other_thr1_grp9 <- read.table("results/T4/thr_1/grp_9/other/summary.txt")
t4_other_thr1_grp10 <- read.table("results/T4/thr_1/grp_10/other/summary.txt")

num_t4_other_thr1 <- rep(0,times=10)
num_t4_other_thr1[1] <- NA
num_t4_other_thr1[2] <- length(t4_other_thr1_grp2[,1])
num_t4_other_thr1[3] <- length(t4_other_thr1_grp3[,1])
num_t4_other_thr1[4] <- length(t4_other_thr1_grp4[,1])
num_t4_other_thr1[5] <- length(t4_other_thr1_grp5[,1])
num_t4_other_thr1[6] <- length(t4_other_thr1_grp6[,1])
num_t4_other_thr1[7] <- length(t4_other_thr1_grp7[,1])
num_t4_other_thr1[8] <- length(t4_other_thr1_grp8[,1])
num_t4_other_thr1[9] <- length(t4_other_thr1_grp9[,1])
num_t4_other_thr1[10] <- length(t4_other_thr1_grp10[,1])


########## T4, number evaluated plotting ################

plot(1:10,log10(num_t4_other_thr0),col=yellow,type="l",ylim=c(0.5,4.5),xlab="Minimum size of smaller group",ylab="log10 (# fine-mapped transcripts)",main="CD4+ T cells")
add=TRUE
lines(1:10,log10(num_t4_other_thr0),col=yellow,type="p",pch=16)
lines(1:10,log10(num_t4_detected_thr0),col=red,type="l")
lines(1:10,log10(num_t4_detected_thr0),col=red,type="p",pch=16)
lines(1:10,log10(num_t4_validated_thr0),col=blue,type="l")
lines(1:10,log10(num_t4_validated_thr0),col=blue,type="p",pch=16)

lines(1:10,log10(num_t4_other_thr1),col=yellow,type="l",lty=3)
lines(1:10,log10(num_t4_other_thr1),col=yellow,type="p",pch=16)
lines(1:10,log10(num_t4_detected_thr1),col=red,type="l",lty=3)
lines(1:10,log10(num_t4_detected_thr1),col=red,type="p",pch=16)
lines(1:10,log10(num_t4_validated_thr1),col=blue,type="l",lty=3)
lines(1:10,log10(num_t4_validated_thr1),col=blue,type="p",pch=16)



########## GN, threshold 0 ################

# Combine numbers in list
all_nums <- list(
  log10(gn_validated_thr0_grp1$V1), log10(gn_detected_thr0_grp1$V1), log10(gn_other_thr0_grp1$V1),
  log10(gn_validated_thr0_grp2$V1), log10(gn_detected_thr0_grp2$V1), log10(gn_other_thr0_grp2$V1),
  log10(gn_validated_thr0_grp3$V1), log10(gn_detected_thr0_grp3$V1), log10(gn_other_thr0_grp3$V1),
  log10(gn_validated_thr0_grp4$V1), log10(gn_detected_thr0_grp4$V1), log10(gn_other_thr0_grp4$V1),
  log10(gn_validated_thr0_grp5$V1), log10(gn_detected_thr0_grp5$V1), log10(gn_other_thr0_grp5$V1),
  log10(gn_validated_thr0_grp6$V1), log10(gn_detected_thr0_grp6$V1), log10(gn_other_thr0_grp6$V1),
  log10(gn_validated_thr0_grp7$V1), log10(gn_detected_thr0_grp7$V1), log10(gn_other_thr0_grp7$V1),
  log10(gn_validated_thr0_grp8$V1), log10(gn_detected_thr0_grp8$V1), log10(gn_other_thr0_grp8$V1),
  log10(gn_validated_thr0_grp9$V1), log10(gn_detected_thr0_grp9$V1), log10(gn_other_thr0_grp9$V1),
  log10(gn_validated_thr0_grp10$V1), log10(gn_detected_thr0_grp10$V1), log10(gn_other_thr0_grp10$V1)
)
boxplot_labels <- rep("",times=30)
for(i in 0:9){
  boxplot_labels[i*3+1] <- paste(" (n=",num_gn_validated_thr0[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+2] <- paste(" (n=",num_gn_detected_thr0[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+3] <- paste(" (n=",num_gn_other_thr0[i+1],") ",i+1,sep="")
}
cols <- rep(c(blue,red,yellow),times=10)

# Boxplots
boxplot(all_nums,col=cols,names=boxplot_labels,las=2,ylab="log10 (# fine-mapped variants)",main="Neutrophils, threshold 0")


########## T4, threshold 0 ################


# Combine numbers in list
all_nums <- list(
  log10(t4_validated_thr0_grp1$V1), log10(t4_detected_thr0_grp1$V1), log10(t4_other_thr0_grp1$V1),
  log10(t4_validated_thr0_grp2$V1), log10(t4_detected_thr0_grp2$V1), log10(t4_other_thr0_grp2$V1),
  log10(t4_validated_thr0_grp3$V1), log10(t4_detected_thr0_grp3$V1), log10(t4_other_thr0_grp3$V1),
  log10(t4_validated_thr0_grp4$V1), log10(t4_detected_thr0_grp4$V1), log10(t4_other_thr0_grp4$V1),
  log10(t4_validated_thr0_grp5$V1), log10(t4_detected_thr0_grp5$V1), log10(t4_other_thr0_grp5$V1),
  log10(t4_validated_thr0_grp6$V1), log10(t4_detected_thr0_grp6$V1), log10(t4_other_thr0_grp6$V1),
  log10(t4_validated_thr0_grp7$V1), log10(t4_detected_thr0_grp7$V1), log10(t4_other_thr0_grp7$V1),
  log10(t4_validated_thr0_grp8$V1), log10(t4_detected_thr0_grp8$V1), log10(t4_other_thr0_grp8$V1),
  log10(t4_validated_thr0_grp9$V1), log10(t4_detected_thr0_grp9$V1), log10(t4_other_thr0_grp9$V1),
  log10(t4_validated_thr0_grp10$V1), log10(t4_detected_thr0_grp10$V1), log10(t4_other_thr0_grp10$V1)
)
boxplot_labels <- rep("",times=30)
for(i in 0:9){
  boxplot_labels[i*3+1] <- paste(" (n=",num_t4_validated_thr0[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+2] <- paste(" (n=",num_t4_detected_thr0[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+3] <- paste(" (n=",num_t4_other_thr0[i+1],") ",i+1,sep="")
}
cols <- rep(c(blue,red,yellow),times=10)

# Boxplots vioplot::vioplot
boxplot(all_nums,col=cols,names=boxplot_labels,las=2,ylab="log10 (# fine-mapped variants)", main="CD4+ T cells, threshold 0")


########## GN, threshold 1 ################

# Combine numbers in list
all_nums <- list(
  NULL, NULL, NULL,
  log10(gn_validated_thr1_grp2$V1), log10(gn_detected_thr1_grp2$V1), log10(gn_other_thr1_grp2$V1),
  log10(gn_validated_thr1_grp3$V1), log10(gn_detected_thr1_grp3$V1), log10(gn_other_thr1_grp3$V1),
  log10(gn_validated_thr1_grp4$V1), log10(gn_detected_thr1_grp4$V1), log10(gn_other_thr1_grp4$V1),
  log10(gn_validated_thr1_grp5$V1), log10(gn_detected_thr1_grp5$V1), log10(gn_other_thr1_grp5$V1),
  log10(gn_validated_thr1_grp6$V1), log10(gn_detected_thr1_grp6$V1), log10(gn_other_thr1_grp6$V1),
  log10(gn_validated_thr1_grp7$V1), log10(gn_detected_thr1_grp7$V1), log10(gn_other_thr1_grp7$V1),
  log10(gn_validated_thr1_grp8$V1), log10(gn_detected_thr1_grp8$V1), log10(gn_other_thr1_grp8$V1),
  log10(gn_validated_thr1_grp9$V1), log10(gn_detected_thr1_grp9$V1), log10(gn_other_thr1_grp9$V1),
  log10(gn_validated_thr1_grp10$V1), log10(gn_detected_thr1_grp10$V1), log10(gn_other_thr1_grp10$V1)
)
boxplot_labels <- rep("",times=30)
for(i in 0:9){
  boxplot_labels[i*3+1] <- paste(" (n=",num_gn_validated_thr1[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+2] <- paste(" (n=",num_gn_detected_thr1[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+3] <- paste(" (n=",num_gn_other_thr1[i+1],") ",i+1,sep="")
}
cols <- rep(c(blue,red,yellow),times=10)

# Boxplots
boxplot(all_nums,col=cols,names=boxplot_labels,las=2,ylab="log10 (# fine-mapped variants)", main="Neutrophils, threshold 1")


########## T4, threshold 1 ################


# Combine numbers in list
all_nums <- list(
  NULL, NULL, NULL,
  log10(t4_validated_thr1_grp2$V1), log10(t4_detected_thr1_grp2$V1), log10(t4_other_thr1_grp2$V1),
  log10(t4_validated_thr1_grp3$V1), log10(t4_detected_thr1_grp3$V1), log10(t4_other_thr1_grp3$V1),
  log10(t4_validated_thr1_grp4$V1), log10(t4_detected_thr1_grp4$V1), log10(t4_other_thr1_grp4$V1),
  log10(t4_validated_thr1_grp5$V1), log10(t4_detected_thr1_grp5$V1), log10(t4_other_thr1_grp5$V1),
  log10(t4_validated_thr1_grp6$V1), log10(t4_detected_thr1_grp6$V1), log10(t4_other_thr1_grp6$V1),
  log10(t4_validated_thr1_grp7$V1), log10(t4_detected_thr1_grp7$V1), log10(t4_other_thr1_grp7$V1),
  log10(t4_validated_thr1_grp8$V1), log10(t4_detected_thr1_grp8$V1), log10(t4_other_thr1_grp8$V1),
  log10(t4_validated_thr1_grp9$V1), log10(t4_detected_thr1_grp9$V1), log10(t4_other_thr1_grp9$V1),
  log10(t4_validated_thr1_grp10$V1), log10(t4_detected_thr1_grp10$V1), log10(t4_other_thr1_grp10$V1)
)
boxplot_labels <- rep("",times=30)
for(i in 0:9){
  boxplot_labels[i*3+1] <- paste(" (n=",num_t4_validated_thr1[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+2] <- paste(" (n=",num_t4_detected_thr1[i+1],") ",i+1,sep="")
  boxplot_labels[i*3+3] <- paste(" (n=",num_t4_other_thr1[i+1],") ",i+1,sep="")
}
cols <- rep(c(blue,red,yellow),times=10)

# Boxplots vioplot::vioplot
boxplot(all_nums,col=cols,names=boxplot_labels,las=2,ylab="log10 (# fine-mapped variants)", main="CD4+ T cells, threshold 1")



dev.off()
