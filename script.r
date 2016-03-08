temporaryFile <- tempfile()
download.file("https://www.dropbox.com/s/zjf0lm830wzmkwz/snmp-delta.csv?dl=0",
                  destfile=temporaryFile, method="curl", extra="-L")
snmpData = read.csv(temporaryFile)
interface <- c(snmpData$if.)
outUCastPkts <- c(snmpData$outUCastPkts)
inOctets <- c(snmpData$inOctets)
outOctets <- c(snmpData$outOctets)
inUcastPkts <- c(snmpData$inUcastPkts)
outNUCastPkts <- c(snmpData$outNUCastPkts)
inNUcastPkts <- c(snmpData$inNUcastPkts)
data <- data.frame(if.=interface,outUCastPkts=outUCastPkts,inOctets=inOctets,outOctets=outOctets,inUcastPkts=inUcastPkts,outNUCastPkts=outNUCastPkts,inNUcastPkts=inNUcastPkts )
interface1_outUcast <- sum(data[data$if. == "1","outUCastPkts" ])
interface1_inoctets <- sum(data[data$if. == "1","inOctets" ])
interface1_ooctets <- sum(data[data$if. == "1","outOctets" ])
interface1_inUcastpkts <- sum(data[data$if. == "1","inUcastPkts" ])
interface1_outnu <- sum(data[data$if. == "1","outNUCastPkts" ])
interface1_innu <- sum(data[data$if. == "1","inNUcastPkts" ])
data <- data.frame(if.=1, outUCastPkts=interface1_outUcast)
data
interface2 <- c(data[data$if. == "2", ])
interface3 <- c(data[data$if. == "3", ])
interface6 <- c(data[data$if. == "6", ])
interface7 <- c(data[data$if. == "7", ])
interface9 <- c(data[data$if. == "9", ])
interface10 <- c(data[data$if. == "10", ])
interface11 <- c(data[data$if. == "11", ])




