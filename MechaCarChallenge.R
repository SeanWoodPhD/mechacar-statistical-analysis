## Deliverable 1: Linear Regression to Predict MPG ##

# Import dplyr library
library(dplyr)

# Import csv as a DataFrame
mechacar_mpg <- read.csv('data/MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

# Create linear regression model for all variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_mpg)

# Use summary() function to determine p-value and r-squared value for the model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_mpg))




## Deliverable 2: Create Visualizations for the Trip Analysis ##

# Import csv as a DataFrame
suspension_coil <- read.csv('data/Suspension_Coil.csv',check.names = F,stringsAsFactors = F)

# Use summarize() for statistics on PSI column
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

# Use summarize for statistics on PSI column grouped by Manufacturing_Lot.
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')




## Deliverable 3: T-Tests on Suspension Coils ##

# According to the Challenge instructions, assume a population mean of 1,500psi
pop_mean <- 1500

# Perform a t.test() across all manufacturing lots
t.test(suspension_coil$PSI, mu=pop_mean)

# Perform a t.test() for Lot #1
t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot1"), mu=pop_mean)

# Perform a t.test() for Lot #2
t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot2"), mu=pop_mean)

# Perform a t.test() for Lot #3
t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot3"), mu=pop_mean)
