create database dialysis ;
use dialysis;
use hospital;
select * from `final data - csv file`;
RENAME TABLE `final data - csv file` TO Final_data;

##############################################Number of Patients across various summaries#################################################################################

select * from Final_data;
select sum(transfusionsummary) as Transfusion_Summary,
sum(hypercalcemiasummary) as Hypercalcemia_summary,
sum(Serumphosphorussummary) as Serumphosphorus_summary,
sum(hospitalizationsummary) as Hospitalization_summary,
sum(hospitalreadmissionsummary) as Readmission_summary,
sum(survivalsummary) as Survival_summary,
sum(fistulasummary) as Fistula_summary,
sum(cathetersummary) as catheter_summary from data;


######################################################Profit Vs Non-Profit Stats####################################################################################

SELECT
    `Profit Non-Profit`,
    COUNT(*) AS Facilities
FROM
    `data`
GROUP BY
    `Profit Non-Profit`;

    
 ##################################################Chain Organizations w.r.t. Total Performance Score as No Score##############################################################
SELECT
    `Chain Organization`,
    COUNT(*) AS No_Score_Count
FROM
    `Final_data`
WHERE
    `Total Performance Score` = 'No Score'
GROUP BY
    `Chain Organization`;
  
    
##################################################################Dialysis Stations Stats####################################################################################

  
    SELECT count(DialysisStations) as dialysis_station_stats, State
FROM data
GROUP BY State
order by count(DialysisStations) desc;


select * from Final_data;

############################################################# # of Category Text  - As Expected #######################################################################


select Count(patientTransfusioncategorytext) as '# of category text'
 from data where patientTransfusioncategorytext = 'As expected'
 union all
 select Count(patienthospitalizationcategorytext) 
 from data where patienthospitalizationcategorytext = 'As expected' 
 union all
 select Count(PatientHospitalReadmissionCategory) 
 from data where PatientHospitalReadmissionCategory = 'As expected' 
 union all
 select Count(PatientInfectioncategorytext) 
 from data where PatientInfectioncategorytext = 'As expected' 
 union all
 select Count(FistulaCategoryText) 
 from data where FistulaCategoryText = 'As expected'
 union all
  select Count(SWRCategoryText) 
 from data where SWRCategoryText = 'As expected'
 union all
  select Count(PPPWCategoryText) 
 from data where PPPWCategoryText = 'As expected';




#############################################################Average Payment Reduction Rate###############################################################################################
SELECT
    AVG(`PY2020 Payment Reduction Percentage`) AS Avg_Payment_Reduction_Rate
FROM
    `Final_data`;


SELECT
    AVG(CAST(`Patient Transfusion category text` AS DECIMAL(10, 2))) AS Avg_Patient_Transfusion_Rate,
    AVG(CAST(`No.of patients in hypercalcemia summary` AS DECIMAL(10, 2))) AS Avg_Hypercalcemia_Rate,
    AVG(CAST(`No.of patients in Serum phosphorus summary` AS DECIMAL(10, 2))) AS Avg_Serum_Phosphorus_Rate,
    AVG(CAST(`No.of hospitalizations included in hospital readmission summary` AS DECIMAL(10, 2))) AS Avg_Hospitalization_Readmission_Rate,
    AVG(CAST(`Total Performance Score` AS DECIMAL(10, 2))) AS Avg_Total_Performance_Score,
    AVG(CAST(`PY2020 Payment Reduction Percentage` AS DECIMAL(10, 2))) AS Avg_Payment_Reduction_Rate
FROM
    `Final_data`;

############################################################################################################################################################################






