program fortrantut

  implicit none							!Defining the variables
 

   ! Subroutines can return multiple values
 
integer :: i = 1, p1, p2
call plus_two(i, p1, p2)
print "(i1,/,i1,/,i1)", i, p1, p2 !printing values in different values
 
contains
 
  subroutine plus_two(n, plus1, plus2)
    integer, intent(in) :: n
    integer, intent(out) :: plus1, plus2 ! Output
    plus1 = n + 1
    plus2 = n + 2
  end subroutine plus_two

end program fortrantut
