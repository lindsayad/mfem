#!/bin/bash

# HYPRE_DIR, METIS_DIR, HDF5_DIR generally correspond to $PETSC_DIR/$PETSC_ARCH for me
# For a prefix installed PETSc, then they just correspond to $PETSC_DIR
# NETCDF_DIR is equivalent to LIBMESH_DIR

: "${HYPRE_DIR:?Environment variable HYPRE_DIR is not set or is empty}"
: "${PETSC_DIR:?Environment variable PETSC_DIR is not set or is empty}"
: "${PETSC_ARCH:?Environment variable PETSC_ARCH is not set or is empty}"
: "${METIS_DIR:?Environment variable METIS_DIR is not set or is empty}"
: "${HDF5_DIR:?Environment variable HDF5_DIR is not set or is empty}"
: "${NETCDF_DIR:?Environment variable NETCDF_DIR is not set or is empty}"
: "${CONDUIT_DIR:?Environment variable CONDUIT_DIR is not set or is empty}"

cmake .. \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_POSITION_INDEPENDENT_CODE=YES \
    -DMFEM_USE_OPENMP=NO \
    -DMFEM_THREAD_SAFE=NO \
    -DHYPRE_DIR=$HYPRE_DIR \
    -DMFEM_USE_MPI=YES \
    -DMFEM_USE_METIS=YES \
    -DMFEM_USE_METIS_5=YES \
    -DMETIS_DIR=$METIS_DIR \
    -DParMETIS_DIR=$HYPRE_DIR \
    -DMFEM_USE_SUPERLU=YES \
    -DSuperLUDist_DIR=$HYPRE_DIR \
    -DBUILD_SHARED_LIBS=ON \
    -DHDF5_DIR=$HDF5_DIR \
    -DBLAS_DIR=$HYPRE_DIR \
    -DMFEM_ENABLE_EXAMPLES=yes \
    -DMFEM_ENABLE_MINIAPPS=yes \
    -DBLAS_LIBRARIES=$HYPRE_DIR/lib/libfblas.a \
    -DLAPACK_LIBRARIES=$HYPRE_DIR/lib/libflapack.a \
    -DBLAS_INCLUDE_DIRS=$HYPRE_DIR/include \
    -DLAPACK_INCLUDE_DIRS=$HYPRE_DIR/include \
    -DCMAKE_INSTALL_PREFIX=`pwd`/../installed \
    -DMFEM_USE_PETSC=YES \
    -DPETSC_DIR=$PETSC_DIR \
    -DPETSC_ARCH=$PETSC_ARCH \
    -DCMAKE_C_COMPILER=mpicc \
    -DMFEM_USE_NETCDF=YES \
    -DNETCDF_DIR=$NETCDF_DIR \
    -DMFEM_USE_CONDUIT=YES \
    -DCONDUIT_DIR=$CONDUIT_DIR \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
