#!/bin/bash

set -ueo pipefail

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
