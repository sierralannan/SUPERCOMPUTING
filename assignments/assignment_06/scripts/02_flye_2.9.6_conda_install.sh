#!/bin/bash

set -ueo pipefail

module load miniforge3

source /sciclone/apps/miniforge3-24.9.2-0/etc/profile.d/conda.sh

mamba create -y -n flye-env -c bioconda

## Activating the environment
conda activate flye-env

## Testing out what I did
flye -v 

## Exporting environment
conda env export --no-builds > ./flye-env.yml

## Deactivating environment
conda deactivate



