/*sort Customers*/
SELECT Customer_Name
FROM Clients
where Customer_Name like "%t%"

SELECT Customer_Name
FROM Clients
where Customer_Name like "%a%"

SELECT Customer_Name 
FROM Clients
ORDER BY Customer_ID DESC

SELECT Customer_Name
FROM Clients
ORDER BY Demand 

/*Material Expiration date*/
SELECT Material_Name, ROUND(DATEDIFF(Expiry_Date, Curdate())/365, 0) as years_left, ROUND(DATEDIFF(Expiry_Date, Curdate())/12, 0) AS months_left, ROUND(DATEDIFF(Expiry_Date, Curdate()), 0) AS days_left
from Inventory

/*low weapon quantity*/
SELECT *
FROM Weapons
WHERE Quantity < 50

/*Complete Order Report*/
SELECT Requests.Order_ID, Clients.Customer_Name, Weapons.Product_Name, Teams.Team_Name, Clients.Demand * Weapons.Product_Price AS Total_Price, Transportation.Transport_Name,
CASE 
WHEN Weapons.Quantity > Clients.Demand THEN "Ready to Deploy!"
WHEN Weapons.Quantity < Clients.Demand THEN "Unavailable"
END AS Status
FROM Weapons, Clients, Requests, Teams, Inventory, Transportation
WHERE Requests.Customer_ID = Clients.Customer_ID
AND Requests.Product_ID = Weapons.Product_ID
AND Requests.Product_ID = Teams.Product_ID
and Requests.Order_ID = Transportation.Order_ID
GROUP BY Requests.Order_ID 

/*Sales Revenue*/
SELECT Product_Name, Quantity * Product_Price AS Revenue 
FROM Weapons

/*Sales Volume*/
SELECT Weapons.Product_Name, Clients.Demand AS Sales_Volume
FROM Weapons, Clients, Requests
WHERE Requests.Product_ID = Weapons.Product_ID
and Requests.Customer_ID = Clients.Customer_ID
GROUP BY Weapons.Product_Name 

/*invoice*/
SELECT Clients.Customer_ID, Weapons.Product_ID, Clients.Customer_Name, Weapons.Product_Name, Weapons.Product_Price * Clients.Demand as total_Price
FROM Clients, Weapons, Requests
WHERE Requests.Product_ID = Weapons.Product_ID
AND Requests.Customer_ID = Clients.Customer_ID

/*Material Requirements*/
SELECT Weapons.Product_Name,Clients.Customer_Name, Inventory.Material_Name, Clients.Demand * Weapons.Required_Materials as Material_Amount, Syncstock.Sync_Name, Weapons.Required_Sync * Clients.Demand AS Sync_Amount
FROM Weapons, Clients, Requests, Inventory, Syncstock
WHERE Requests.Customer_ID = Clients.Customer_ID
AND Requests.Product_ID = Weapons.Product_ID
AND Inventory.Material_ID = Weapons.Material_ID
And Syncstock.Sync_ID = Weapons.Sync_ID
GROUP BY Clients.Customer_Name

/*inventory leftovers*/
SELECT Inventory.Material_Name,
CASE 
WHEN Clients.Demand * Weapons.Required_Materials > Inventory.Quantity THEN "Out of Stock"
WHEN Clients.Demand * Weapons.Required_Materials < Inventory.Quantity THEN "Available"
END AS Quantity_Left
FROM Inventory, Clients, Weapons
GROUP BY Inventory.Material_Name

/*Sync_residue*/
SELECT Syncstock.Sync_Name,
CASE 
WHEN Clients.Demand * Weapons.Required_Sync > Syncstock.Quantity THEN "Out of Stock"
WHEN Clients.Demand * Weapons.Required_Sync < Syncstock.Quantity THEN "Available"
END AS Sync_Residue
FROM Syncstock, Clients, Weapons
GROUP BY Syncstock.Sync_Name


