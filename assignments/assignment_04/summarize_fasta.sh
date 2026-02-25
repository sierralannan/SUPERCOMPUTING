#!/bin/bash

fasta_file=${1}

total_seq=$(seqtk size ${fasta_file} | cut -f1)

total_nucleo=$(seqtk size ${fasta_file} | cut -f2)

table=$(seqtk comp ${fasta_file} | cut -f1,2)

echo "${fasta_file}"

echo "Total sequences: ${total_seq}"

echo "Total nucleotides: ${total_nucleo}"

echo -e "Table of Sequence Names and Lengths:\n${table}"  
