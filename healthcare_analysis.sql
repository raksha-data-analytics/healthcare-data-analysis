-- Healthcare Data Analysis
-- Purpose: KPI calculation, data validation, and reporting
-- Database: MySQL
-- Author: Raksha S

-- =========================
-- BASIC COUNTS
-- =========================
use healthcare;
##  Total Patients
    select count(distinct patient_id) as Total_Patients
    from patient;
    
##  Total Visits
    select count(Visit_Id) as Total_Visits
    from visit;
    
## Total Doctors
   select count(distinct doctor_id) as Total_Doctors
    from doctor;
    
-- =========================
-- VISIT & DIAGNOSIS ANALYSIS
-- =========================
 
##  Top 5 diagnosed conditions
    select diagnosis, count(*) as count
    from visit
    group by diagnosis order by count desc
	limit 5;

## Follow-up rate (%)
   select  concat(round((count(case when follow_up_required = 'yes' then 1 end) * 100.0) / count(*), 2), '%') as Follow_up_rate  
   from visit;
 
-- =========================
-- QUALITY & PERFORMANCE KPIs
-- =========================

## Average Patient Age
   select  round(avg(age), 2) as Average_age  
   from patient;
   
## Doctor Workload
   select  round(count(distinct visit_id) / count(distinct doctor_id), 2) as Avg_patients_per_doctor  
   from visit;

## average treatment cost 
   select  round(avg(treatment_cost), 2) as Avg_treatment_cost  
   from treatments;
   
## Total lab tests 
  SELECT COUNT(LAB_RESULT_ID) AS total_lab_tests
FROM labresult1;
   
## Percentage of Abnormal lab results
 SELECT CONCAT(round ((COUNT(CASE WHEN Test_Result = 'abnormal' THEN 1 END) * 100.0) / COUNT(*), 2), '%') 
 AS abnormal_lab_result_percentage FROM labresult1;

DESCRIBE labresult1;

















