program sds_info
use hdf5
implicit none
 
 
! Variables declaration
  CHARACTER*100 :: file_name
  CHARACTER*100 :: sds_name
  CHARACTER*100 :: gr_name
  CHARACTER*100 :: attr_name
  INTEGER(HID_T):: file_id, gr_id, dset_id, attr_id
  INTEGER :: status, error, storage, nlinks,max_corder, attr_num
  REAL, DIMENSION(10,10) :: dset_data, data_out
  INTEGER, DIMENSION(1:10)   ::    buf
  INTEGER(HSIZE_T), DIMENSION(2)::  data_dims
  INTEGER(HSIZE_T), DIMENSION(1) ::dims
 
! Variables initalization
  file_name = "example.h5"
  sds_name = "/g1/g1.1/dset1.1.1"
  gr_name = "g3"
  attr_name = "attr1"
 
! Initialize the interface
  call h5open_f(status)
! Open an hdf5 file
  call h5fopen_f (file_name, H5F_ACC_RDWR_F, file_id, status)
! Get the number of global attributes
  call h5aget_num_attrs_f(file_id, attr_num, error)
  print *, "attr_num ",attr_num
 
! Open a group
  call h5gopen_f(file_id, gr_name, gr_id, status )
! Get information about a group
! **storage: type of storage for links in the group: Compact storage, Indexed storage or Symbol tables
! **nlinks : number of links in the group
! **max_corder : current maximum creation order value for group
  call h5gget_info_f(gr_id, storage, nlinks,max_corder, error)
  print*,"storage, nlinks,max_corder", storage, nlinks,max_corder
 
! Open a dataset
  call h5dopen_f(file_id, sds_name, dset_id, error)
! Get the number of attributes
  call h5aget_num_attrs_f(dset_id, attr_num, error)
  print *, "attr_num ",attr_num
! Read the dataset
  call h5dread_f(dset_id, H5T_NATIVE_REAL, data_out, data_dims, error)
  print *, "data_out ",data_out(2,2)
 
! Open an attribute
  call h5aopen_f(file_id, attr_name, attr_id, error)
! Read an attribute
  call h5aread_f(attr_id, H5T_NATIVE_INTEGER, buf, dims, error)
  print *, "buf ", buf
 
! Terminate access to the group
  call h5gclose_f(gr_id, error)
! Terminate access to the dataset
  call h5dclose_f(dset_id, error)
! Terminate access to the file
  call h5fclose_f(file_id, error)
! Close FORTRAN interface.
  call h5close_f(status)
 
end program sds_info

