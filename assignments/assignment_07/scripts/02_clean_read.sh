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
