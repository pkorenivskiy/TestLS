--get number of deliveries with total cost more than 300 USD 
--(total cost is sum of price times number of parts by all lines for this delivery), 
--grouped by supplier (result table should have columns “Supplier name” and “Delivery number”)

select s.Name SupplierName, sum(dp.PartsCount) DeliveryCount
	from DeliveryParts dp
		join Deliveries d on d.Id = dp.DeliveryId
		join Suppliers s on s.Id = d.SupplierId
	group by s.Name
	having sum(dp.PartPrice * dp.PartsCount) > 300	