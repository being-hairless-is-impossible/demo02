create view sheet1 as select distinct shipcountry ,'NorthAmerica' as place1 from [order] where shipcountry in('USA','Mexico','Canada');
create view sheet2 as  select distinct shipcountry,'OtherPlace' as place2 from [order] where shipcountry not in ('USA','Mexico','Canada') union select * from sheet1;
select o.id,o.shipcountry,t.place2 from [order] o,sheet2 t where o.shipcountry=t.shipcountry and o.id>=15445 order by o.id limit 20;

