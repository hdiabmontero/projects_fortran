program fortrantut

  implicit none							!Defining the variables

  ! You can define custom types which contain
  ! multiple values of different types
 
 type Customer !This is basically like creating a class
    character (len = 40) :: name
    integer :: age
    real :: balance
  end type Customer
  
  type(Customer), dimension(5) :: customers !Here we are defining 5 objects of the class CUstomer
  
  integer :: n
  
  ! Create a customer
  type(Customer) :: cust1
  
  ! Assign values !Here we are initializing the values of the class...
  cust1%name = "Sally Smith"
  cust1%age = 34
  cust1%balance = 320.45
  
  ! Assign structure to array
  customers(1) = cust1
  
  ! Assign values independently
  customers(2)%name = "Tom May"
  customers(2)%age = 42
  customers(2)%balance = 229.78
  
  do n = 1, 2
    print *, customers(n)
  end do
 
 

end program fortrantut
