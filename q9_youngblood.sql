select r.regionDescription,e.firstname,e.lastname,e.birthdate
from employee e,employeeTerritory m,territory t,region r
where e.id=m.employeeid and m.territoryid=t.id and t.regionid=r.id
group by r.regiondescription having e.birthdate=max(e.birthdate) order by r.id;