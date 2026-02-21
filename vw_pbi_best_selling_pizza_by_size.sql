USE [PortfolioDB]
GO

/****** Object:  View [dbo].[vw_pbi_best_selling_pizza_by_size]    Script Date: 2/20/2026 8:10:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   VIEW [dbo].[vw_pbi_best_selling_pizza_by_size]
AS
SELECT
    ps.pizza_size,
    ps.pizza_id,
    p.pizza_name,
    p.pizza_title_code,
    SUM(ps.quantity) AS PizzasSold
FROM dbo.pizza_sales ps
JOIN dbo.pizza_setups p
    ON ps.pizza_id = p.PizzaSetupID
GROUP BY
    ps.pizza_size,
    ps.pizza_id,
    p.pizza_name,
    p.pizza_title_code;
GO


