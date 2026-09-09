-- Example Schema for BigQuery
-- This schema represents an Enterprise Customer entity.

CREATE OR REPLACE TABLE `your-gcp-project-id.enterprise_analytics_dev.customers`
(
    customer_id STRING OPTIONS(description="Unique identifier for the customer"),
    first_name STRING,
    last_name STRING,
    email STRING,
    phone_number STRING,
    registration_date DATE,
    country STRING,
    segment STRING OPTIONS(description="Customer business segment: e.g. Enterprise, Mid-Market"),
    annual_spend NUMERIC,
    is_active BOOLEAN
);

-- Example View for Looker Studio
CREATE OR REPLACE VIEW `your-gcp-project-id.enterprise_analytics_dev.customer_summary_view` AS
SELECT
    country,
    segment,
    COUNT(customer_id) as total_customers,
    SUM(annual_spend) as total_annual_spend,
    ROUND(AVG(annual_spend), 2) as average_spend
FROM
    `your-gcp-project-id.enterprise_analytics_dev.customers`
WHERE
    is_active = TRUE
GROUP BY
    country,
    segment;
