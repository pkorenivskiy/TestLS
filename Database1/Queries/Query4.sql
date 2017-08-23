--get all supplier names who had not made any deliveries to regions where supplier “X” has any delivery

/*select *
	from Deliveries d
		join Suppliers s on s.Id = d.SupplierId
		join Regions r on r.Id = d.RegionId

select *
	from Suppliers s
		join Deliveries d on d.SupplierId = s.Id
		join Regions r on r.Id = d.RegionId
	where s.Name = 'X'
*/


select s.Name
	from Suppliers s
		outer apply (
			select s1.Id
				from Suppliers s1
					join Deliveries d on d.SupplierId = s1.Id
					join Regions r on r.Id = d.RegionId
				where s.Name = 'X'
				) ca
	where ca.Id is null