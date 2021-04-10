use bank;
#Find out the average number of transactions by account. Get those accounts that have more transactions than the average.
select account_id, count(trans_id) as numtrans
 from trans 
 group by account_id
 having numtrans > ( 
 select floor(avg(numtrans)) from
 (select account_id, count(trans_id) as numtrans
 from trans 
 group by account_id) q1
 
 )
 
 #Note. to save coplexity you might jsut work out the average (192) and hard code it into a simple look up against county of transations




