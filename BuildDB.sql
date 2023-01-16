/* Delete the tables if they already exist */
	drop table if exists Bridge_table cascade;
	drop table if exists Market cascade;
	drop table if exists ShoppingList cascade;
	drop table if exists Users cascade;
	drop table if exists Grocery cascade;
	drop table if exists Employee cascade;
	drop table if exists Manager cascade;
	drop table if exists Contract cascade;
	

	/* The IDs are defined as follows: e_ID stands for employee id, m_ID stands for manager ID, c_ID for contract ID, g_IDfor grocery ID, u_IDfor user ID */
	

	create table Contract(c_ID Serial not null, salary Real, position text, start_Date text, Primary Key(c_ID ));
	create table Manager(m_ID Serial not null, c_ID Integer, lead_Position text, Primary Key(m_ID),
		CONSTRAINT delete_manager
	    FOREIGN KEY (c_ID )
	    REFERENCES contract (c_ID )
	    ON DELETE CASCADE
	);
	create table Employee(e_ID Serial not null, last_Name  text, first_Name   text, email_Adress varchar(320), sex char(1), phone_Number real, c_ID Serial not null,m_ID Serial not null, Primary Key(e_ID), Foreign Key(m_ID) REFERENCES Manager(m_ID),
	  CONSTRAINT delete_emplo
	    FOREIGN KEY (c_ID )
	    REFERENCES contract (c_ID )
	    ON DELETE CASCADE
	);
	create table Grocery(g_ID Serial not null, grocery_Name  text, category text, price Real, Primary Key(g_ID));
	create table Users(u_ID Serial not null, last_Name  text, first_Name   text, email_Adress varchar(320), phone_Number real, Primary Key(u_ID));
	create table ShoppingList(u_ID Integer not null, g_ID Integer not null, Primary Key(u_ID, g_ID),quantity  integer,
		CONSTRAINT delete_grocery
		Foreign key (g_ID)
		REFERENCES Grocery(g_ID)
		ON DELETE CASCADE,
		CONSTRAINT delete_user
		Foreign key (u_ID) 
		REFERENCES Users(u_ID)
		ON DELETE CASCADE);
	

	create table Market(m_ID Serial not null,ID_m Integer not null,location   text,Market_Name text,Primary key(m_ID),Foreign key(ID_m ) REFERENCES Manager (m_ID));
	

	create table Bridge_table(m_ID Integer not null, g_ID Integer not null, Primary Key(m_ID, g_ID),
		CONSTRAINT delete_grocery
		Foreign key (g_ID)
		REFERENCES Grocery(g_ID)
		ON DELETE CASCADE,
		Foreign key (m_ID) REFERENCES Market(m_ID));
	

	

	

	

	/* need to create the contract before the manager */
	insert into Contract values(default,15000,'CEO','2001-09-28'); /*1*/
	insert into Contract values(default,4000,'Operation Manager','2001-10-12'); /*2*/
	insert into Contract values(default,2000,'Accountant','2001-10-28'); /*3*/
	insert into Contract values(default,3500,'Office Manager','2001-11-08'); /*4*/
	insert into Contract values(default,3000,'Market Manager','2001-12-06'); /*5*/
	insert into Contract values(default,4000,'Purchasing manager','2002-01-15'); /*6*/
	insert into Contract values(default,5000,'COO','2002-01-28'); /*7*/
	insert into Contract values(default,10000,'Marketing manager','2002-09-20'); /*8*/
	insert into Contract values(default,4500,'Production Manager','2004-05-18') ;/*9*/
	insert into Contract values(default,3000,'Cheif of staff','2005-03-31'); /*10*/
	

	insert into Manager values(default,1,'All Staff'); /*1*/
	insert into Manager values(default,2,'Checkout');/*2*/
	insert into Manager values(default,3,'Checkout');/*3*/
	insert into Manager values(default,4,'Checkout');/*4*/
	insert into Manager values(default,5,'Checkout');/*5*/
	insert into Manager values(default,6,'Checkout');/*6*/
	insert into Manager values(default,7,'Checkout');/*7*/
	insert into Manager values(default,8,'Checkout');/*8*/
	insert into Manager values(default,9,'Checkout');/*9*/
	insert into Manager values(default,10,'Checkout');/*10*/
	

	

	/* need to create the contract before the Employee */
	insert into Contract values(default,1000,'Checkout','2001-10-28');/*11*/
	insert into Contract values(default,1000,'Grocery','2001-10-28');/*12*/
	insert into Contract values(default,1000,'Frozen Food','2001-11-03');/*13*/
	insert into Contract values(default,1000,'Meat','2001-11-09');/*14*/
	insert into Contract values(default,1000,'Seafood','2001-11-28');/*15*/
	insert into Contract values(default,1000,'Drinks','2001-12-08');/*16*/
	insert into Contract values(default,1000,'Beer and Wine','2001-12-08');/*17*/
	insert into Contract values(default,1000,'Dairy','2002-01-15');/*18*/
	insert into Contract values(default,1000,'Health and Beauty','2002-02-02');/*19*/
	insert into Contract values(default,1000,'Front End','2002-03-18');/*20*/
	

	insert into Employee values(default,'Goffinet','Arthur','arthur.goffinet@gmail.com','M',0032495431032,11,1); 
	insert into Employee values(default,'Michaux','Martin','michaux.martin@gmail.com','M',0032478965458,12,2);
	insert into Employee values(default,'Schapira','Aaron','aaron.schapira@gmail.com','M',0032479364521,13,3);
	insert into Employee values(default,'Trieu','Jo','jo.trieu@gmail.com','M',0032489251436,14,4);
	insert into Employee values(default,'Liege','Arthur','arthur.liege@gmail.com','M',0032478524163,15,5);
	insert into Employee values(default,'Impa','Adele','adele.impa@gmail.com','F',0032479023654,16,6);
	insert into Employee values(default,'Grundland','Adaia','ada.grund@gmail.com','F',0032475895623,17,7);
	insert into Employee values(default,'Goldblatt','Gary','gary.goldblatt@gmail.com','M',0032485784512,18,8);
	insert into Employee values(default,'Levi','Rachel','rachel.levi@gmail.com','F',00324714252845,19,9);
	insert into Employee values(default,'Idea','Daniel','daniel.idea@gmail.com','M',0032465897845,20,10);
	

	

	insert into Grocery values(default,'Water','Drinks',1); 
	insert into Grocery values(default,'Beer','Beer and Wine',2); 
	insert into Grocery values(default,'Steak','Meat',5); 
	insert into Grocery values(default,'Candies','Grocery',2); 
	insert into Grocery values(default,'Paper Toilet','Health and Beauty',3); 
	insert into Grocery values(default,'Rice','Grocery',1.5); 
	insert into Grocery values(default,'Pasta','Grocery',2);
	insert into Grocery values(default,'Fish','Seafood',3); 
	insert into Grocery values(default,'Frozen fruits','Frozen',4);
	insert into Grocery values(default,'Cofee','Grocery',2); 
	

	insert into Users values(default,'Trump','Donald','donald.trump@gmail.com',0032485742536);
	insert into Users values(default,'Obama','Barack','barack.obama@gmail.com',0032465987415);
	insert into Users values(default,'Van Buren','Jackson','jacksonvanburen@gmail.com',0032415253698);
	insert into Users values(default,'Kennedy','John','johnkennedy@gmail.com',0032483160381);
	insert into Users values(default,'Franklin', 'Benjamin','benjaminfranklin@gmail.com',0032475356849);
	insert into Users values(default,'Potter','Harry','harrypotter@gmail.com',0032465897878);
	insert into Users values(default,'Jackson','Percy','percyjackson@gmail.com',0032475230619);
	insert into Users values(default,'Messi','Lionel','lionelmessi@gmail.com',0032479023654);
	insert into Users values(default,'Ramos','Sergio','sergioramos@gmail.com',0032478545454);
	insert into Users values(default,'Hazard','Eden','edenhazard@gmail.com',0032495636564);
	

	insert into Market values(default,1,'Waterloo','Cassefour'); 
	insert into Market values(default,2,'Bruxelles','Cassefour');
	insert into Market values(default,3,'Uccle','Cassefour');
	insert into Market values(default,4,'Liege','Cassefour');
	insert into Market values(default,5,'Auderghem','Cassefour');
	insert into Market values(default,6,'Ottignies','Cassefour');
	insert into Market values(default,7,'Boitsfort','Cassefour');
	insert into Market values(default,8,'Ixelles','Cassefour');
	insert into Market values(default,9,'Saint-Gilles','Cassefour');
	insert into Market values(default,10,'Lasne','Cassefour');
	

	

	insert into Bridge_table values(1,1);
	insert into Bridge_table values(2,2);
	insert into Bridge_table values(3,3);
	insert into Bridge_table values(4,4);
	insert into Bridge_table values(5,5);
	insert into Bridge_table values(6,6);
	insert into Bridge_table values(7,7);
	insert into Bridge_table values(8,8);
	insert into Bridge_table values(9,9);
	insert into Bridge_table values(10,10);
	

	insert into ShoppingList values(1,1,10);
	insert into ShoppingList values(1,4,13);
	insert into ShoppingList values(2,2,23);
	insert into ShoppingList values(3,3,1);
	insert into ShoppingList values(4,4,1);
	insert into ShoppingList values(4,7,11);
	insert into ShoppingList values(5,5,1);
	insert into ShoppingList values(6,6,1);
	insert into ShoppingList values(7,7,1);
	insert into ShoppingList values(8,8,1);
	insert into ShoppingList values(9,9,1);
	insert into ShoppingList values(10,10,1);
  
  
  
