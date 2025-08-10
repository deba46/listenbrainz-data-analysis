#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/output"
mkdir -p "$OUTPUT_DIR"

notebooks=(
    "notebooks/01_create_tables.ipynb"
    "notebooks/02_data_load_staging.ipynb"
    "notebooks/03_data_merge_prod.ipynb"
    "notebooks/04_bi_queries.ipynb"
)

run_notebook() {
    local nb_path=$1
    local nb_name=$(basename "$nb_path" .ipynb)
    local out_path="$OUTPUT_DIR/${nb_name}_$(date +%F).ipynb"
    
    echo "Running $nb_name..."
    papermill "$SCRIPT_DIR/$nb_path" "$out_path"
    
    if [ $? -ne 0 ]; then
        echo "ERROR: $nb_name failed, aborting.."
        exit 1
    fi
    echo "$nb_name completed successfully.."
}

for nb in "${notebooks[@]}"; do
    run_notebook "$nb"
done

echo "All notebooks ran successfully.."
