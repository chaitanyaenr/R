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
interfaces <- c(1,2,3,6,7,9,10,11)
octets <- function(interface){
sum(data[data[[1]]==interface, c(3,4)])}
packet <- function(interface)
{
    sum(data[data[[1]]==interface, c(2,5,6,7)])
} 
data.frame(interface=interfaces, 
          bytes=sapply(interfaces, octets), packets=sapply(interfaces,packet))







