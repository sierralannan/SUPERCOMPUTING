#!/bin/bash

set -ueo pipefail

echo "Downloading the data"

./scripts/01_download_data.sh

echo "Using fastp on data in ./data/raw" 

for i in ./data/raw/*_R1_*;do ./scripts/02_run_fastp.sh $i;done
