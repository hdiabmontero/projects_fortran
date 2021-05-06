program fortrantut

  implicit none							!Defining the variables
  integer :: n = 0, m = 1
  integer :: secret_num = 7
  
  ! Start, Finish, Step
  do n = 1, 10, 2 ! The order of the loop here is where does the loop start, where does it end and the step
    print "(i1)", n
  end do
  
  ! Exit & Cycle
  ! Print only evens
  do while (m < 20)
    if (MOD(m,2) == 0) then
      print "(i1)", m
      m = m + 1
   
      cycle ! Jumps back to beginning of loop

    end if
    m = m + 1
    if (m >= 10) then
      ! Exits the loop all together
      exit
    end if
  end do
  
  ! Continue looping while a condition is true
  do while (n /= secret_num)
    print *, "What's your guess "
    read *, n
  end do
  print *, "You guessed it!"

end program fortrantut
