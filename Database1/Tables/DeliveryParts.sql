CREATE TABLE [dbo].[DeliveryParts]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DeliveryId] INT NOT NULL, 
    [MachinePartId] INT NOT NULL, 
    [PartPrice] DECIMAL(8, 3) NOT NULL, 
    [PartsCount] INT NOT NULL, 
    CONSTRAINT [FK_DeliveryParts_ToDeliveries] FOREIGN KEY ([DeliveryId]) REFERENCES [dbo].[Deliveries]([Id]), 
    CONSTRAINT [FK_DeliveryParts_ToMachineParts] FOREIGN KEY ([MachinePartId]) REFERENCES [MachineParts]([Id]) 
)
