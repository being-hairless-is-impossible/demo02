select ifnull(CompanyName,'MISSING_NAME') as newCompanyName,CustomerId, 
round(sum(UnitPrice*Quantity),2) as TotalExpenditures,
NTILE ( 4 ) OVER ( 
		ORDER BY round(sum(UnitPrice*Quantity),2)
        ) BottomQuartile
from (  select * 
        FROM [Order],OrderDetail 
        WHERE [Order].Id = OrderDetail.OrderId) a 
    LEFT OUTER JOIN Customer
    on Customer.Id = a.CustomerId
group by CompanyName)