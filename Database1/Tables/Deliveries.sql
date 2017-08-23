CREATE TABLE [dbo].[Deliveries]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [RegionId] INT NOT NULL, 
    [SupplierId] INT NOT NULL, 
    [CreateDate] DATETIME NOT NULL, 
    CONSTRAINT [FK_Deliveries_ToRegions] FOREIGN KEY ([RegionId]) REFERENCES [Regions]([Id]), 
    CONSTRAINT [FK_Deliveries_ToSupliers] FOREIGN KEY ([SupplierId]) REFERENCES [Suppliers]([Id])
)
