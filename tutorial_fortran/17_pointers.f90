program fortrantut

  implicit none							!Defining the variables

 ! Declare a pointer to an integer
  integer, pointer :: ptr1, ptr2
  
  ! Pointer to an array
  integer, pointer, dimension(:) :: a_ptr1
  
  ! Declare a target whose value changes
  ! as the pointers value changes
  integer, target :: target1
  
  ! Allocate space for a pointer
  allocate(ptr1)
  ptr1 = 5
  print "(a5,i1)", "ptr1 ", ptr1
  
  ! Associate pointer with target
  ptr2 => target1
  ptr2 = 1
  
  ptr2 = ptr2 + 2
  print "(a5,i1)", "ptr1 ", ptr1
  print "(a5,i1)", "tar1 ", target1
  
  ! Disassociate pointer and target
  nullify(ptr2)
  
  ! Deallocate storage for pointer
  deallocate(ptr1)
 

end program fortrantut
