program fortrantut

  implicit none							!Defining the variables
  ! Create ARRAY
  integer, dimension(1:5) :: a1, a2, a3
  real, dimension(1:50) :: aR1
  ! Create multidimensional array (Matrix)
  integer, dimension(5,5) :: a4
  integer :: n, m, x, y
 
  !Define an array thats size is determined at run time
  integer, dimension(:), allocatable :: a5
  integer :: num_vals = 0
  
  integer, dimension(1:9) :: a6 = (/ 1,2,3,4,5,6,7,8,9 /)
  integer, dimension(1:3,1:3) :: a7
  
  ! Assign values (Starts at index 1)
  a1(1) = 5
  ! Retrieve value
  print "(i1)", a1(1)
  
  ! Assign values with a loop
  do n = 1,5
    a1(n) = n
  end do

  do n = 1,5
    print "(i1)", a1(n)
  end do
  
  ! Get a range
  print "(3i2)", a1(1:3)
  
  ! Get a range with an increment
  print "(2i2)", a1(1:3:2)
  
  ! Assign values to a multidimensional array
  do n = 1,5
    do m = 1, 5
      a4(n,m) = n
    end do
  end do
  do n = 1,5
    do m = 1, 5
      print "(i1,a1,i1,a3,i1)", n, " ", m, " : ", a4(n,m)
    end do
  end do
  
  ! Use an implied do loop to print each row
  ! on one line
  do n = 1,5
    print "(5i1)", ( a4(n,m), m = 1,5 )
  end do
  
  ! Get size
  print "(i2)", Size(a1)
  print "(i2)", Size(a4)
  
  ! Number of dimensions
  print "(i2)", Rank(a4)
  
  ! Elements in each dimension
  print "(i2)", Shape(a4)
  
  ! Define array size at run time
  print *, "Size of array? "
  read *, num_vals !This line saves the information the user is putting in the terminal, but we have to define this since the beginning
  
  allocate(a5(1:num_vals))
  
  do n = 1,num_vals
    a5(n) = n
  end do
  do n = 1,num_vals
    print "(i1)", a5(n)
  end do
  
  ! Change all values in array
  a2 = (/1,2,3,6,7/)
  
  ! Implied do loop
  print "(5i1)", ( a2(m), m = 1,5 )
  
  ! Reshape the ARRAY from 1x9 t0 3x3
  a7 = reshape(a6, (/ 3, 3 /))
  
  ! Check if values are equal across
  ! the 1 dimension
  print "(l1)", all(a1==a2, 1)
  
  ! Are any equal?
  print "(l1)", any(a1==a2, 1)
  
  ! How many are equal
  print "(i1)", count(a1==a2, 1)
  
  ! Get min and max value
  print "(i1)", maxval(a1)
  print "(i1)", minval(a1)
  
  ! Get product and sum
  print "(i3)", product(a1)
  print "(i2)", sum(a1)
 


end program fortrantut
