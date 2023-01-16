/*delete the manager of id 1 if he his not in charge of a market and of the employee*/
	DELETE FROM contract
	USING Manager
	WHERE contract.c_Id = Manager.c_Id 
	and Manager.m_Id = 1
	and 1> ANY(Select count(*) from employee where employee.m_Id=1)
	and 1> ANY(Select count(*) from market where market.ID_m=1);
	

	/*Delete the employee of id 1*/
	DELETE FROM contract
	USING employee
	WHERE contract.c_Id = employee.c_Id and employee.e_Id = 1;
	

	/*delete a user of the database of id 1*/
	delete from users where u_Id =1;
	

	/*delete a groccery from the reference of the market*/
	delete from grocery
	where g_Id=1;
	

	/*update the salary of an employee*/
	UPDATE contract
	SET salary = 1200
	from employee 
	where contract.c_Id =employee.c_Id and employee.e_Id=1; 
	

	/*Update the price of a grocery of id =1*/
	UPDATE grocery
	SET price = 2000
	where g_Id = 1;


