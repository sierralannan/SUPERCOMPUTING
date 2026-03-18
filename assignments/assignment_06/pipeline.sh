#!/bin/bash

set -ueo pipefail

echo "Downloading Data"

./scripts/01_download_data.sh

echo "Local Build"

./scripts/02_flye_2.9.6_manual_build.sh

echo "Conda Build"

./scripts/02_flye_2.9.6_conda_install.sh

echo "Running Flye with Conda"

./scripts/03_run_flye_conda.sh

echo "Running Flye with module"

./scripts/03_run_flye_module.sh

echo "Running Flye with local"

./scripts/03_run_flye_local.sh

for i in ./assemblies/assembly_*; do
	echo "${i} log : "
	tail -n 10 ${i}/*.log
	echo
done

echo "Done"
