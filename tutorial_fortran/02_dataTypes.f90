program fortrantut

	implicit none							!Defining the variables
	real, parameter :: PI = 3.1415					!Defininig two real constants
	real :: r_num1= 0.0, r_num2 = 0.0
	double precision :: dbl_num = 1.1111111111111111d+0	 	!Defining a number with double precision
	integer :: i_num1=0, i_num2=0					!Defining two integer constants
	logical :: can_vote = .true. 					!Defining the boolean variables
	character (len=10) :: month					!Defining a character array with 10 characters
	complex :: com_num = (2.0,4.0) 					!Gives the biggest real value 
	print *, "Biggest Real", huge(r_num1)				!Gives the biggest integer value
	print *, "Biggest Int", huge(i_num1)				
	print *, "Smallest Real", tiny(r_num1)				!Gives the smallest real value
	!print *, "Smallest Int", tiny(i_num1)				!Gives the smallest integer value, tiny() does not work for integer types
	print "(a4,i1)", "Int ",kind(i_num1)				!Gives the bit contained inside of this variable
	print "(a5,i1)", "Real ",kind(r_num1)				!Gives the bit contained inside of this variable
	print "(a7,i1)", "Double ",kind(dbl_num)			!Gives the bit contained inside of this variable
	print "(a8,i1)", "Logical ",kind(can_vote)			!Gives the bit contained inside of this variable

end program fortrantut
