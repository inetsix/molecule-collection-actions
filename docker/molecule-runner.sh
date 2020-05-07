#!/bin/sh
#
# Purpose: Molecule runner for github-action
# Author: @titom73
# Date: 2020-05-06
# Version: 0.1
# License: BSD
# --------------------------------------

# export MOLECULE_BIN=$(which molecule)
echo "Script running from ${PWD}"

# If user define any requirements file in options, we install them
if [[ -f ${INPUT_PIP_FILE} ]]; then
    echo 'installing custom requirements file ...'
    # pip install -r ${INPUT_PIP_FILE}
fi

# Set default value for where to find MOLECULE folder
cd ${INPUT_MOLECULE_PARENTDIR}
echo "Current working dir: $PWD"

# Run Molecule scenario
echo "Running: molecule ${INPUT_MOLECULE_OPTIONS} ${INPUT_MOLECULE_COMMAND} ${INPUT_MOLECULE_ARGS}"
molecule ${INPUT_MOLECULE_OPTIONS} ${INPUT_MOLECULE_COMMAND} ${INPUT_MOLECULE_ARGS}