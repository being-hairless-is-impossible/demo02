select distinct O1.shipname,substr(O2.shipname,1,instr(O2.shipname,'-')-1) as 'left-name'
from [Order] O1,[Order] O2
where O1.shipname = O2.shipname and O1.shipname like '%-%' order by O1.shipname;