use bank;
Create temporary table region_unemployment
Select A2, A11, dense_rank() over (order by A11 DESC)
from district;

#returns a rank of districts within regions by unemployment rate

Create view region_unemployment_breakdown as
Select A3, A2, A13, dense_rank() over (partition by A3 order by A12 DESC) as reguemploy
from district;

Select *
from region_unemployment;

#just shows the top 3
SELECT * FROM bank.region_unemployment_breakdown u
where reguemploy IN (1,2,3);

#joining 3 tables (well 2 tables and the view you created). 
Select * from client c
Join district d
on c.district_id = d.A1
Join region_unemployment_breakdown v
on v.A2 = d.A2;

#check the values across tables to make sure you have the same count of eg. districts. 
select count(distinct d.A1) from district d;
select count(distinct c.district_id) from client c;

# total loans and average loans per district. 
Select d.A2, sum(l.amount) as da, floor(avg(l.amount)) as avgloan, count(l.loan_id) from loan l
Join account a
on l.account_id = a.account_id
Join district d
on a.district_id = d.A1
GROUP BY d.A1
Order by avgloan desc;