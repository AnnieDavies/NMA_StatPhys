library("readxl")
library("writexl")
library("devtools")

load_all("netmeta-develop")

#read in data from Dias et al (2010)
exceldata <- read_excel(".../Dias2010.xlsx")
Dias <- data.frame(exceldata)

#Perform NMA using netmeta
pDias <- pairwise(list(treat1, treat2, treat3),
                  list(r1, r2, r3),
                  list(n1, n2, n3),
                  data = Dias,
                  studlab = studlab,
                  sm = "OR")
netDias <- netmeta(pDias)

#Create forest plot (Fig ... in Davies and Galla (2022))
forest(netDias, backtransf = FALSE, equal.size = FALSE,
       labels = c("T_1","T_2","T_3","T_4","T_5","T_6","T_7","T_8","T_9"),
       smlab = "Comparison: other vs T_1 \n (Random Effects Model)")

#Create rankogram plots (Fig .. in Davies and Galla (2022))
netrank <- rankogram(netDias)
plot(netrank, sort = FALSE)
