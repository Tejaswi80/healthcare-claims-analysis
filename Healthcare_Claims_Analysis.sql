-- ============================================================
-- HEALTHCARE CLAIMS ANALYSIS
-- Tools: MySQL
-- Dataset: 25 synthetic healthcare claims
-- ============================================================


-- ============================================================
-- 1. OVERALL CLAIMS SUMMARY
-- ============================================================

SELECT
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed,
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS total_paid
FROM healthcare_data;


-- ============================================================
-- 2. TOTAL PAYMENT DIFFERENCE
-- ============================================================

SELECT
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)))
    -
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS payment_difference
FROM healthcare_data;


-- ============================================================
-- 3. OVERALL PAYMENT RATE
-- ============================================================

SELECT
    ROUND(
        SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2)))
        /
        SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)))
        * 100,
        2
    ) AS payment_rate
FROM healthcare_data;


-- ============================================================
-- 4. CLAIMS ANALYSIS BY SPECIALTY
-- ============================================================

-- List specialties

SELECT specialty
FROM healthcare_data
GROUP BY specialty;


-- Claim count by specialty

SELECT
    specialty,
    COUNT(*) AS claim_count
FROM healthcare_data
GROUP BY specialty;


-- Allowed amount by specialty

SELECT
    specialty,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed
FROM healthcare_data
GROUP BY specialty;


-- Allowed and paid amounts by specialty

SELECT
    specialty,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed,
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS total_paid
FROM healthcare_data
GROUP BY specialty;


-- Complete specialty analysis with payment rate

SELECT
    specialty,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed,
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS total_paid,
    ROUND(
        SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2)))
        /
        SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)))
        * 100,
        2
    ) AS payment_rate
FROM healthcare_data
GROUP BY specialty;


-- ============================================================
-- 5. CLAIMS ANALYSIS BY STATE
-- ============================================================

-- Claim count by state

SELECT
    state,
    COUNT(*) AS claim_count
FROM healthcare_data
GROUP BY state;


-- Allowed amount by state

SELECT
    state,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed
FROM healthcare_data
GROUP BY state;


-- Allowed and paid amounts by state

SELECT
    state,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed,
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS total_paid
FROM healthcare_data
GROUP BY state;


-- Complete state analysis with payment rate

SELECT
    state,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed,
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS total_paid,
    ROUND(
        SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2)))
        /
        SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)))
        * 100,
        2
    ) AS payment_rate
FROM healthcare_data
GROUP BY state;


-- ============================================================
-- 6. CLAIMS ANALYSIS BY HCPCS CODE
-- ============================================================

-- List HCPCS codes

SELECT hcpcs_code
FROM healthcare_data
GROUP BY hcpcs_code;


-- Claim count by HCPCS code

SELECT
    hcpcs_code,
    COUNT(*) AS claim_count
FROM healthcare_data
GROUP BY hcpcs_code;


-- Allowed amount by HCPCS code

SELECT
    hcpcs_code,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed
FROM healthcare_data
GROUP BY hcpcs_code;


-- Allowed and paid amounts by HCPCS code

SELECT
    hcpcs_code,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed,
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS total_paid
FROM healthcare_data
GROUP BY hcpcs_code;


-- Complete HCPCS analysis with payment rate

SELECT
    hcpcs_code,
    COUNT(*) AS claim_count,
    SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))) AS total_allowed,
    SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))) AS total_paid,
    ROUND(
        SUM(CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2)))
        /
        SUM(CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)))
        * 100,
        2
    ) AS payment_rate
FROM healthcare_data
GROUP BY hcpcs_code;


-- ============================================================
-- 7. MONTHLY CLAIMS ANALYSIS
-- ============================================================

-- Convert text date into a MySQL date

SELECT
    date_of_service,
    STR_TO_DATE(date_of_service, '%Y-%m-%d') AS service_date
FROM healthcare_data;


-- Claim count by month

SELECT
    DATE_FORMAT(
        STR_TO_DATE(date_of_service, '%Y-%m-%d'),
        '%Y-%m'
    ) AS service_month,
    COUNT(*) AS claim_count
