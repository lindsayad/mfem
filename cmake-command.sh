#!/bin/bash

: "${HYPRE_DIR:?Environment variable HYPRE_DIR is not set or is empty}"
: "${HDF5_DIR:?Environment variable HDF5_DIR is not set or is empty}"
: "${NETCDF_DIR:?Environment variable NETCDF_DIR is not set or is empty}"

cmake .. \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_POSITION_INDEPENDENT_CODE=YES \
    -DMFEM_USE_OPENMP=NO \
    -DMFEM_THREAD_SAFE=NO \
    -DHYPRE_DIR=$HYPRE_DIR \
    -DMFEM_USE_MPI=YES \
    -DMFEM_USE_METIS=YES \
    -DMFEM_USE_METIS_5=YES \
    -DMETIS_DIR=$HYPRE_DIR \
    -DParMETIS_DIR=$HYPRE_DIR \
    -DMFEM_USE_SUPERLU=YES \
    -DSuperLUDist_DIR=$HYPRE_DIR \
    -DMFEM_USE_NETCDF=YES \
    -DNETCDF_DIR=$NETCDF_DIR \
    -DBUILD_SHARED_LIBS=ON \
    -DHDF5_DIR=$HDF5_DIR \
    -DMFEM_ENABLE_EXAMPLES=yes \
    -DMFEM_ENABLE_MINIAPPS=yes \
    -DCMAKE_INSTALL_PREFIX=`pwd`/../installed
