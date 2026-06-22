create or replace view saas_dashboard_mart as
select
    dc."Tenure Mouths",
    dc."Paymenth metod",
    dc."Gender",
    dc."Region",
    count(*) as "Total Customers",
    sum(case when dc."Churn" = 0 then dc."Monthly charges" else 0 end)::numeric(10,2) as "MRR",
    sum(case when dc."Churn" = 1 then dc."Monthly charges" else 0 end)::numeric(10,2) as "Churned Revenue",
    SUM(case when dc."Churn" = 0 then 1 else 0 end) as "Active Count",
    SUM(case when dc."Churn" = 1 then 1 else 0 end) as "Churn Count"
from data_clean dc
group by
    dc."Tenure Mouths", 
    dc."Paymenth metod", 
    dc."Gender", 
    dc."Region";
