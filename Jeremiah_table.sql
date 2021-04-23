/*make the tables*/

CREATE TABLE Weapons (
  Product_ID INT NOT NULL,
  Product_Name Varchar(20),
  Product_Price decimal(10,2),
  Material_ID INT,
  Sync_ID INT,
  Team_ID INT,
  Transport_ID INT,
  Quantity INT,
  Required_Materials INT,
  Required_Sync INT,
  PRIMARY KEY (Product_ID),
  FOREIGN KEY (Sync_ID) REFERENCES Syncstock(Sync_ID)
);

CREATE TABLE Clients(
  Customer_ID INT NOT NULL,
  Customer_Name Varchar(20),
  Address Varchar(20),
  Demand INT,
  Primary KEY (Customer_ID)
);

CREATE TABLE Requests(
  Order_ID INT NOT NULL,
  Product_ID INT,
  Customer_ID INT,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (Product_ID) REFERENCES Weapons(Product_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Clients(Customer_ID)
);

CREATE TABLE Inventory(
  Material_ID INT NOT NULL,
  Material_Name Varchar(20),
  Quantity INT NOT NULL,
  Expiry_Date Date,
  PRIMARY KEY (Material_ID)
);

CREATE TABLE Teams(
  Team_ID INT NOT NULL,
  team_Name varchar(20),
  Product_ID INT,
  Primary KEY (Team_ID),
  FOREIGN KEY (Product_ID) REFERENCES Weapons(Product_ID)
);

CREATE TABLE Transportation(
  Transport_ID INT NOT NULL,
  Transport_Name Varchar(20),
  Order_ID INT,
  Primary KEY (Transport_ID),
  FOREIGN KEY (Order_ID) REFERENCES Requests(Order_ID)
);

CREATE TABLE Syncstock(
	Sync_ID INT NOT NULL,
    Sync_Name Varchar(20),
    Quantity INT,
    PRIMARY KEY (Sync_ID)
)
/*insert values for weapons*/
insert into Weapons Values(0772, "C39 Pistol", 250, 1111, 1, 001237, 2, 50, 30, 10);
insert into Weapons Values(7342, "Helix Gun", 300, 2378, 3, 005612, 1, 68, 10, 10);
insert into Weapons values(8352, "Void Flux Cannon", 2000, 4734, 2, 002167, 5, 72, 20, 20);
insert into Weapons Values(7526, "Bond of Souls", 5000, 7617, 4, 009071, 6, 84, 10, 10);
insert into Weapons Values(6671, "Supernova Eraser", 3000, 1853, 5, 000123, 8, 100, 10, 20);
insert into Weapons Values(7238, "Phase Beam", 1500, 1853, 7, 000321, 7, 13, 20, 10);
insert into Weapons Values(1235, "Summoner", 2700, 6781, 6, 000491, 3, 23, 30, 20);
insert into Weapons VALUES(5231, "Hollow Supremacy", 4900, 3411, 8, 000582, 4, 58, 10, 30);
insert into Weapons values(1137, "Lich Trident", 2300, 9990, 10, 005555, 10, 74, 20, 10);
insert into Weapons Values(6712, "Peace Maker", 100, 5050, 9, 003213, 9, 69, 10, 10);

/*insert values for clients*/
insert into Clients values(731, "Xivier Arts", "Port 712", 20);
INSERT into Clients values(628, "Entoron Assembly", "Momond 12", 50);
insert into Clients Values(515, "Ocrodon", "Port 173", 30);
insert into Clients Values(021, "Antason.co", "Xusall 36", 20);
insert into Clients Values(008, "Teahirm", "Otomore 67", 20);
INSERT Into Clients Values(752, "Void Domain", "Ozlido 123", 20);
insert into Clients VALUES(261, "Unknown", "Zrens 11", 20);
insert into Clients Values(222, "Cusbury Arms", "Port 711", 20);
insert into Clients Values(908, "Vrimont Shamac", "Zrens 10", 20);
insert into Clients Values(715, "Thousand Treasures", "Xusall 32",30);
insert into Clients Values(700, "Enigma", "Unknown", 10);

/*insert values for requests*/
insert into Requests values(1, 8352, 628);
insert into Requests Values(2, 7526, 515);
insert into Requests Values(3, 0772, 021);
insert into Requests Values(4, 7342, 731);
insert into Requests Values(5, 6671, 752);
insert into Requests Values(6, 1235, 008);
insert into Requests Values(7, 7238, 222);
insert into Requests Values(8, 1137, 908);
Insert into Requests Values(9, 6712, 261);
insert into Requests Values(10, 5231, 715);

/*insert values for inventory*/
insert into Inventory values(2378, "Astro Package", 250, "2025-09-01");
insert into Inventory Values(1111, "Colstar starter", 531, "2026-01-01");
insert into Inventory Values(7617, "Terminus Volts", 550, "2049-03-10");
insert into Inventory Values(1921, "Hydroscanner", 600, "2027-02-11");
insert into Inventory Values(4734, "Spin Set", 600, "2068-01-01");
insert into Inventory Values(6781, "Varqueen stash", 700, "2077-03-01");
insert into Inventory Values(1853, "Bloom Package", 230, "2027-10-10");
insert into Inventory Values(3411, "Depth Null", 460, "2025-01-01");
insert into Inventory Values(5050, "Reapsonic", 781, "2061-09-23");
insert into Inventory Values(9990, "Xolval Liquid", 800, "2078-02-05");
insert into Inventory Values(9190, "Toxic Waste", 999); 

/*insert values for inventory*/
insert into Teams VALUES(001237, "Hexa", 7342);
insert into Teams VALUES(005612, "Photon", 8352);
insert into Teams VALUES(002167, "Vial", 7526);
insert into Teams Values(009071, "Soulium", 0772);
insert into Teams Values(000123, "Datahacks", 7238);
insert into Teams Values(000321, "Omega", 6671);
insert into Teams VALUES(000491, "Trobos", 5231);
Insert into Teams VALUES(000582, "Abyssal", 1137);
insert into Teams Values(005555, "Lurker", 1235);
insert into Teams Values(003213, "Ronin", 6712);

/*insert values for transportation*/
insert into Transportation values(1, "Ship#451", 2);
insert into Transportation Values(2, "Ship#137", 10);
insert into Transportation VALUES(3, "Ship#152", 3);
insert into Transportation VALUES(4, "Ship#731", 1);
insert into Transportation VALUES(5, "Ship#169", 8);
insert into Transportation VALUES(6, "Ship#261", 4);
insert into Transportation values(7, "Ship#328", 6);
insert into Transportation VALUES(8, "Ship#222", 5);
insert into Transportation Values(9, "Ship#531", 7);
insert into Transportation Values(10, "Ship#199", 9);

/*Insert values for Syncstock*/
insert into Syncstock Values(1, "Trinity", 500);
insert into Syncstock VALUES(2, "Glepnir", 600);
insert into Syncstock Values(3, "Rotom", 700);
insert into Syncstock VALUES(4, "Astin", 900);
insert into Syncstock Values(5, "Czurin", 2000);
insert into Syncstock VALUES(6, "Dolman", 1000);
insert into Syncstock Values(7, "Minkh", 700);
insert into Syncstock VALUES(8, "Duat", 800);
insert into Syncstock Values(9, "Nolsk", 700);
insert into Syncstock VALUES(10, "Becuz", 700);

/*alter some tables*/
ALTER TABLE Weapons
ADD CONSTRAINT Material_ibfk_4 FOREIGN KEY (Material_ID) 
REFERENCES Inventory(Material_ID);

ALTER TABLE Weapons
ADD CONSTRAINT Sync_ibfk_1 FOREIGN KEY (Sync_ID) 
REFERENCES Inventory(Sync_ID);

ALTER TABLE Weapons
add CONSTRAINT Teams_ibfk_2 FOREIGN KEY (Team_ID) 
REFERENCES Teams(team_ID);

ALTER TABLE Weapons
ADD CONSTRAINT Transport_ibfk_3 FOREIGN KEY (Transport_ID) 
REFERENCES Transportation(Transport_ID);

/*update and drop tables*/
UPDATE Clients
set Customer_Name = "Quailrex"
WHERE Customer_ID = 261

delete from Inventory
where Material_ID = 9190

delete from Clients
where Customer_ID = 700

UPDATE Inventory
set Material_Name = "Terminus Bolts"
where Material_ID = 7617
