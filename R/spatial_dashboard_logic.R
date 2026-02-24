library(tidyverse)
library(sf)

# Star-Score Stability logic applied to Health Service Resilience
calculate_health_stability <- function(immun_rate, water_access, reporting_timeliness) {
  # Weighted Geometric Mean
  # Prioritizes Reporting Timeliness as a proxy for 'System Health'
  score <- sqrt(immun_rate * water_access) * (reporting_timeliness / 100)
  return(round(score * 10, 2))
}

# Example: Processing District B (Rural Refugee Settlement Data)
# Ref: Palabeek Refugee Settlement Malnutrition Hotspot Analysis
dist_b_health <- calculate_health_stability(
  immun_rate = 8.5, 
  water_access = 6.2, 
  reporting_timeliness = 66 # Only 66% on time
)

print(paste("District B Health Resilience Score:", dist_b_health))
