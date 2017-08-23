--regions
INSERT Regions (Id, [Name])
	VALUES(1, 'A')
INSERT Regions (Id, [Name])
	VALUES(2, 'B')
INSERT Regions (Id, [Name])
	VALUES(3, 'C')
--end regions

--suppliers
SET IDENTITY_INSERT Suppliers ON
INSERT Suppliers (Id, [Name])
	VALUES(1, 'X')
INSERT Suppliers (Id, [Name])
	VALUES(2, 'Y')
INSERT Suppliers (Id, [Name])
	VALUES(3, 'Z')
SET IDENTITY_INSERT Suppliers OFF
--end suppliers

--machineParts
SET IDENTITY_INSERT MachineParts ON
INSERT MachineParts (Id, [Name])
	VALUES(1, 'partA')
INSERT MachineParts (Id, [Name])
	VALUES(2, 'partB')
INSERT MachineParts (Id, [Name])
	VALUES(3, 'partC')
SET IDENTITY_INSERT MachineParts OFF
--end machineParts

--deliveries
SET IDENTITY_INSERT Deliveries ON
INSERT Deliveries (Id, RegionId, SupplierId, CreateDate)
	VALUES(1, 1, 1, CONVERT(DATETIME, '2017-08-21 00:00:00', 121))
INSERT Deliveries (Id, RegionId, SupplierId, CreateDate)
	VALUES(2, 2, 1, CONVERT(DATETIME, '2017-08-21 00:00:00', 121))

INSERT Deliveries (Id, RegionId, SupplierId, CreateDate)
	VALUES(3, 1, 2, CONVERT(DATETIME, '2017-08-21 00:00:00', 121))
INSERT Deliveries (Id, RegionId, SupplierId, CreateDate)
	VALUES(4, 2, 3, CONVERT(DATETIME, '2017-08-21 00:00:00', 121))
SET IDENTITY_INSERT Deliveries OFF
--end deliveries

--deliveryParts
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(1, 1, 25.5, 5)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(1, 2, 5.5, 10)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(1, 3, 68.3, 7)

INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(2, 1, 25.5, 1)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(2, 2, 5.5, 2)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(2, 3, 68.3, 3)

INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(3, 1, 25.5, 1)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(3, 2, 5.5, 2)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(3, 3, 68.3, 3)

INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(4, 1, 25.5, 1)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(4, 2, 5.5, 2)
INSERT DeliveryParts(DeliveryId, MachinePartId, PartPrice, PartsCount)
	VALUES(4, 3, 68.3, 3)
--end ddeliveryParts