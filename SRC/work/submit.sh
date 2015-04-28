#!/bin/bash -l

# Batch script to run an MPI parallel job on Legion with the upgraded software
# stack under SGE with OpenMPI.

# 1. Force bash as the executing shell.
#$ -S /bin/bash

# 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=0:10:0

# 3. Request 1 gigabyte of RAM per process.
#$ -l mem=1G

# 4. Set the name of the job.
#$ -N RHPC-Tutorial

# 5. Select the OpenMPI parallel environment and 6 processes.
#$ -pe openmpi 4

#$ -P Training

# 6. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
# Replace "<your_UCL_id>" with your UCL user ID :)
#$ -wd /home/coursa0/Scratch/rhpc_tutorial/SRC/work

# 7. Load the necessary modules
module unload compilers mpi mkl
module load compilers/gnu/4.9.2
module load hdf/5-1.8.7/gnu.4.6.3
module load curl/7.21.3/gnu.4.6.3
module load netcdf/4.2.1.1/gnu.4.6.3
module load netcdf-cxx/4.2/gnu.4.6.3
module load mpi/openmpi/1.6.5/gnu.4.6.3
module load python/enthought/7.3-2_2013-10-04
module load boost/1.54.0/openmpi/gnu.4.6.3
module load repast-hpc/2.2-dev

# 8. Run our MPI job.  GERun is a wrapper that launches MPI jobs on Legion  
# This assumes the .props files have been copied to your working directory.
#echo $1 $2 $3 $4
gerun $1 $2 $3
