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
