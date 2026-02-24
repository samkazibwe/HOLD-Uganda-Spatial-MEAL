library(tidyverse)
library(sf)
library(viridis)

# 1. Load Kamuli Sub-county Shapefile
# Data Source: UBOS / Ministry of Health (MOH) Administrative Boundaries
kamuli_bounds <- st_read("data/shapefiles/kamuli_subcounties.shp")

# 2. Mock Data: Malaria RDT Confirmed Cases (Monthly Aggregate)
# Real-world targets: Nawanyago, Kitayunjwa, Bugaya, Mbulamuti, etc.
malaria_data <- tibble(
  subcounty = c("Nawanyago", "Kitayunjwa", "Bugaya", "Mbulamuti", "Balawoli", 
                "Butansi", "Namasagali", "Kisozi", "Kamuli Municipality"),
  rdt_cases = c(145, 230, 189, 98, 312, 120, 255, 167, 85)
)

# 3. Join Spatial Data with Health Metrics
kamuli_map_data <- kamuli_bounds %>%
  left_join(malaria_data, by = c("SUBCOUNTY" = "subcounty"))

# 4. Generate the Spatial Visualization
# Using 'viridis' color scale for high-contrast accessibility
ggplot(data = kamuli_map_data) +
  geom_sf(aes(fill = rdt_cases), color = "white", size = 0.2) +
  scale_fill_viridis_c(option = "magma", name = "RDT Confirmed Cases") +
  labs(
    title = "Malaria Prevalence Mapping: Kamuli District",
    subtitle = "Analysis of RDT Confirmed Cases by Sub-county (NIYETU Framework)",
    caption = "Source: HOLD Uganda MEAL Unit / DHIS2 Data"
  ) +
  theme_minimal() +
  theme(axis.text = element_blank(), grid = element_blank())

# 5. Export for Stakeholder Reporting (WFP/USAID/AMCOW)
ggsave("outputs/maps/kamuli_malaria_hotspots.png", width = 8, height = 6)