FROM healthcare_data
GROUP BY service_month
ORDER BY service_month;


-- Monthly claims with total allowed amount

SELECT
    DATE_FORMAT(
        STR_TO_DATE(date_of_service, '%Y-%m-%d'),
        '%Y-%m'
    ) AS service_month,
    COUNT(*) AS claim_count,
    SUM(
        CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))
    ) AS total_allowed
FROM healthcare_data
GROUP BY service_month
ORDER BY service_month;


-- Monthly claims with allowed and paid amounts

SELECT
    DATE_FORMAT(
        STR_TO_DATE(date_of_service, '%Y-%m-%d'),
        '%Y-%m'
    ) AS service_month,
    COUNT(*) AS claim_count,
    SUM(
        CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))
    ) AS total_allowed,
    SUM(
        CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))
    ) AS total_paid
FROM healthcare_data
GROUP BY service_month
ORDER BY service_month;


-- Complete monthly analysis with payment rate

SELECT
    DATE_FORMAT(
        STR_TO_DATE(date_of_service, '%Y-%m-%d'),
        '%Y-%m'
    ) AS service_month,
    COUNT(*) AS claim_count,
    SUM(
        CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))
    ) AS total_allowed,
    SUM(
        CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))
    ) AS total_paid,
    ROUND(
        SUM(
            CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))
        )
        /
        SUM(
            CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))
        )
        * 100,
        2
    ) AS payment_rate
FROM healthcare_data
GROUP BY service_month
ORDER BY service_month;


-- ============================================================
-- 8. TOP 5 HIGHEST ALLOWED CLAIMS
-- ============================================================

SELECT
    bene_id,
    specialty,
    hcpcs_code,
    allowed_amount,
    paid_amount
FROM healthcare_data
ORDER BY
    CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)) DESC
LIMIT 5;


-- ============================================================
-- 9. CLAIMS FILTERING
-- ============================================================

-- Family Practice claims

SELECT
    bene_id,
    specialty,
    hcpcs_code,
    allowed_amount,
    paid_amount
FROM healthcare_data
WHERE specialty = 'FAMILY_PRACTICE';


-- Claims with allowed amount greater than $100

SELECT
    bene_id,
    specialty,
    hcpcs_code,
    allowed_amount,
    paid_amount
FROM healthcare_data
WHERE CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)) > 100;


-- Claims with allowed amount greater than $100
-- AND paid amount less than $100

SELECT
    bene_id,
    specialty,
    hcpcs_code,
    allowed_amount,
    paid_amount
FROM healthcare_data
WHERE CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)) > 100
  AND CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2)) < 100;


-- Claims with allowed amount between $80 and $120

SELECT
    bene_id,
    specialty,
    hcpcs_code,
    allowed_amount,
    paid_amount
FROM healthcare_data
WHERE CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))
      BETWEEN 80 AND 120;


-- Family Practice OR Internal Medicine claims

SELECT
    bene_id,
    specialty,
    hcpcs_code,
    allowed_amount,
    paid_amount
FROM healthcare_data
WHERE specialty = 'FAMILY_PRACTICE'
   OR specialty = 'INTERNAL_MEDICINE';


-- ============================================================
-- 10. CLAIM CATEGORIZATION USING CASE
-- ============================================================

SELECT
    bene_id,
    specialty,
    allowed_amount,
    CASE
        WHEN CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2)) >= 100
            THEN 'High'
        ELSE 'Low'
    END AS claim_category
FROM healthcare_data;


-- ============================================================
-- 11. PAYMENT DIFFERENCE BY SPECIALTY
-- ============================================================

SELECT
    specialty,
    SUM(
        CAST(REPLACE(allowed_amount, '$', '') AS DECIMAL(10,2))
    )
    -
    SUM(
        CAST(REPLACE(paid_amount, '$', '') AS DECIMAL(10,2))
    ) AS payment_difference
FROM healthcare_data
GROUP BY specialty
ORDER BY payment_difference DESC;


-- ============================================================
-- END OF HEALTHCARE CLAIMS ANALYSIS
-- ============================================================