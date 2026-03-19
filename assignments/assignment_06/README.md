# Assignment 6, Sierra Lannan, 03/18/2026

## Task 1

### Making sure I have the correct directory structure (I already had made assignment 6 directory and README.md)

bora

cd SUPERCOMPUTING/assignments

ll

cd assignment_06

ll

mkdir assemblies scripts data

cd assemblies

mkdir assembly_conda assembly_local assembly_module

cd ..

## Task 2

### Getting the data and making a script to do so

cd scripts

nano 01_download_data.sh

### This is what is inside the script

#!/bin/bash 

set -ueo pipefail

cd ./data

wget https://zenodo.org/records/15730819/files/SRR33939694.fastq.gz

### Making it executable

chmod +x 01_download_data.sh

### Trying to run it 

./01_download_data.sh

cd ../data

ll

cd ../scripts

## Task 3

nano 02_flye_2.9.6_manual_build.sh

### What is inside this script

#!/bin/bash

set -ueo

cd ~/programs

if [ ! -d Flye ]; then
    git clone https://github.com/fenderglass/Flye.git
else
    echo "Flye folder already exists, skipping clone"
fi

cd Flye

make

### Making sure it's executable

chmod +x 02_flye_2.9.6_manual_build.sh

### Going back to assignment 6 directory

cd ..

### Running it 

./scripts/02_flye_2.9.6_manual_build.sh

### Getting the path

cd ~/programs/Flye/bin

pwd

echo "export PATH=$PATH:/sciclone/home/selannan/programs/Flye/bin" >> ~/.bashrc

source ~/.bashrc

### Testing it out

cd ~

cd SUPERCOMPUTING/assignments/assignment_06

flye -v

## Task 4

cd scripts

nano 02_flye_2.9.6_conda_install.sh

### What is inside my script

#!/bin/bash

set -ueo pipefail

module load miniforge3

source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh

mamba create -y -n flye-env -c bioconda

#### Activating the environment
conda activate flye-env

#### Testing out what I did
flye -v 

#### Exporting environment
conda env export --no-builds > ./flye-env.yml

#### Deactivating environment
conda deactivate 

### Adding permissions and trying it out

chmod +x 02_flye_2.9.6_conda_install.sh

./02_flye_2.9.6_conda_install.sh

cd ..

ll

cat flye-env.yml

## Task 5

flye --help

### Practicing using Flye

flye \
  --nano-raw ./data/SRR33939694.fastq.gz \
  --out-dir output \
  --threads 6 \
  --genome-size 40k \
  --meta

### Looking at the output

cd output

ll

cd ..

## Task 6

cd scripts

nano 03_run_flye_conda.sh

### What's in the Part A script

#!/bin/bash

set -ueo pipefail

cd .. 

module load miniforge3

source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh

conda activate flye-env

flye --nano-hq ./data/SRR33939694.fastq.gz \
     --out-dir ./assemblies/assembly_conda \
     --threads 6 \
     --genome-size 50k \
     --meta > "./assemblies/assembly_conda/conda_flye.log" 2>&1

mv "./assemblies/assembly_conda/assembly.fasta" "./assemblies/assembly_conda/conda_assembly.fasta"

rm -r ./assemblies/assembly_conda/*-*

rm ./assemblies/assembly_conda/assembly_graph.*

rm ./assemblies/assembly_conda/assembly_info.txt

rm ./assemblies/assembly_conda/flye.log     

rm ./assemblies/assembly_conda/*.json

conda deactivate 

### Trying it out 

chmod +x 03_run_flye_conda.sh

cd ..

./scripts/03_run_flye_conda.sh

cd assemblies/assembly_conda

ll

cd ../../scripts

nano 03_run_flye_module.sh

### What's in the Part B script

#!/bin/bash

set -ueo pipefail

module load Flye/gcc-11.4.1/2.9.6

flye --nano-hq ./data/SRR33939694.fastq.gz \
     --out-dir ./assemblies/assembly_module \
     --threads 6 \
     --genome-size 50k \
     --meta > "./assemblies/assembly_module/module_flye.log" 2>&1

mv "./assemblies/assembly_module/assembly.fasta" "./assemblies/assembly_module/module_assembly.fasta"

rm -r ./assemblies/assembly_module/*-*

rm ./assemblies/assembly_module/assembly_graph.*

rm ./assemblies/assembly_module/assembly_info.txt

rm ./assemblies/assembly_module/flye.log     

rm ./assemblies/assembly_module/*.json 

### Trying it out

chmod +x 03_run_flye_module.sh

cd ..

./scripts/03_run_flye_module.sh

cd assemblies/assembly_module

ll

cd ../../scripts

nano 03_run_flye_local.sh

### What's in the Part C script

#!/bin/bash

set -ueo pipefail

export PATH=$HOME/programs/Flye/bin:$PATH

flye --nano-hq ./data/SRR33939694.fastq.gz \
     --out-dir ./assemblies/assembly_local \
     --threads 6 \
     --genome-size 50k \
     --meta > "./assemblies/assembly_local/local_flye.log" 2>&1

mv "./assemblies/assembly_local/assembly.fasta" "./assemblies/assembly_local/local_assembly.fasta"

rm -r ./assemblies/assembly_local/*-*

rm ./assemblies/assembly_local/assembly_graph.*

rm ./assemblies/assembly_local/assembly_info.txt

rm ./assemblies/assembly_local/flye.log     

rm ./assemblies/assembly_local/*.json 

### Checking 

chmod +x 03_run_flye_local.sh

cd ..

./scripts/03_run_flye_local.sh

cd assemblies/assembly_local

ll

## Task 7 and 8

cd ../..

nano pipeline.sh

### Code in pipeline script

#!/bin/bash

set -ueo pipefail

echo "Downloading Data"

./scripts/01_download_data.sh

echo "Local Build"

./scripts/02_flye_2.9.6_manual_build.sh

echo "Conda Build"

./scripts/02_flye_2.9.6_conda_install.sh

echo "Running Flye with Conda"

./scripts/03_run_flye_conda.sh

echo "Running Flye with module"

./scripts/03_run_flye_module.sh

echo "Running Flye with local"

./scripts/03_run_flye_local.sh

for i in ./assemblies/assembly_*; do
        echo "${i} log : "
        tail -n 10 ${i}/*.log
        echo
done

echo "Done"

## Task 9

### Went through and removed everything and ran the pipeline

chmod +x pipeline.sh

./pipeline.sh

## Task 10

This pipeline will start by downloading data from Oxford Nanopore Technologies of E. coli phages. It will put this in the data directory for assignment_06. Then it will use Flye, a tool for assembling ONT reads into contigs and genomes. Our script handles cloning and building. Our script will set up the environment and run Flye 3 different ways, conda environment, local build, and module environment. Along the way, it also makes sure to clean up the directory so we only keep the files we need. At the end, the script compares the last 10 lines of each of the three ways. The environment is documented by exporting a yml file of all the dependencies and versions. 

To run this pipeline, navigate to the assignment_06 directory and run ./pipeline.sh which will use all of the scripts in the script directory of assignment_06. 

I think the biggest challenge I faced with this assignment was that I didn't realize how time consuming it would be. Our other assignments have definitely challeneged me in my thinking, but because we had to create so many little scripts for this assignment, it took me a lot longer than I thought. I think I did a good job at documenting as I went which helped when I was trying to remember what each script did as I wrote the pipeline script. I think I like module load best because it appeared to be pretty simple, but I think I need more practice with them to decide my favorite method. 
