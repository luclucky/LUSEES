# PART 1: Export SimulationResults to '.R'-Files (per 'inSs')

# Packages

require("RPostgreSQL")

# PostgreSQL DB-Connection

drv = dbDriver("PostgreSQL")
con = dbConnect(drv, dbname = "???", host = "???", port = ???, user = "???", password = "???")

# Parameters

inSs = c('sim_000050050', 'sim_100000000', 'sim_050000050', 'sim_000100000', 'sim_050050000', 'sim_000000100', 'sim_050025025', 'sim_025050025', 'sim_025025050') # InputSchemas: Simulation Results of all MPN / LT Proportions

nlm = c('nlmr', 'nlmrc', 'nlmre') # NLMs applied

lus = c(0:9) # LUS: LandUseScenarios; i.e. Number of NLM per LT-Proportion

ees = c('0.0.n', '25.20.r', '25.10.r', '25.5.r', '50.20.r', '50.10.r', '50.5.r', '75.20.r', '75.10.r', '75.5.r') # EES: ExtremeEventsScenarios

pas = c(0:9) # PAS: PatchArragemntSceanrios

#

for (inS in inSs){

  # 'resDF': MetaPopulationNetwork MPN characteristics & Size (Σ MPP) per TimeStep

  resDF = setNames(data.frame(matrix(ncol = 117, nrow = 1 * 1 * 10 * 3 * 10 * 19 * 2)), c('lt_P', 'nlm', 'lus', 'pas', 'ees_I', 'ees_F', 'ees_V', paste0('ts_', seq(1:110))))

  roW = 1

  for (x in nlm){

    for (xx in lus){

      for (xxx in pas){

        for (xxxx in ees){

          # add MPN characteristics

          resDF[roW, 1] = substr(inS[1], 5, 13) # 'lt_P': LanduseType Proportion
          resDF[roW, 2] = x # 'nlm': NLM type applied
          resDF[roW, 3] = xx # 'lus': LandUseScenario Number
          resDF[roW, 4] = xxx # 'pas': PatchArragmentSceanrio Number
          resDF[roW, 5] = strsplit(xxxx, '\\.')[[1]][1] # 'ees_I': ExtremEventScenario Intensity
          resDF[roW, 6] = strsplit(xxxx, '\\.')[[1]][2] # 'ees_F': ExtremEventScenario Frequency
          resDF[roW, 7] = strsplit(xxxx, '\\.')[[1]][3] # 'ees_V': ExtremEventScenario Interval

          print(paste(inS,'.mpn$',x,xx,'pas',xxx,'_ees$',gsub('\\.', '', xxxx), sep = ''))

          colNMS = dbGetQuery(con, paste("SELECT column_name FROM information_schema.columns WHERE table_schema = '", inS,"' AND table_name  = 'mpn$",x,xx,'pas',xxx,'_ees$',gsub('\\.', '', xxxx),"';", sep = ""))[[1]]
          colNMS = colNMS[3:length(colNMS)]

          # 'add_DF': MPN size (Σ MPP) for every TimeStep

          SUM_CMD = paste("SUM(", colNMS, ") AS ", colNMS, ",", collapse=" ")
          SUM_CMD = substr(SUM_CMD, 1, nchar(SUM_CMD)-1)

          add_DF = dbGetQuery(con, paste("SELECT ", SUM_CMD ," FROM ", inS,'.mpn$',x,xx,'pas',xxx,'_ees$',gsub('\\.', '', xxxx),";", sep = ""))

          # Add 'add_DF' to 'resDF'

          resDF[roW, 8:(7+length(add_DF))] = add_DF

          roW = roW + 1

        }

      }

    }

  }

  # Store 'resDF' as 'resDF.Rda'-File

  save(resDF, file = paste0('.../',inS,'.Rda'))

}

