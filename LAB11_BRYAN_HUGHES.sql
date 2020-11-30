/*
	QUESTION #1
	Create a procedure that accepts four input parameters: 
	two strings, a date, and a number. Have your procedure 
	perform a select statement that selects values from your 
	input parameters in the following format:
		"{date}'s episode of Sesame Street has been brought 
		to you by the letters {first letter of string1, 
		uppercased} and {first letter of string2, uppercased}, 
		and the number {number}."
*/

DELIMITER $$
CREATE PROCEDURE sesameStreet(
	todaysDate	DATE,
	stringOne	VARCHAR(255),
	stringTwo	VARCHAR(255),
	userNumber	INT
) 
BEGIN 
	SET @modifiedDate = DAYNAME(todaysDate);

	SET @modifiedStringOne = UPPER(SUBSTRING(stringOne, 1, 1));

	SET @modifiedStringTwo = UPPER(SUBSTRING(stringTwo, 1, 1));

	SET @modifiedNumber = CAST(userNumber AS VARCHAR(255));

	SET @combinedString = "{modifiedDate}'s episode of Sesame Street is brought \n
	to you by the letters {modifiedStringOne} and {modifiedStringTwo} \n
	and the number {modifiedNumber}"
	
	SELECT @combinedString FROM dual;
END;
$$
DELIMITER ;
CALL sesameStreet('2020-11-29', 'Bryan', 'Hughes', 20);

/*
	QUESTION #2
	Create a procedure that, when called, will insert values 
	into three of your database's tables: two tables with a 
	many-to-many relationship, and the bridging table that 
	manages that relationship. See the example I used of books 
	& authors on how to do this while maintaining data integrity.
*/
DELIMITER $$

CREATE PROCEDURE dataInsertion ()
BEGIN 
	INSERT INTO librarian_info (librarian_id, librarian_fname, librarian_lname)
	VALUES (9, 'Bryan', 'Hughes');
	INSERT INTO librarian_assignments (assignment_id, assignment_name, shift, librarian)
	VALUES ('Main Desk', 1, 9);
	INSERT INTO librarian_schedule (shift_num, shift_day, librarian)
	VALUES (1, '1992-07-14', 9);
END;
$$

DELIMITER ;

select * from librarian_schedule ls 

/*
	QUESTION #3
	Create a procedure that, when called, 
	will set a session variable to the current time. 
	Additionally, write a SELECT statement using 
	that session variable that will subtract the 
	session variable from the current time.
*/

