select c.categoryname,count(p.categoryid),round(avg(p.unitprice)*1.0,2),min(p.UnitPrice),max(p.UnitPrice),sum(p.UnitsOnOrder)
from Category c,Product p
where p.CategoryId=c.id
group by p.categoryid having count(p.categoryid)>10
order by c.categoryname;