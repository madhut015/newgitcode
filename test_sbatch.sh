#!/bin/bash
#SBATCH --job-name=python_test       # Job name
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=mthiruvenkadam@mines.edu     # Where to send mail      
#SBATCH --ntasks=1                    # Run on a single CPU
##SBATCH --gres=gpu                   # We need a GPU for Tensorflow
##SBATCH -w, --nodelist=g005,c026,c028
#SBATCH --mem=32gb                     # Job memory request
#SBATCH --time=03:30:00               # Time limit hrs:min:sec
#SBATCH --output=python_test_%j.log   # Standard output and error log
#SBATCH -p gpu                  # run only in "gpu" nodes
pwd; hostname; date
module purge
module add apps/python3
module add libs/cuda/10.1
source activate tf37

cd ~/gitcode
srun -N 1 -p gpu python another_file.py

echo "**** Done ****"

# srun python python01.py
# srun -N 1 -p gpu echo "Test in " `hostname`
# srun -N 1 -p gpu ls -la
