CREATE DATABASE marketing_funnel_analysis;

USE marketing_funnel_analysis;

DROP TABLE IF EXISTS funnel_data;

CREATE TABLE funnel_data (
    User_ID VARCHAR(10),
    Date DATE,
    Segment VARCHAR(20),
    Visitor INT,
    Product_View INT,
    Add_to_Cart INT,
    Checkout INT,
    Purchase INT
);

INSERT INTO funnel_data
(User_ID, Date, Segment, Visitor, Product_View, Add_to_Cart, Checkout, Purchase)
VALUES
('U0001','2026-08-01','New',1,1,0,0,0),
('U0002','2026-08-01','Returning',1,1,1,0,0),
('U0003','2026-08-01','New',1,1,1,1,1),
('U0004','2026-08-01','New',1,0,0,0,0),
('U0005','2026-08-01','Returning',1,1,1,1,0),
('U0006','2026-08-02','New',1,1,0,0,0),
('U0007','2026-08-02','Returning',1,1,1,1,1),
('U0008','2026-08-02','New',1,0,0,0,0),
('U0009','2026-08-02','New',1,1,1,0,0),
('U0010','2026-08-02','Returning',1,1,1,1,1);

SELECT COUNT(*) AS Total_Users
FROM funnel_data;

SELECT
    SUM(Visitor) AS Visitors,
    SUM(Product_View) AS Product_Views,
    SUM(Add_to_Cart) AS Add_to_Carts,
    SUM(Checkout) AS Checkouts,
    SUM(Purchase) AS Purchases
FROM funnel_data;

SELECT
    ROUND(SUM(Product_View) / SUM(Visitor) * 100, 2)
        AS Visitor_to_ProductView,

    ROUND(SUM(Add_to_Cart) / SUM(Product_View) * 100, 2)
        AS ProductView_to_AddToCart,

    ROUND(SUM(Checkout) / SUM(Add_to_Cart) * 100, 2)
        AS AddToCart_to_Checkout,

    ROUND(SUM(Purchase) / SUM(Checkout) * 100, 2)
        AS Checkout_to_Purchase
FROM funnel_data;

SELECT
    ROUND(
        (1 - SUM(Product_View) / SUM(Visitor)) * 100, 2
    ) AS Visitor_Dropoff,

    ROUND(
        (1 - SUM(Add_to_Cart) / SUM(Product_View)) * 100, 2
    ) AS ProductView_Dropoff,

    ROUND(
        (1 - SUM(Checkout) / SUM(Add_to_Cart)) * 100, 2
    ) AS AddToCart_Dropoff,

    ROUND(
        (1 - SUM(Purchase) / SUM(Checkout)) * 100, 2
    ) AS Checkout_Dropoff
FROM funnel_data;

SELECT
    Segment,
    COUNT(*) AS Visitors,
    SUM(Product_View) AS Product_Views,
    SUM(Add_to_Cart) AS Add_to_Carts,
    SUM(Checkout) AS Checkouts,
    SUM(Purchase) AS Purchases
FROM funnel_data
GROUP BY Segment;

SELECT
    Segment,
    COUNT(*) AS Visitors,

    SUM(Purchase) AS Purchases,

    ROUND(
        SUM(Purchase) / SUM(Visitor) * 100, 2
    ) AS Overall_Conversion_Rate

FROM funnel_data
GROUP BY Segment;

SELECT
    'Visitor to Product View' AS Funnel_Stage,
    ROUND(
        (1 - SUM(Product_View) / SUM(Visitor)) * 100, 2
    ) AS Dropoff_Rate

FROM funnel_data

UNION ALL

SELECT
    'Product View to Add to Cart',
    ROUND(
        (1 - SUM(Add_to_Cart) / SUM(Product_View)) * 100, 2
    )

FROM funnel_data

UNION ALL

SELECT
    'Add to Cart to Checkout',
    ROUND(
        (1 - SUM(Checkout) / SUM(Add_to_Cart)) * 100, 2
    )

FROM funnel_data

UNION ALL

SELECT
    'Checkout to Purchase',
    ROUND(
        (1 - SUM(Purchase) / SUM(Checkout)) * 100, 2
    )

FROM funnel_data;

SELECT *
FROM funnel_data;

USE marketing_funnel_analysis;

SELECT
	SUM(visitor) AS visitors,
    SUM(product_view) AS product_views,
    SUM(add_to_cart) AS add_to_carts,
    SUM(checkout) AS checkouts,
    SUM(purchase) AS purchases
FROM funnel_data;

USE marketing_funnel_analysis;

INSERT INTO funnel_data
(User_ID, Date, Segment, Visitor, Product_View, Add_to_Cart, Checkout, Purchase)
VALUES
('U0001','2026-08-01','New',1,1,0,0,0),
('U0002','2026-08-01','Returning',1,1,1,0,0),
('U0003','2026-08-01','New',1,1,1,1,1),
('U0004','2026-08-01','New',1,0,0,0,0),
('U0005','2026-08-01','Returning',1,1,1,1,0),
('U0006','2026-08-02','New',1,1,0,0,0),
('U0007','2026-08-02','Returning',1,1,1,1,1),
('U0008','2026-08-02','New',1,0,0,0,0),
('U0009','2026-08-02','New',1,1,1,0,0),
('U0010','2026-08-02','Returning',1,1,1,1,1);

SELECT * FROM funnel_data;SELECT
    SUM(Visitor) AS Visitors,
    SUM(Product_View) AS Product_Views,
    SUM(Add_to_Cart) AS Add_to_Carts,
    SUM(Checkout) AS Checkouts,
    SUM(Purchase) AS Purchases
FROM funnel_data;

