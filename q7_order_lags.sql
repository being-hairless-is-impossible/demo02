with t (id,orderdate,previousDate) as (select id,orderdate,lag(orderdate,1,min(orderdate)) over (order by orderdate) as previousDate from [order] where customerid='BLONP' group by orderDate limit 10)
select *,round( 1.0*(julianday(OrderDate)-julianday(previousDate)),2)as differentTime from t;