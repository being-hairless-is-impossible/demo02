with tempsum as (select s.id,count(o.id) as tsum from shipper s,[order] o where s.id = o.shipvia group by s.id)
select s.companyName, round(count(o.id)*1.0/t.tsum*100,2) as percentage
from shipper s,[order] o,tempsum t
where o.shipvia = t.id and s.id = o.shipvia and o.requiredDate<o.shippedDate  
group by s.companyName
order by percentage;