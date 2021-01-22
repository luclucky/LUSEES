
# PART 2: Computation of simulated Effect ES & Effect Addition EA (ES-EP) per LUSEES Combination

# Parameters

inSs = c('sim_000050050', 'sim_100000000', 'sim_050000050', 'sim_000100000', 'sim_050050000', 'sim_000000100', 'sim_050025025', 'sim_025050025', 'sim_025025050')

# 'resDF_ALL': DataFrame covering all Simulation Results

resDF_ALL = setNames(data.frame(matrix(ncol = 117, nrow = 0)), c('lt_P', 'nlm', 'lus', 'pas', 'ees_I', 'ees_F', 'ees_V', paste0('ts_', seq(1:110))))

for (inS in inSs){

    load(paste0('.../',inS,'.Rda'))

    resDF_ALL = rbind(resDF_ALL, resDF)

}

#

resDF = resDF_ALL

# 'resDF' reduce to Needed

resDF = resDF[, c(1:8,99:117)]

resDF$`ees` = paste(resDF$`ees_I`, resDF$`ees_F`, sep=' ')

resDF$`tsF` = resDF[,27]

resDF[,29][is.na(resDF[,29])] = 0

resDF = resDF[, c(1:2, 28:29)]

# 'bl': BaseLine; i.e. mean of MPN set ub by optimal LUS level without EES

bl = mean(resDF[resDF$`lt_P`=='100000000' & resDF$`ees`=='0 0', 4])

# A. Computation simulated Effect ES

LUSEES = aggregate(`tsF` ~ `ees`+`lt_P`+`nlm`, data=resDF, mean)
LUSEES$ES = 1 - LUSEES[,4]/bl

# B. Computation Effect Addition EA

# Paramerter

lus = c("100000000","050050000","000100000","050025025","025050025","050000050","025025050","000050050","000000100") # LUS level
ees = c('0 0', '25 20', '25 10', '25 5', '50 20', '50 10', '50 5', '75 20', '75 10', '75 5') # EES level

EESind = aggregate(`tsF` ~ `ees`+`nlm`, data=resDF[resDF$`lt_P`=='100000000', ], mean)
EESind$ES = 1 - EESind[,3]/bl # Computation of individual EES Effect; i.e. mean of MPN set ub by optimal LUS level with EES

LUSind = aggregate(`tsF` ~ `lt_P`+`nlm`, data=resDF[resDF$`ees`=='0 0', ], mean)
LUSind$ES = 1 - LUSind[,3]/bl # Computation of individual LUS Effect; i.e. mean of all MPN set ub by all LUS levels without EES

LUSEES$EP = NA

# Computation of predicted Effect ES

for (x in lus){

  for (xx in ees){

    LUSEES[LUSEES$`ees` == xx & LUSEES$`lt_P` == x, 6] = LUSind[LUSind$`lt_P` == x, 4] + EESind[EESind$`ees` == xx, 4] - LUSind[LUSind$`lt_P` == x, 4] * EESind[EESind$`ees` == xx, 4]

  }

}

# Computation Effect Addition EA; i.e. Deviations of EP & ES

LUSEES$EA = LUSEES$ES - LUSEES$EP
LUSEES$EA = LUSEES$EA

# Data Preparation

LUSEES$`lt_P` = factor(LUSEES$`lt_P`)
LUSEES$`lt_P` = factor(LUSEES$`lt_P`, levels(LUSEES$`lt_P`)[c(9,8,3,7,5,6,4,2,1)])
LUSEES$`ees` = factor(LUSEES$`ees`)
LUSEES$`ees` = factor(LUSEES$`ees`, levels(LUSEES$`ees`)[c(1,3,2,4,6,5,7,9,8,10)])

# Store 'LUSEES' as 'LUSEES.Rda'-File

save(LUSEES, file = paste0('.../LUSEES_EA.Rda'))
