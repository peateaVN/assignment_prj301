CREATE DATABASE DELVIN
GO
USE DELVIN
GO
CREATE TABLE [Category] (
    [category_ID] int NOT NULL ,
    [category_name] varchar(50)  NOT NULL ,
	[category_image_link] nvarchar(500)  NOT NULL ,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED (
        [category_ID] ASC
    )
)
GO


INSERT [dbo].[Category] ([category_ID], [category_name], [category_image_link]) VALUES (1, N'T-Shirts', N'https://bizweb.dktcdn.net/thumb/large/100/318/614/products/wuntitled-1-02.jpg')
INSERT [dbo].[Category] ([category_ID], [category_name], [category_image_link]) VALUES (2, N'Hoodie', N'https://bizweb.dktcdn.net/thumb/large/100/318/614/products/wuntitled-2-01-11.jpg')
INSERT [dbo].[Category] ([category_ID], [category_name], [category_image_link]) VALUES (3, N'Jackets', N'https://bizweb.dktcdn.net/thumb/large/100/318/614/products/2-21.jpg')
INSERT [dbo].[Category] ([category_ID], [category_name], [category_image_link]) VALUES (4, N'Sweaters', N'https://bizweb.dktcdn.net/thumb/large/100/318/614/products/wuntitled-1-02.jpg')

GO


CREATE TABLE [Product] (
    [product_ID] int NOT NULL ,
    [category_ID] int  NOT NULL ,
    [title] nvarchar(100)  NOT NULL ,
    [price] float  NOT NULL ,
    [image_link] nvarchar(500)  NOT NULL ,
    [status] varchar(20)  NOT NULL ,
    [description] nvarchar(600)  NOT NULL ,
    [size] varchar(50)  NOT NULL ,
    [color] varchar(50)  NOT NULL ,
    [rating] decimal(2,1)  NOT NULL ,
    [import_date] smalldatetime  NOT NULL ,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED (
        [product_ID] ASC
    )
)
GO

INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (1, 1, N'T-Shirt Elden Ring', 250000, N'https://product.hstatic.net/200000249781/product/erc-bt-s_5d17f611ccb84b699384437f0e20feab_1024x1024.jpg', N'Available', N'Elden Ring is a game developed by FromSoftware and in collaboration with famous writer George R. R. Martin.', N'S / M / L / XL', N'Black / White', CAST(4.8 AS Decimal(2, 1)), CAST(N'2022-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (2, 1, N'T-Shirt Assassin''s Creed Valhalla', 265000, N'https://product.hstatic.net/200000249781/product/ac-bt-b_c100a430c6f44ba9b7d8aa3d6f21fbfc_1024x1024.jpg', N'Available', N'Join Delvin in the 12th game in the Assassin''s Creed series, themed on Viking warriors.', N'S / M / L / XL', N'Black / White', CAST(5.0 AS Decimal(2, 1)), CAST(N'2022-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (3, 1, N'T-Shirt Dark Souls', 255000, N'https://product.hstatic.net/200000249781/product/ds-bt-sf_9ea972d54d6e47b8ae39307c656ad459_1024x1024.jpg', N'Available', N'Souls is a series of action role-playing games developed by From Software. The series began with Demon''s Souls for the PlayStation 3 in 2009, followed by Dark Souls and its sequels, Dark Souls II and Dark Souls III, in the 2010s.', N'S / M / L / XL', N'Black / White / Brown', CAST(4.6 AS Decimal(2, 1)), CAST(N'2021-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (4, 2, N'Hoodie Mega Man Project', 410000, N'https://product.hstatic.net/200000249781/product/mp-hd-b_71e021f97cf14659baa39131e7f1823f_1024x1024.jpg', N'Available', N'Mega Man or more widely known as Rock Man must be the childhood game of many generations of gamers in Vietnam. With a plot that is not too complicated, even somewhat understandable, but Mega Man always attracts players in an unusual way.', N'S / M / L / XL', N'Black / White', CAST(3.0 AS Decimal(2, 1)), CAST(N'2022-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (5, 2, N'Hoodie Castlevania', 415000, N'https://product.hstatic.net/200000249781/product/castlevania-hd-b-t_ea4e78eb954b48f282f1bd8bb72f6226_1024x1024.jpg', N'Available', N'Castlevania is an action-adventure horror game that is famous for being the defining game for the non-linear game style that has made a name for popular names today', N'S / M / L / XL', N'Black / White', CAST(4.5 AS Decimal(2, 1)), CAST(N'2022-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (6, 2, N'Hoodie Ori', 400000, N'https://product.hstatic.net/200000249781/product/o-hd-b_004b8945a25e42e996545f30e4545f5a_1024x1024.jpg', N'Out Of Stock', N'Ori is the main character of 2 games "Ori and the Will of the Wisps" and "Ori and the Blind Forest". Both games have been a hit with both audiences and critics alike thanks to their excellent gameplay, storyline, graphics, and sound.', N'S / M / L / XL', N'Black / White', CAST(3.4 AS Decimal(2, 1)), CAST(N'2020-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (7, 3, N'Jacket The Legend of Zelda', 280000, N'https://product.hstatic.net/200000249781/product/zelda-den-daitay1_7abba41cf1674350a9a72bfb18cac159_1024x1024.jpg', N'Available', N'As the trump card of the Nintendo home console, The Legend of Zelda: Breath of the Wild is the best game in the past 10 years when it is always in the top of the open world adventure games.', N'S / M / L / XL / XXL', N'Black / White', CAST(4.9 AS Decimal(2, 1)), CAST(N'2021-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (8, 3, N'Jacket Cyberpunk 2077 - Original', 300000, N'https://product.hstatic.net/200000249781/product/cyberpunk-vang-sweater-1_d1567169fadc42db8c93a46a37ed03d0_1024x1024.jpg', N'Out Of Stock', N'Cyberpunk 2077 - the most anticipated hit game of 2020, Cyberpunk 2077 is set in Night City in a dystopian future world with modern technology and a degenerate human society.', N'S / M / L / XL / XXL', N'Black / White / Blue', CAST(4.1 AS Decimal(2, 1)), CAST(N'2020-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (9, 3, N'Jacket Blinky - Pacman', 280000, N'https://product.hstatic.net/200000249781/product/bpm-dt-b_5ac462ec8eb444e79bc95d369ab7a51f_1024x1024.jpg', N'Available', N'Join Delvin in the 12th game in the Assassin''s Creed series, themed on Viking warriors.', N'S / M / L / XL / XXL', N'Black / White', CAST(5.0 AS Decimal(2, 1)), CAST(N'2020-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (10, 4, N'Sweater Katana Zero', 360000, N'https://product.hstatic.net/200000249781/product/k0-sw-b_626a7b4a863a4d048e7f26bea9efbaa2_1024x1024.jpg', N'Available', N'Katana ZERO is a stylish neo-noir, action-platformer featuring breakneck action and instant-death combat. Slash, dash, and manipulate time to unravel your past in a beautifully brutal acrobatic display.', N'S / M / L / XL / XXL', N'Black / Red / Blue', CAST(4.3 AS Decimal(2, 1)), CAST(N'2021-07-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (11, 4, N'Sweater Cuphead', 400000, N'https://product.hstatic.net/200000249781/product/ch-sw-b_8cd0a9d0339d4df2a6b531cac4e5d3b0_1024x1024.jpg', N'Out Of Stock', N'Cuphead is a game released in 2017 about Cuphead''s journey with his brother Mugman to overcome many challenges to settle the feud with the game''s final boss, The Devil. The game was a huge success as it was appreciated by both critics and audiences for its difficulty as well as its distinctive art style.', N'S / M / L / XL / XXL', N'Black / White', CAST(5.0 AS Decimal(2, 1)), CAST(N'2020-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([product_ID], [category_ID], [title], [price], [image_link], [status], [description], [size], [color], [rating], [import_date]) VALUES (12, 4, N'Sweater 6th Street - Cyberpunk', 360000, N'https://product.hstatic.net/200000249781/product/6-sw-b_10a63cb553654550a3aae0b7b88baa8b_1024x1024.jpg', N'Out Of Stock', N'6th Street is a famous Gangs in the world of Cyberpunk 2077. The 6th Street gang was founded by patriotic Americans and acts as a special police force. But then they gradually lost their "identity", abusing their power to coerce small businesses in the vicinity to pay "protection".', N'S / M / L / XL / XXL', N'Black / White / Red', CAST(3.9 AS Decimal(2, 1)), CAST(N'2020-01-01T00:00:00' AS SmallDateTime))

GO


CREATE TABLE [Order] (
    [order_ID] int identity(1,1) NOT NULL ,
    [shipping_method] varchar(20)  NOT NULL ,
    [total_price] float  NOT NULL ,
    [date_ordered] smalldatetime  NOT NULL ,
    [payment_method] nvarchar(50)  NOT NULL ,
	[status] varchar(30) NOT NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED (
        [order_ID] ASC
    )
)
GO

CREATE TABLE [Account] (
    [account_ID] int identity(1,1) ,
    [account_username] nvarchar(100)  NOT NULL ,
    [account_password] nvarchar(100)  NOT NULL ,
    [isAdmin] bit  NOT NULL ,
    [account_name] nvarchar(100)  NOT NULL ,
    [account_age] tinyint  NOT NULL ,
    [account_phone] varchar(10)  NOT NULL ,
    [account_email] nvarchar(100)  NOT NULL ,
    [account_address] nvarchar(255)  NOT NULL ,
    [order_ID] int NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED (
        [account_ID] ASC
    )
)
GO

SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_ID], [account_username], [account_password], [isAdmin], [account_name], [account_age], [account_phone], [account_email], [account_address], [order_ID]) VALUES (1, N'admin', N'1234', 1, N'Admin', 18, N'0987654321', N'admin@gmail.com', N'admin''s address', NULL)
INSERT [dbo].[Account] ([account_ID], [account_username], [account_password], [isAdmin], [account_name], [account_age], [account_phone], [account_email], [account_address], [order_ID]) VALUES (2, N'customer1', N'1111', 0, N'Customer 1', 18, N'0987654311', N'c1@gmail.com', N'customer 1 address', NULL)
INSERT [dbo].[Account] ([account_ID], [account_username], [account_password], [isAdmin], [account_name], [account_age], [account_phone], [account_email], [account_address], [order_ID]) VALUES (3, N'customer2', N'2222', 0, N'Customer 2', 18, N'0987654322', N'c2@gmail.com', N'customer 1 address', NULL)
INSERT [dbo].[Account] ([account_ID], [account_username], [account_password], [isAdmin], [account_name], [account_age], [account_phone], [account_email], [account_address], [order_ID]) VALUES (4, N'customer3', N'3333', 0, N'Customer 3', 18, N'0987654333', N'c3@gmail.com', N'customer 3 address', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO

CREATE TABLE [Cart] (
    [cart_ID] int identity(1,1) NOT NULL ,
    [product_ID] int  NOT NULL ,
    [order_ID] int  NOT NULL ,
    [quanity] tinyint  NOT NULL ,
    CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED (
        [cart_ID] ASC
    )
)
GO

ALTER TABLE [Product] WITH CHECK ADD CONSTRAINT [FK_Product_category_ID] FOREIGN KEY([category_ID])
REFERENCES [Category] ([category_ID])

ALTER TABLE [Product] CHECK CONSTRAINT [FK_Product_category_ID]

ALTER TABLE [Account] WITH CHECK ADD CONSTRAINT [FK_Account_order_ID] FOREIGN KEY([order_ID])
REFERENCES [Order] ([order_ID])

ALTER TABLE [Account] CHECK CONSTRAINT [FK_Account_order_ID]

ALTER TABLE [Cart] WITH CHECK ADD CONSTRAINT [FK_Cart_product_ID] FOREIGN KEY([product_ID])
REFERENCES [Product] ([product_ID])

ALTER TABLE [Cart] CHECK CONSTRAINT [FK_Cart_product_ID]

ALTER TABLE [Cart] WITH CHECK ADD CONSTRAINT [FK_Cart_order_ID] FOREIGN KEY([order_ID])
REFERENCES [Order] ([order_ID])

ALTER TABLE [Cart] CHECK CONSTRAINT [FK_Cart_order_ID]
