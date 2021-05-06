program fortrantut

  implicit none							!Defining the variables

  character (len=100) :: str = "I'm a string"
  character (len=100) :: str2
  
  ! If set to anything other then 0 an
  ! error occurred when opening a file
  integer :: err_status
  
  ! Used to catch error messages
  CHARACTER(256) :: err_iomsg
  
  ! Open / Create a FILE
  ! The unit number must be unique for
  ! each file
  ! new (new file), old (exists),
  ! scratch (file deleted after use)

!The 10 defines a unique ID value for the file to identify it
! status ='new' if we are creating the file
  open(10, file='data.dat', status='new', iostat = err_status, iomsg=err_iomsg)
  if(err_status /= 0) then
    write (*,*) 'Error ', trim(err_iomsg)
  
    ! Stop execution
    Stop
  end if
  
  ! Write string to file
  write (10, '(A)') str
  
  ! Close the file
  close(10)
  
  ! Open to read
  ! status = 'old' if we already have created the file
  open(11, file='data.dat', status='old')
  
  ! Read from file
  read (11, '(A)') str2
  write (*, '(A)') trim(str2)
  
  ! Either KEEP or DELETE file when closed
  close(11, status="DELETE")
 

end program fortrantut
