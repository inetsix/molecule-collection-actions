#!/bin/bash
#
# Purpose: Molecule runner for github-action
# Author: @titom73
# Date: 2020-05-06
# Version: 0.1
# License: BSD
# --------------------------------------

# export MOLECULE_BIN=$(which molecule)

# # If user define any requirements file in options, we install them
# if [[ -v INPUT_PIP_FILE ]]; then
#     if [[ -f ${INPUT_PIP_FILE} ]]; then
#         pip install -r ${INPUT_PIP_FILE}
#     fi
# fi

cd ${GITHUB_REPOSITORY}
# Set default value for where to find MOLECULE folder
if [[ ! -z INPUT_MOLECULE_PARENT_DIR ]]; then
    cd ${INPUT_MOLECULE_PARENT_DIR}
fi

echo $PWD

# # Run Molecule scenario
# ${MOLECULE_BIN} ${INPUT_MOLECULE_OPTIONS} ${INPUT_MOLECULE_COMMAND} ${INPUT_MOLECULE_ARGS}