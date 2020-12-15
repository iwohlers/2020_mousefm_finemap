#!/bin/bash

echo "GENERATING AND ACTIVATING BIOCONDA WORKFLOW ENVIRONMENT..."
export PATH="/scratch/programs/miniconda3/bin:$PATH"
if [ ! -d /scratch/programs/miniconda3/envs/workflow_2020_population_genetics ]; then
    conda env create -n workflow_2020_population_genetics --file environment.yaml
fi
source activate workflow_2020_population_genetics

echo "RUNNING SNAKEMAKE WORKFLOW..."

snakemake -j 10 --rerun-incomplete -p -k --use-conda number_finemapped_all

# If environment.yaml has been changed, the existing environment needs to be removed 
# in order to re-generate the environment using: 
# source ~/.bashrc; conda env remove -n workflow_2020_population_genetics

