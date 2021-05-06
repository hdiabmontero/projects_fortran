program fortrantut
  
  use mult_mod
  implicit none							!Defining the variables
  ! Functions contain statements that return
  ! a single value
 
  integer :: ans, ans2
  real :: r_ans
  
  ans = get_sum(5,4)
  print "(a8,i1)", "5 + 4 = ", ans
  print "(a8,i1)", "5 + 4 = ", get_sum2(5,4)
  print "(a8,i1)", "5 + 4 = ", get_sum3(5)
  
  ! Use generic functions in a module that
  ! can work with ints and reals using
  ! the same function
  print "(a8,i2)", "5 * 4 = ", mult(5,4)
  r_ans = mult(5.3,4.4)
  print "(a12,f6.2)", "5.3 * 4.4 = ", r_ans
  
  ! Defines area for functions
  contains !!! FUNCTION BEGINNING
  
    ! Return type, function, name, arguments
    integer function get_sum(n1, n2)
      implicit none
      integer :: n1, n2, sum
  
      ! The last value defined is returned
      sum = n1 + n2
    end function get_sum
  
    ! Define variable to be returned
    function get_sum2(n1, n2) result(sum)
      implicit none
  
      ! Don't allow variable values to change
      integer, intent(in) :: n1, n2
      integer :: sum
      sum = n1 + n2
    end function get_sum2
  
    ! Block functions from changing input
    ! variables with pure
    pure function get_sum3(n1, n2) result(sum)
      implicit none
      integer, intent(in) :: n1
  
      ! Arguments don't need to have a value passed
      integer, intent(in), optional :: n2
      integer :: sum
  
      if(present(n2)) then !Check whether the user entered the value n2 because it is optional
        sum = n1 + n2
      else
        sum = n1 + 1
      end if
    end function get_sum3

 

end program fortrantut
