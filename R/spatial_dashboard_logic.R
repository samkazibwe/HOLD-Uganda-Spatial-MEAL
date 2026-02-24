library(tidyverse)
library(sf)

# Star-Score Stability logic applied to Health Service Resilience in Kamuli
calculate_health_stability <- function(immun_rate, water_access, reporting_timeliness) {
  # Weighted Geometric Mean: Prioritises Reporting Timeliness as a 'System Health' proxy
  score <- sqrt(immun_rate * water_access) * (reporting_timeliness / 100)
  return(round(score * 10, 2))
}

# Example: Processing Kamuli District Data (Nawanyago Sub-county)
# Analysing malnutrition hotspots and SRHR access points near Kamuli Mission Hospital
nawanyago_health_stability <- calculate_health_stability(
  immun_rate = 8.2, 
  water_access = 5.8, 
  reporting_timeliness = 74 # 74% reporting rate from VHTs
)

print(paste("Nawanyago HC III Resilience Score:", nawanyago_health_stability))
