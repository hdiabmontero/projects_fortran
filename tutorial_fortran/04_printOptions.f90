program fortrantut

	implicit none
	!When defining the number of characters to be printed they are always will be defined counting from the right (right justified)
	print *, "A number ", 10  	!Automatically is justified when is printed
	print "(3i5)", 7, 6, 8 		!It means we repeat three times the same procedure with integers, printing the number as the fifth character
	print "(i5)", 7, 6, 8		!It means we don't print everything in the same line but that we print each of them in a different line
	print "(2f8.5)", 3.1415, 1.234 	!It means wehave two times the same operation with a float number, each will take 8 character positions,and the float number will be output until the fifth decimal
	print"(/, 2a8)", "Name", "Age" !Here a represents a string. So, it will be 2 times strings of 8 character positions
	print"(e10.3)", 123.456 !Here we have an exponential value
	print"(a5,i2)", "I am ",43 !Means the is a string printed until the fifth character position and an integer with 2 positions
	
end program fortrantut
