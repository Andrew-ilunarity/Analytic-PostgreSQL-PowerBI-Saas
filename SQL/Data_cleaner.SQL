create or replace view Data_clean as(
	with age as (
		select avg(ds.age)::int as clean_age
		from "Data_saas" ds 
		where ds.age > 0 and ds.age <= 100
		)
----
select
ds.customer_id as "Customer ID",
case
	when ds.age <= 0 or ds.age >= 100 then (
		select clean_age 
		from age
		)
	else ds.age
end as "Age",
case 
	when ds.gender is null or ds.gender in ('',' ') then 'unknown'
	else lower(ds.gender)
end as "Gender",
case 
	when ds.region is null then 'unknown'
	else lower(ds.region) 
end as "Region",
case 
	when lower(ds.contract_type) is null then 'unknown'
	when lower(ds.contract_type) like '%one year%'then 'one year'
	when lower(ds.contract_type) like '%month-to-month%' then 'month-to-month'
	when lower(ds.contract_type) like '%two year%' then 'two year'
end as "Contract type",
ds.tenure_months as "Tenure Mouths",
case 
	when ds.internet_service is null then 'unknown'
	when ds.internet_service = '' then 'unknown'
	else lower(ds.internet_service)
end as "Internet service",
case
	when ds.monthly_charges is null then 55.0
	else ds.monthly_charges 
end as "Monthly charges",
ds.data_usage_gb as "Data usage",
ds.avg_call_duration_minutes as "AVG Call duration",
ds.support_calls as "Suport calls",
ds.late_payments as "Late payments",
ds.payment_method as "Paymenth metod",
ds.satisfaction_score as "Satisfation score",
ds.churn as "Churn"
from "Data_saas" ds 
);
