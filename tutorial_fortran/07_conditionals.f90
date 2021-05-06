program fortrantut

  implicit none							!Defining the variables
  ! Relational Operators : == /= > < >= <=
  ! Logical Operators : .and. .or. .not.
 
  ! If, else if, else
  integer :: age = 16
  if ((age >= 5) .and. (age <= 6)) then
    print *, "Kindergarten"
  else if ((age >= 7) .and. (age <= 13)) then
    print *, "Middle School"
  else if ((age >= 14) .and. (age <= 18)) then
    print *, "High School"
  else
    print *, "Stay Home"
  end if
  
  print *, .true. .or. .false.
  print *, .not. .true. !Means how to negate a true value
  print *, 5 /= 9 !Means not equal to
  
  ! Can be used with letters
  print *, "a" < "b"
  
  ! Select
  select case (age)
  case (5) !Same thing as saying age==5?
    print *, "Kindergarten"
  case (6:13) !Same thing as saying between 6 and 13?
    print *, "Middle School"
  case (14,15,16,17,18) !Same thing as saying ==14,15,16,17,18?
    print *, "High School"
  case default
    print *, "Stay Home"
  end select

end program fortrantut
