with sheet1 as (select ifnull(c.companyname,'MISSING_NAME') as companyname,o.customerid,round(sum(d.unitprice*d.quantity),2) as expenditures from [order] o left join customer c on (o.customerid=c.id),orderdetail d where d.orderid=o.id group by o.customerid order by expenditures),
sheet2 as (select NTILE (4) over (order by expenditures) as groupnum,* from sheet1)
select companyname,customerid,expenditures from sheet2 where groupnum=1;
