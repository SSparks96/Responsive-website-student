USE [PantryWiseDB]
GO

/****** Object: Table [dbo].[Inventory] Script Date: 4/2/2021 12:15:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Inventory] (
    [InventoryID]    INT           NOT NULL,
    [ItemName]       NVARCHAR (50) NULL,
    [Description]    NVARCHAR (50) NULL,
    [Quanity]        NCHAR (10)    NULL,
    [UserID]         INT           NULL,
    [CategoryID]     INT           NULL,
    [CategoryName]   NVARCHAR (50) NULL,
    [ExpirationDate] DATE          NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Inventory_Column]
    ON [dbo].[Inventory]([UserID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Inventory_Column_1]
    ON [dbo].[Inventory]([CategoryID] ASC);


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED ([InventoryID] ASC);


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_ToTable_1] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Category] ([CategoryID]);


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Inventory_ToTable] FOREIGN KEY ([UserID]) REFERENCES [dbo].[PantryWiseUser] ([UserID]);

