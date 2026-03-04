# Assignment 5, Sierra Lannan, 03/03/2026
## Task 1
### Make sure my assignment 5 directory is how I want it

cd SUPERCOMPUTING/assignments

ls

cd assignment_05

mkdir scripts log

mkdir -p data/{raw,trimmed}

## Task 2

cd scripts

### Created the script

nano 01_download_data.sh

### What I added to my 01_download_data.sh script

#!/bin/bash
set -ueo pipefail

wget https://gzahn.github.io/data/fastq_examples.tar

tar -xf fastq_examples.tar

mv *.fastq.gz /sciclone/home/selannan/SUPERCOMPUTING/assignments/assignment_05/dat>
 
rm fastq_examples.tar

### Added permissions

chmod +x 01_download_data.sh

## Check to make sure everything was moved
cd ../data/raw

ll

## Task 3

### Go to where I want to download 

cd ~/programs

### Grabbed this code from the github instructions which downloads latest release v1.1.0

wget http://opengene.org/fastp/fastp
chmod a+x ./fastp

### I already had the path for programs added to my bashrc from class activities

cd ~/SUPERCOMPUTING/assignments/assignment_05

## Task 4

cd scripts

nano 02_run_fastp.sh 

### What I put in my script

#!/bin/bash
set -ueo pipefail

FWD_IN=${1}

REV_IN=${FWD_IN/_R1_/_R2_}

FWD_OUT=${FWD_IN/.fastq.gz/.trimmed.fastq.gz}

REV_OUT=${REV_IN/.fastq.gz/.trimmed.fastq.gz}

fastp --in1 ${FWD_IN} --in2 ${REV_IN} --out1 ${FWD_OUT/raw/trimmed} --out2 ${REV_OUT/raw/trimmed} --json /dev/null  --html /dev/null --trim_front1 8 --trim_front2 8 --trim_tail1 20 --trim_tail2 20 --n_base_limit 0 --length_required 100 --average_qual 20

### Tried it on some data 

./02_run_fastp.sh ../data/raw/6083_189_S189_R1_001.subset.fastq.gz

cd ../data/trimmed

ll

## Task 5

cd ~/SUPERCOMPUTING/assignments/assignment_05

nano pipeline.sh

### What is in my pipeline.sh

#!/bin/bash

set -ueo pipefail

echo "Downloading the data"

./scripts/01_download_data.sh

echo "Using fastp on the downloaded data" 

for i in ./data/raw/*_R1_*;do ./scripts/02_run_fastp.sh $i;done

### Adding permissions

chmod +x pipeline.sh


## Task 6

### Ran this in both the raw and trimmed directories in data to remove the files I downloaded

rm *.fastq.gz

### Testing

./pipeline.sh

## Task 7 Reflection
I think this assignment went a lot smoother than the last one in terms of writing the scripts. I think I have gotten better with this due to our class practices. I also feel like I did a better job of slowly documenting the steps I took in my README.md as I did them rather than having to go back and add everything at the end and try to remember what I did multiple days ago. I need to get rid of the habit of adding spaces around my = because that caused me some issues during this assignment. Creating two different scripts and then calling them in the pipeline helps separate the files responsibilities and possibly make debugging easier later. The pipeline then gives us one way to complete these processes without having to manually run multiple commands. 

### How to run the pipeline

After making sure it is executable (chmod +x), you are able to run the pipeline and it will download and extract the FASTQ data. It will then process a single sample's paired reads. 

For this to run properly it is important to have a data directory that includes both a raw and clean subdirectory. When executing the pipeline, it is also useful to have a scripts directory where the scripts called in the pipeline are stored. Having fastp installed is also important.

This pipeline helps download and extract data while also processing paired reads for more than one sample. 
