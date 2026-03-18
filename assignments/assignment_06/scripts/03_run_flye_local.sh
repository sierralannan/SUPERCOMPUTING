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
