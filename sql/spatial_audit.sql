-- Query to audit reporting consistency across Kamuli, Buyende, and Lira City
-- Based on DHIS2/VHT Quarterly Reporting Patterns

SELECT 
    district, 
    health_facility_name,
    (actual_reports_on_time::float / expected_reports) * 100 as timeliness_rate,
    ST_AsText(geom_location) as spatial_coordinates
FROM health_facility_metrics
WHERE district = 'Kamuli'
  AND health_facility_name IN ('Kamuli General Hospital', 'Nawanyago HC III', 'Mbulamuti HC III', 'Balawoli HC III')
  AND actual_reports_on_time < (expected_reports * 0.8)
ORDER BY timeliness_rate ASC;
