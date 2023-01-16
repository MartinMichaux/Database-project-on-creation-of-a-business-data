/*select all grocery name that have been bought by the user id 1 (= "Donald Trump")*/
	

	select u.first_Name,gr.grocery_Name
	from users u
	inner join shoppinglist sl ON sl.u_Id = u.u_Id
	inner join grocery gr ON gr.g_Id = sl.g_Id 
	where u.u_Id =1;
	

	select u.first_Name,gr.grocery_Name,gr.price*sum(sl.quantity)
	from users u
	inner join shoppinglist sl ON sl.u_Id = u.u_Id
	inner join grocery gr ON gr.g_Id = sl.g_Id
	where u.u_Id =1
	group by u.first_Name, gr.grocery_Name,gr.price ;
	

	/*select all grocery that come from the markets in "Bruxelles"*/
	

	select gr.grocery_Name
	from bridge_table bt
	join market ma ON bt.m_Id = ma.m_Id
	join grocery gr ON bt.g_Id = gr.g_Id
	where ma.location = 'Bruxelles';
	

	/*select every employee with a salary between 1500 and 4000*/
	

	select emp.last_Name, emp.first_Name, co.salary
	from employee emp
	left join contract co on emp.c_Id = co.c_Id
	where co.salary between 1000 and 4000;
	

	/*Select every grocery and see how many are sold and how much they urn for the grocery id 1*/
	

	select gr.grocery_Name, gr.category, gr.price, sum(sl.quantity),gr.price*sum(sl.quantity)
	from grocery gr
	left join shoppinglist sl ON sl.g_Id = gr.g_Id
	left join users u ON sl.u_Id = u.u_Id
	where gr.g_Id =1
	group by gr.grocery_Name, gr.category, gr.price
	order by gr.price*sum(sl.quantity) desc;
  
  
  /*create a view of all grocery name*/
	create or replace view groceryFrom as
	select u.first_Name,gr.grocery_Name
	from users u
	inner join shoppinglist sl ON sl.u_ID= u.u_ID
	inner join grocery gr ON gr.g_ID= sl.g_ID;
	

	/*create a view of what bought the client and how many it has cost*/
	create or replace view Clientproduct as
	select u.first_Name,gr.grocery_Name,gr.price*sum(sl.quantity)
	from users u
	inner join shoppinglist sl ON sl.u_ID= u.u_ID
	inner join grocery gr ON gr.g_ID= sl.g_ID
	group by u.first_Name, gr.grocery_Name,gr.price
	order by u.first_Name;
	

	/*create a view of all grocery that come from the markets in "Bruxelles"*/
	create or replace view groceryInBX as
	select gr.grocery_Name
	from bridge_table bt
	join market ma ON bt.m_ID = ma.m_ID
	join grocery gr ON bt.g_ID= gr.g_ID
	where ma.location   = 'Bruxelles';
	

	

	/*create a view of every employee with a salary between 1500 and 4000*/
	create or replace view salaryBet as
	select emp.last_Name, emp.first_Name, co.salary
	from employee emp
	left join contract co on emp.c_ID = co.c_ID 
	where co.salary between 1000 and 4000;
	

	

	/*create a view of every grocery order by category and then by price by descending order*/
	create or replace view groceryCatPrice as
	select gr.grocery_Name, gr.category, gr.price, sum(sl.quantity),gr.price*sum(sl.quantity)
	from grocery gr
	left join shoppinglist sl ON sl.g_ID= gr.g_ID
	left join users u ON sl.u_ID= u.u_ID
	group by gr.grocery_Name, gr.category, gr.price
	order by gr.price*sum(sl.quantity) desc;
