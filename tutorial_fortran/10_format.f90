program fortrantut

  implicit none							!Defining the variables

  ! The format statement has a numbered
  ! label. You pass values to it that will
  ! fit into the designated formatting
  integer :: num
  integer :: cups
  real :: liters
  real :: quarts
  
  ! Print values 1 - 12 * 7
  do num = 1,12
    print 100, num, num * 7
  
    ! I designates an integer along with
    ! total space with values right justified
    100 format(I2,' * 7 = ',I3)
  end do
  
  ! / Adds a newline
  print "(/a18)", "Cups Liters Quarts"
  do cups = 1, 10
    liters = cups * .236
    quarts = cups * .208
    print 200 , cups,liters,quarts
  
    ! x defines spaces f is for floats
    200 format(' ',i3, 2x, f5.3, 2x, f5.3)
  end do


end program fortrantut
