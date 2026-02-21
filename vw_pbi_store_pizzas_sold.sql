USE [PortfolioDB]
GO

/****** Object:  View [dbo].[vw_pbi_store_pizzas_sold]    Script Date: 2/20/2026 8:13:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   VIEW [dbo].[vw_pbi_store_pizzas_sold]
AS
SELECT
    ps.Store_ID,
    s.Store_Name,
    s.City,
    s.County,
    SUM(ps.quantity) AS PizzasSold,
    COUNT(DISTINCT ps.order_id) AS OrdersCount
FROM dbo.pizza_sales ps
JOIN dbo.pizza_store s
    ON ps.Store_ID = s.Store_ID
GROUP BY
    ps.Store_ID,
    s.Store_Name,
    s.City,
    s.County;
GO


