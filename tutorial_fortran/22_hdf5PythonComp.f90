PROGRAM TEST

USE HDF5

! TO RUN: h5fc 22_hdf5PythonComp.f90 -fintrinsic-modules-path /usr/lib64/gfortran/modules \-lhdf5_fortran -o exe

IMPLICIT NONE


! ---------------------------------------------------------------------------------------
! ARGUMENTS 
! ---------------------------------------------------------------------------------------

! Data I want to save
REAL :: matrix1(1000,1000)
REAL :: matrix2(10000,100)
! Identifiers
INTEGER(HID_T) :: file_id       ! File identifier
INTEGER(HID_T) :: dset1_id     ! Dataset 1 identifier
INTEGER(HID_T) :: dset2_id     ! Dataset 2 identifier
INTEGER(HID_T) :: dspace1_id    ! Dataspace 1 identifier
! Identifiers file to read
INTEGER(HID_T) :: file_idR       ! File identifier
INTEGER(HID_T) :: dset_idR     ! Dataset 1 identifier
INTEGER(HSIZE_T), DIMENSION(2) :: data_dimsR
CHARACTER(LEN=4), PARAMETER :: dsetnameR = "data"     ! Dataset name
REAL, DIMENSION(18,36)  :: datasetR
INTEGER :: errorR ! Error flag
! Data space info
! Integer array
INTEGER :: rank                 ! Dataset rank
INTEGER(HSIZE_T), DIMENSION(2) :: dims1 = (/1000,1000/) ! Dataset dimensions
INTEGER(HSIZE_T), DIMENSION(2) :: data_dims1
INTEGER, DIMENSION(1000,1000) :: dset_data1   ! Data buffers
! Dimensions
! INTEGER(HSIZE_T), DIMENSION(2) :: data_dims
! Misc variables (e.g. loop counters)
INTEGER :: error ! Error flag
! Names (file and HDF5 objects)
CHARACTER(LEN=30), PARAMETER :: filename = "hdf5_data_FORTRAN.hdf5" ! File name to write
CHARACTER(LEN=15), PARAMETER :: filenameR = "true.h5" ! File name to read
CHARACTER(LEN=9), PARAMETER :: dsetname1 = "dataset1" ! Dataset name
CHARACTER(LEN=9), PARAMETER :: dsetname2 = "dataset2" ! Dataset name



! ---------------------------------------------------------------------------------------
! SAVING DATA IN HDF5 FILES 
! ---------------------------------------------------------------------------------------

!	matrix1 = np.random.random(size=(1000,1000))
!	matrix2 = np.random.random(size=(10000,100))


! Initialize the dset_data array
data_dims1(1) = 1000
data_dims1(2) = 1000
rank = 2
CALL RANDOM_NUMBER(matrix1)
CALL RANDOM_NUMBER(matrix2)

!	with h5py.File('./hdf5_data.h5','w') as hdf:
!	    hdf.create_dataset('dataset1',data=matrix1)
!	    hdf.create_dataset('dataset2',data=matrix2)

! Identifiers
!INTEGER(HID_T) :: file_id       ! File identifier
!INTEGER(HID_T) :: dset1_id, group1_id      ! Dataset 1 identifier
!INTEGER(HID_T) :: dset2_id, group2_id      ! Dataset 2 identifier

! Dimensions

!INTEGER(HSIZE_T), DIMENSION(2) :: data_dims


! Misc variables (e.g. loop counters)
!INTEGER :: error ! Error flag


! Names (file and HDF5 objects)
!CHARACTER(LEN=15), PARAMETER :: filename = "hdf5_data_FORTRAN.hdf5" ! File name
!CHARACTER(LEN=9), PARAMETER :: dsetname1 = "dataset1" ! Dataset name
!CHARACTER(LEN=9), PARAMETER :: dsetname2 = "dataset2" ! Dataset name

! Initialize Fortran interface
CALL h5open_f(error)

	! Create a new file
	CALL h5fcreate_f(filename, H5F_ACC_TRUNC_F, file_id, error)

		! Create dataspace 1 (the dataset is next) "dspace_id" is returned
		CALL h5screate_simple_f(rank, dims1, dspace1_id, error)
		! Create dataset 1 with default properties "dset_id" is returned
		CALL h5dcreate_f(file_id, dsetname1, H5T_NATIVE_INTEGER,dspace1_id, & 
		dset1_id, error)
		!data_dims(1)=1000
		!data_dims(2)=1000
		! Write dataset 1
		CALL h5dwrite_f(dset1_id, H5T_NATIVE_REAL, matrix1, data_dims1, error)
		! Close access to dataset 1
		CALL h5dclose_f(dset1_id, error)
		! Close access to data space 1
		CALL h5sclose_f(dspace1_id, error)

	! Close the file
	CALL h5fclose_f(file_id, error)

! Close FORTRAN interface
CALL h5close_f(error)

! ---------------------------------------------------------------------------------------
! READING DATA FROM HDF5 FILES
! ---------------------------------------------------------------------------------------

! Initialize Fortran interface
CALL h5open_f(errorR)

	! Create a new file
	CALL h5fopen_f(filenameR, H5F_ACC_RDWR_F, file_idR, errorR)

		CALL h5dopen_f(file_idR, dsetnameR , dset_idR, errorR)

		CALL h5dread_f(dset_idR, H5T_NATIVE_REAL, datasetR, data_dimsR, errorR)

		CALL h5dclose_f(dset_idR, errorR)

	! Close the file
	CALL h5fclose_f(file_idR, errorR)

! Close FORTRAN interface
CALL h5close_f(errorR)

 WRITE(*,*) Shape(datasetR)    ! 2

! Get min and max value
 WRITE(*,*) maxval(datasetR)
 WRITE(*,*) minval(datasetR)

! ---------------------------------------------------------------------------------------
! CREATING GROUPS IN HDF5 FILES
! ---------------------------------------------------------------------------------------


! ---------------------------------------------------------------------------------------
! READING GROUPS IN HDF5 FILES
! ---------------------------------------------------------------------------------------



END PROGRAM TEST
