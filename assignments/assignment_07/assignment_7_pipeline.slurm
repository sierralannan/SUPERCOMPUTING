#!/bin/bash
#SBATCH --job-name=assignment_7
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=20 
#SBATCH --time=1-00:00:00 
#SBATCH --mem=120G 
#SBATCH --mail-type=FAIL,BEGIN,END
#SBATCH --mail-user=selannan@wm.edu 
#SBATCH -o /sciclone/home/selannan/SUPERCOMPUTING/assignments/assignment_07/output/assignment_7_%j.out 
#SBATCH -e /sciclone/home/selannan/SUPERCOMPUTING/assignments/assignment_07/output/assignment_7_%j.err 

set -ueo pipefail

./scripts/01_download_data.sh

./scripts/02_clean_read.sh

./scripts/03_map_reads.sh
