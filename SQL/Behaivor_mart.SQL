create or replace view saas_behavior_mart as
select
    dc."Gender",
    dc."Region",
    dc."Internet service",
    dc."Suport calls",
    dc."Late payments",
    dc."Satisfation score",
    count(*) AS "Total Customers",
    sum(dc."Churn") AS "Churned Count",
    avg(dc."Monthly charges")::numeric(10,2) AS "Avg Monthly Charges",
    avg(dc."Data usage")::numeric(10,2) AS "Avg Data Usage GB",
    avg(dc."AVG Call duration")::numeric(10,2) AS "Avg Call Duration"
from data_clean dc
group by 
    dc."Gender", 
    dc."Region", 
    dc."Internet service",
    dc."Suport calls",
    dc."Late payments",
    dc."Satisfation score";
