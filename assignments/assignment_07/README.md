# Assignment 7, Sierra Lannan, 03/24/2026

## Task 1

bora

cd SUPERCOMPUTING/assignments/assignment_07

### Setting up directory structure 

mkdir -p data/raw data/clean data/dog_reference output scripts

ll

cd data 

ll

cd ..

## Task 2

### Downloaded the data and moved to the HPC using FileZilla

cd scripts

### Documenting my search string

Search string: metagenome AND WGS AND ILLUMINA 

Number of accessions selected: 10

Metadata file: ~/SUPERCOMPUTING/assignments/assignment_7/data/SraRunTableSmall.csv

### Making the first script

nano 01_download_data.sh 

### What's inside my script

#!/bin/bash

set -ueo pipefail

module load sratools/3.2.1

Metadata=./data/SraRunTableSmall.csv

echo "Downloading SRA runs"

cut -d',' -f1 ./data/SraRunTableSmall.csv | tail -n +2 > ./data/accession_ids.txt

for run in $(cat data/accession_ids.txt); do
    echo "Downloading ${run}"
    fasterq-dump "${run}" -O data/raw
done

datasets download genome taxon "Canis lupus familiaris" --reference --filename ./data/dog_reference/dog.zip

unzip ./data/dog_reference/dog.zip -d ./data/dog_reference

mv ./data/dog_reference/ncbi_dataset/data/GCF_011100685.1/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna ./data/dog_reference/dog_reference_genome.fna

rm -rf ./data/dog_reference/ncbi_dataset/ ./data/dog_reference/README.md ./data/dog_reference/dog.zip ./data/dog_reference/md5sum.txt

echo "Complete"

### End of script

chmod +x 01_download_data.sh 

## Task 3

nano 02_clean_read.sh

### What's inside my script

#!/bin/bash

set -ueo pipefail

echo "Cleaning up raw reads"

for FWD_IN  in ./data/raw/*_1.fastq; do
    REV_IN=${FWD_IN/_1.fastq/_2.fastq} 
    FWD_OUT=${FWD_IN/.fastq/_clean.fastq}
    REV_OUT=${REV_IN/.fastq/_clean.fastq}
    fastp --in1 ${FWD_IN} --in2 ${REV_IN} --out1 ${FWD_OUT} --out2 ${REV_OUT} --json /dev/null --html /dev/null
done

echo "Moving to clean directory"

mv ./data/raw/*_clean.fastq ./data/clean

echo "Complete"

### End of script

chmod +x 02_clean_read.sh

## Task 4 & 5

nano 03_map_reads.sh

### What's inside my script

#!/bin/bash

set -ueo pipefail

echo "Mapping forward read files"

for FWD in ./data/clean/*_1_clean.fastq; do REV="${FWD/_1_clean.fastq/_2_clean.fastq}"

bbmap.sh ref=./data/dog_reference/dog_reference_genome.fna in1=$FWD in2=$REV out=./output/$(basename $FWD).sam minid=0.95;done

echo "Finding what matches dog genome"

for SAM in ./output/*.sam; do samtools view -F 4 $SAM > "${SAM%.sam}_dog-matches.sam";done

### End of script

chmod +x 03_map_reads.sh

## Task 6

cd ..

nano assignment_7_pipeline.slurm

### What's inside my script

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

### End of script

chmod + x assignment_7_pipeline.slurm

sbatch assignment_7_pipeline.slurm

## Task 7

### Inspected my err files when I got an error code and fixed the code in my README.md and scripts

## Task 8

cd output

### The code I ran to make the table

for f in *.fastq.sam; do
  echo "Processing $f..."
  base=$(basename "$f" .sam)
  total=$(grep -vc "^@" "$f")
  mapped=$(grep -vc "^@" "${base}_dog-matches.sam")
  echo -e "${base}\t${total}\t${mapped}" >> dog_table.txt
done

### Adding the headers

(echo -e "Sample_IDs\tTotal_Reads\tDog_Mapped_Reads"; cat dog_table.txt) > dog_table_with_header.txt

cat dog_table_with_header.txt

### What my table was

Sample_IDs	Total_Reads	Dog_Mapped_Reads
SRR37446607_1_clean.fastq	27062614	4527
SRR37446609_1_clean.fastq	28875984	5734
SRR37446610_1_clean.fastq	28577192	5882
SRR37446613_1_clean.fastq	28167246	5573
SRR37446615_1_clean.fastq	29054714	5910
SRR37446616_1_clean.fastq	28133880	6946
SRR37446617_1_clean.fastq	28175574	6096
SRR37446618_1_clean.fastq	26139038	5486
SRR37446620_1_clean.fastq	27343030	6974
SRR37446627_1_clean.fastq	27063600	5861

## Task 9

### How to run the pipeline
This pipeline is made to download metagenome data and then compare it to the dog reference genome to see if the samples have been contaminated. The pipeline has three seperate scripts, the first being the script that downloads the raw data. The second script cleans the reads, followed by the third script which compares it to the dog samples. To run these three script, you simply run ./assignment_7_pipeline.slurm which will submit the process of running these three scripts to slurm. This will work as long as you have set up the needed directory structure and have tools like bbmap and samtools set up. 

### Reflection
I think the hardest part of this assignment I had to overcome was how long it took for the task to run on slurm. I did not realize just how long this would take the first time, so it was frustrating to have it run for hours only to discover there was an error so it failed in the end. I think this really emphasized to me how important it is to start tasks like these ahead of time since it can be a very lengthy process. I also think this assignment challenged me due to my lack of biology experience, so it was interesting to explore the website where we downloaded the sequence data. 
