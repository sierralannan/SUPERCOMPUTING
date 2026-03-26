
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
