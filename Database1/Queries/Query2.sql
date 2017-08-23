--get summary value for all parts supplied by supplier “X” during august 2017
-- all parts
select mp.Name, dp.PartPrice, dp.PartsCount
	from DeliveryParts dp
		join Deliveries d on d.Id = dp.DeliveryId
		join Suppliers s on s.Id = d.SupplierId
		join MachineParts mp on mp.Id = dp.MachinePartId
	where s.Name = 'X'
		and d.CreateDate between convert(datetime, '2017-08-01 00:00:00', 121) 
			and convert(datetime, '2017-09-01 00:00:00', 121)
-- summary parts
select mp.Name, sum(dp.PartPrice * dp.PartsCount) TotalPrice, sum(dp.PartsCount) TotalCount
	from DeliveryParts dp
		join Deliveries d on d.Id = dp.DeliveryId
		join Suppliers s on s.Id = d.SupplierId
		join MachineParts mp on mp.Id = dp.MachinePartId
	where s.Name = 'X'
		and d.CreateDate between convert(datetime, '2017-08-01 00:00:00', 121) 
			and convert(datetime, '2017-09-01 00:00:00', 121)
	group by mp.Name