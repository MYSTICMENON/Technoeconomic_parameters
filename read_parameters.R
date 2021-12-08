install.packages("readxl")
library(readxl)

## read hot metal production 
Hot_metal_prod_2019 <- read_excel("./DataScience-BF/VPARAMETERS(2019-20)C&IT.xls",range = "B10:H23")
Hot_metal_prod_2020 <- read_excel("./DataScience-BF/VPARAMETERS(2020-21)C&IT.xls",range = "B8:H22")
Hot_metal_prod_2021 <- read_excel("./DataScience-BF/VPARAMETERS(2021-22)C&IT.xls",range = "B8:H22")

## Average Daily rate of production
Avg_Dly_Rate_Prod_2019 <- read_excel("./DataScience-BF/VPARAMETERS(2019-20)C&IT.xls",range = "A28:I43")
Avg_Dly_Rate_Prod_2020 <- read_excel("./DataScience-BF/VPARAMETERS(2020-21)C&IT.xls",range = "A27:H41")
Avg_Dly_Rate_Prod_2021 <- read_excel("./DataScience-BF/VPARAMETERS(2021-22)C&IT.xls",range = "A27:H41")

## Hot Blast temp 
Hot_Blast_temp_2019 <- read_excel("./DataScience-BF/VPARAMETERS(2019-20)C&IT.xls",range = "A48:I63")
Hot_Blast_temp_2020 <- read_excel("./DataScience-BF/VPARAMETERS(2020-21)C&IT.xls",range = "A46:H60")
Hot_Blast_temp_2021 <- read_excel("./DataScience-BF/VPARAMETERS(2021-22)C&IT.xls",range = "A46:H60")

##Useful volume/day 
Vol_Day_2019 <- read_excel("./DataScience-BF/VPARAMETERS(2019-20)C&IT.xls",range = "N72:T85")
Vol_Day_2020 <- read_excel("./DataScience-BF/VPARAMETERS(2020-21)C&IT.xls",range = "N65:T79")
Vol_Day_2021 <- read_excel("./DataScience-BF/VPARAMETERS(2021-22)C&IT.xls",range = "N67:T81")

## Kg of coke 
Coke_kg_2019 <- read_excel("./DataScience-BF/VPARAMETERS(2019-20)C&IT.xls",range = "N92:T105")
Coke_kg_2020 <- read_excel("./DataScience-BF/VPARAMETERS(2020-21)C&IT.xls",range = "N84:T98")
Coke_kg_2021 <- read_excel("./DataScience-BF/VPARAMETERS(2021-22)C&IT.xls",range = "N86:T100")


## Kg of CDI
CDI_kg_2019 <- read_excel("./DataScience-BF/VPARAMETERS(2019-20)C&IT.xls",range = "N113:T126")
CDI_kg_2020 <- read_excel("./DataScience-BF/VPARAMETERS(2020-21)C&IT.xls",range = "N104:T118")
CDI_kg_2021 <- read_excel("./DataScience-BF/VPARAMETERS(2021-22)C&IT.xls",range = "N106:T120")

## KG of Nutcoke 
nut_coke_2019 <-  read_excel("./DataScience-BF/VPARAMETERS(2019-20)C&IT.xls",range = "N155:T168")
nut_coke_2020 <- read_excel("./DataScience-BF/VPARAMETERS(2020-21)C&IT.xls",range = "N144:T158")
nut_coke_2021 <- read_excel("./DataScience-BF/VPARAMETERS(2021-22)C&IT.xls",range = "N146:T160")

Months = c("APR","MAY","JUNE","JULY","AUG","SEP","OCT","NOV","DEC","JAN","FEB","MAR","Yearly")

## Calculate various rates

## Productivity 
Productivity_2019 <-  Hot_metal_prod_2019/Vol_Day_2019
Productivity_2019 <- cbind(Months,Productivity_2019)
Productivity_2020 <- Hot_metal_prod_2020/Vol_Day_2020
Productivity_2020 <- cbind(Months,Productivity_2020[-1,])
Productivity_2021 <- Hot_metal_prod_2021/Vol_Day_2021
Productivity_2021 <- cbind(Months,Productivity_2021[-1,])

## Coke Rate 
Coke_Rate_2019 <- (Coke_kg_2019/Hot_metal_prod_2019)*1000
Coke_Rate_2019 <- cbind(Months,Coke_Rate_2019)
Coke_Rate_2020 <- (Coke_kg_2020/Hot_metal_prod_2020)*1000
Coke_Rate_2020 <- cbind(Months,Coke_Rate_2020[-1,])
Coke_Rate_2021 <- (Coke_kg_2021/Hot_metal_prod_2021)*1000
Coke_Rate_2021 <- cbind(Months,Coke_Rate_2021[-1,])

## CDI Rate 
CDI_Rate_2019 <-  (CDI_kg_2019/Hot_metal_prod_2019)*1000
CDI_Rate_2019 <- cbind(Months,CDI_Rate_2019)
CDI_Rate_2020 <-  (CDI_kg_2020/Hot_metal_prod_2020)*1000
CDI_Rate_2020 <- cbind(Months,CDI_Rate_2020[-1,])
CDI_Rate_2021 <-  (CDI_kg_2021/Hot_metal_prod_2021)*1000
CDI_Rate_2021 <- cbind(Months,CDI_Rate_2021[-1,])

## Nut Coke Rate 
Nut_Coke_Rate_2019 <- (nut_coke_2019/Hot_metal_prod_2019)*1000
Nut_Coke_Rate_2019 <- cbind(Months,Nut_Coke_Rate_2019)
Nut_Coke_Rate_2020 <- (nut_coke_2020/Hot_metal_prod_2020)*1000
Nut_Coke_Rate_2020 <- cbind(Months,Nut_Coke_Rate_2020[-1,])
Nut_Coke_Rate_2021 <-  (nut_coke_2021/Hot_metal_prod_2021)*1000
Nut_Coke_Rate_2021 <- cbind(Months,Nut_Coke_Rate_2021[-1,])

## Fuel Rate 
Fuel_Rate_2019 <-  Coke_Rate_2019[,-1] + CDI_Rate_2019[,-1] + Nut_Coke_Rate_2019[,-1]
Fuel_Rate_2019 <- cbind(Months,Fuel_Rate_2019)
Fuel_Rate_2020 <-  Coke_Rate_2020[,-1] + CDI_Rate_2020[,-1] + Nut_Coke_Rate_2020[,-1]
Fuel_Rate_2020 <- cbind(Months,Fuel_Rate_2020)
Fuel_Rate_2021 <-  Coke_Rate_2021[,-1] + CDI_Rate_2021[,-1] + Nut_Coke_Rate_2021[,-1]
Fuel_Rate_2021 <- cbind(Months,Fuel_Rate_2021)