-- Query to audit reporting consistency across District A, B, and C
-- Based on DHIS2/VHT Quarterly Reporting Patterns
SELECT 
    district, 
    quarter,
    (actual_reports_on_time::float / expected_reports) * 100 as timeliness_rate,
    ST_AsText(geom_location) as spatial_coordinates
FROM health_facility_metrics
WHERE actual_reports_on_time < (expected_reports * 0.5)
ORDER BY timeliness_rate ASC;
