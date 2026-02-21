USE [PortfolioDB]
GO

/****** Object:  View [dbo].[vw_pbi_pizza_sales_enriched]    Script Date: 2/20/2026 8:13:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   VIEW [dbo].[vw_pbi_pizza_sales_enriched]
AS
SELECT
    ps.orderindex_id,
    ps.order_id,
    ps.order_date,
    ps.order_time,
    ps.order_hour,

    h.HourLabel,

    ps.quantity,
    ps.unit_price,
    ps.total_price,

    ps.pizza_size,

    ps.pizza_id,
    p.pizza_name,
    p.pizza_title_code,

    ps.pizza_CategoryID,
    c.pizza_categorydescription AS pizza_category,

    ps.Store_ID,
    s.Store_Name,
    s.City,
    s.County,
    s.PlazaIND,
    s.MallIND,
    s.StandaloneIND,
    s.DeliveryEligibleIND
FROM dbo.pizza_sales ps
LEFT JOIN dbo.dim_hour h
    ON ps.order_hour = h.Hour24
LEFT JOIN dbo.pizza_setups p
    ON ps.pizza_id = p.PizzaSetupID
LEFT JOIN dbo.pizza_store s
    ON ps.Store_ID = s.Store_ID
LEFT JOIN dbo.pizza_categorysetups c
    ON ps.pizza_CategoryID = c.pizza_CategoryID;
GO


