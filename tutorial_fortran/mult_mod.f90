module mult_mod
  implicit none
  private
  public :: mult
 

	! Need to run like this:
	! gfortran -c mult_mod.f90 13_functions.f90
	! gfortran mult_mod.o 13_functions.o
	! ./a.out

  ! We can define the 2 functions we
  ! will associate with the mult function
  ! depending on the input data types
  interface mult
    procedure mult_real, mult_int
  end interface mult
 
contains
  real function mult_real( n1,n2 )
    real, intent(in) :: n1,n2
    real :: product
    product = n1 * n2
  end function mult_real
 
  integer function mult_int( n1,n2 )
    integer, intent(in) :: n1,n2
    integer :: product
    product = n1 * n2
  end function mult_int
 
end module mult_mod
 
