use bank;
SELECT COUNT(c.card_id)
from card c;

SELECT *, COUNT(client_ID)
from client c
GROUP BY c.district_id
ORDER BY c.district_id;

SELECT *, round(avg(amount),2)
FROM trans
GROUP BY type;

select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
Where k_symbol <> ''
group by type, operation, k_symbol
order by type, operation, k_symbol;

SELECT *, sum(l.amount-l.payments) as totalbalance
FROM loan l
GROUP BY l.duration
HAVING sum(l.amount-l.payments) > 1000000;

SELECT *, if(A10>80, 'URBAN', 'COUNTRY') as locale
From district;

SELECT *, if(sum(l.payments/l.amount) > 0.5, 'Looking Good', 'Not much paid back') as how_going_so_far
from loan l;