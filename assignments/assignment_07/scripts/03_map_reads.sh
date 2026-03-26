#!/bin/bash

set -ueo pipefail

echo "Mapping forward read files"

for FWD in ./data/clean/*_1_clean.fastq; do REV="${FWD/_1_clean.fastq/_2_clean.fastq}"

bbmap.sh ref=./data/dog_reference/dog_reference_genome.fna in1=$FWD in2=$REV out=./output/$(basename $FWD).sam minid=0.95;done

echo "Finding what matches dog genome"

for SAM in ./output/*.sam; do samtools view -F 4 $SAM > "${SAM%.sam}_dog-matches.sam";done

