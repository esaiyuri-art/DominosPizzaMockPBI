USE [PortfolioDB]
GO

/****** Object:  View [dbo].[vw_pbi_busiest_hour]    Script Date: 2/20/2026 8:12:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   VIEW [dbo].[vw_pbi_busiest_hour]
AS
SELECT
    h.Hour24,
    h.HourLabel,
    COUNT(DISTINCT ps.order_id) AS OrdersCount
FROM dbo.pizza_sales ps
JOIN dbo.dim_hour h
    ON ps.order_hour = h.Hour24
GROUP BY
    h.Hour24,
    h.HourLabel;
GO


