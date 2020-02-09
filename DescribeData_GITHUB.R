
#--------------------------------------------------------------------------------
# Summarize data
#--------------------------------------------------------------------------------

Years = c(1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014)

TABLE = NULL

Data_year =  stock_data[Year %in% Years[1:9]]
Data_year = Data_year[,c("PERMNO", "gind", "RETX", "Month")]

IndustryNumber = Data_year[,c("PERMNO", "Month","gind")]
IndustryNumber = cbind(IndustryNumber, ONES = rep(1, nrow(IndustryNumber)))
IndustryNumber = IndustryNumber[, sum(ONES, na.rm = TRUE), by = list(Month,gind)]
IndustryNumber = IndustryNumber[, max(V1, na.rm = TRUE), by = gind]

Nk = as.numeric(IndustryNumber$V1)

RET = Data_year[,c("PERMNO", "Month","gind", "RETX")]
RET = RET[, mean(as.numeric(as.character(RETX)), na.rm = TRUE), by = list(gind)]

TABLE = rbind(TABLE,c(sum(Nk)/9,mean(Nk)/9,sd(Nk)/9,min(Nk)/9,max(Nk)/9, 
		mean(RET$V1, na.rm = TRUE),sd(RET$V1, na.rm = TRUE),
		min(RET$V1, na.rm = TRUE),max(RET$V1, na.rm = TRUE)))
	
Data_year =  stock_data[Year %in% Years[10:16]]
Data_year = Data_year[,c("PERMNO", "gind",v"RETX", "Month")]

IndustryNumber = Data_year[,c("PERMNO", "Month","gind")]
IndustryNumber = cbind(IndustryNumber, ONES = rep(1, nrow(IndustryNumber)))
IndustryNumber = IndustryNumber[, sum(ONES, na.rm = TRUE), by = list(Month,gind)]
IndustryNumber = IndustryNumber[, max(V1, na.rm = TRUE), by = gind]

Nk = as.numeric(IndustryNumber$V1)

RET = Data_year[,c("PERMNO", "Month","gind", "RETX")]
RET = RET[, mean(as.numeric(as.character(RETX)), na.rm = TRUE), by = list(gind)]

TABLE = rbind(TABLE,c(sum(Nk)/7,mean(Nk)/7,sd(Nk)/7,min(Nk)/7,max(Nk)/7, 
		mean(RET$V1, na.rm = TRUE),sd(RET$V1, na.rm = TRUE),
		min(RET$V1, na.rm = TRUE),max(RET$V1, na.rm = TRUE)))
	

t(round(TABLE,2)) 

