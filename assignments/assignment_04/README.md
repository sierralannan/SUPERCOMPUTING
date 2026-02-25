# Assignment 4, Sierra Lannan, February 24, 2026

## Task 1
### Log into Bora

bora

### Checked to make sure I already made the programs directory (I already have)

ls

## Task 2

### Going into my programs directory and getting the data, then unpacking it and removing the downloaded tarball once extracted

cd programs

wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64.tar.gz

tar -xzvf gh_2.74.2_linux_amd64.tar.gz

rm gh_2.74.2_linux_amd64.tar.gz

## Task 3

### Creating install_gh if it doesn't already exist and opening it to add my code

nano install_gh.sh

### This is the code I added to the inside of the install_gh.sh file

#!/bin/bash

cd /sciclone/home/selannan/programs 

wget https://github.com/cli/cli/releases/download/v2.74.2/gh_2.74.2_linux_amd64.tar.gz

tar -xzvf gh_2.74.2_linux_amd64.tar.gz

rm gh_2.74.2_linux_amd64.tar.gz

### Making sure it has correct permissions

chmod +x install_gh.sh

### Removing the old downloaded files to test if my script works

rm -rf gh_2.74.2_linux_amd64

### Testing the script and checking if it worked

./install_gh.sh

ls

## Task 4

### Go back to home and go into the .bashrc file

cd ~

nano .bashrc

### The line of code I added to my .bashrc

export PATH=$PATH:/sciclone/home/selannan/programs/gh_2.74.2_linux_amd64/bin

### What I ran when I exited editing the .bashrc

source ~/.bashrc

## Task 5

### Logged in using my authentication token

gh auth login

## Task 6

cd programs

nano install_seqtk.sh 

### Code inside of install_seqtk.sh

#!/bin/bash

cd /sciclone/home/selannan/programs

git clone https://github.com/lh3/seqtk.git;
cd seqtk; make

echo 'export PATH=$PATH:/sciclone/home/selannan/programs/seqtk' >> ~/.bashrc

### Adding permissions

chmod +x install_seqtk.sh

### Trying to see if the script worked

./install_seqtk.sh

source ~/.bashrc

ls

## Task 7

### Figuring out seqtk by using data from previous assignment

### Converted to single-line fasta

seqtk seq -l 0 ~/SUPERCOMPUTING/assignments/assignment_03/data/GCF_000001735.4_TAIR10.1_genomic.fna > single_line.fasta

### Getting basic composition statistics

seqtk comp ~/SUPERCOMPUTING/assignments/assignment_03/data/GCF_000001735.4_TAIR10.1_genomic.fna

## Task 8

### Go to my assignment 4 directory

cd ~/SUPERCOMPUTING/assignments/assignment_04

nano summarize_fasta.sh

### Here is what I added in the summarize_fasta.sh

#!/bin/bash

fasta_file=${1}

total_seq=$(seqtk size ${fasta_file} | cut -f1)

total_nucleo=$(seqtk size ${fasta_file} | cut -f2)

table=$(seqtk comp ${fasta_file} | cut -f1,2)

echo "${fasta_file}"

echo "Total sequences: ${total_seq}"

echo "Total nucleotides: ${total_nucleo}"

echo -e "Table of Sequence Names and Lengths:\n${table}"  

### Testing on data from assignment 3

./summarize_fasta.sh ~/SUPERCOMPUTING/assignments/assignment_03/data/GCF_000001735.4_TAIR10.1_genomic.fna

## Task 9

### Go to assignment 3 to get data

cd ~/SUPERCOMPUTING/assignments/assignment_03/data

### Make copies of the data so I have 3 files

cp GCF_000001735.4_TAIR10.1_genomic.fna GCF_000001735.4_TAIR10.1_genomic_copy1.fna

cp GCF_000001735.4_TAIR10.1_genomic.fna GCF_000001735.4_TAIR10.1_genomic_copy2.fna

cp GCF_000001735.4_TAIR10.1_genomic.fna GCF_000001735.4_TAIR10.1_genomic_copy3.fna

### Move it to the assignment 4 directory 

mv GCF_000001735.4_TAIR10.1_genomic_copy{1,2,3}.fna ../../assignment_04/data     

cd ../../assignment_04

### For loop to run it on the three files

for file in ./data/*.fna; do ./summarize_fasta.sh "$file"; done

## Task 10 - Reflection

I think one of the hardest challenges to overcome was figuring out the whole: echo 'export PATH=$PATH:/sciclone/home/selannan/programs/seqtk' >> ~/.bashrc

This was hard for me because I feel like so far we have been using pretty simple and straight forward tools like grep, cd, mv, etc., but figuring out how to wrap my brain around PATH=$PATH took a little bit more time. I also tried to get more practice using relative paths in this assignment (such as with cd ../../assignment_04). In past assignments I got feedback about how I tended to just use cd .. a bunch of times to get where I wanted to go.

This assignment gave me good practice with writing scripts which is something I have less practice with. I think this was a great learning oppurtunity and challenged my understanding.

$PATH allows us to run programs from anywhere in the terminal without typing the full path, makes things easier for us!
