select p.ProductName,c.CompanyName,c.Contactname from Product p,[Order] o,Orderdetail d, Customer c                       
where p.Discontinued=1 and p.Id = d.Productid and d.Orderid=o.id and c.Id=o.Customerid                                                                                  
group by p.ProductName having o.OrderDate=min(o.OrderDate)
order by p.ProductName;
