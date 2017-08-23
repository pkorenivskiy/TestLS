--get list of suppliers’ names that made at least one delivery to region with name “A”
SELECT s.Id SupplierId, s.Name SupplierName, r.Name RegionName
	from Suppliers s
		join Deliveries d on d.SupplierId = s.Id
		join Regions r on r.Id = d.RegionId
	where r.Name = 'A'
	group by s.Id, s.Name, r.Name