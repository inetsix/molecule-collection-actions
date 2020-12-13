#!/bin/sh
#
# Purpose: Molecule runner for github-action
# Author: @titom73
# Date: 2020-05-07
# Version: 1.0
# License: BSD
# --------------------------------------

# export MOLECULE_BIN=$(which molecule)
echo "Script running from ${PWD}"

# If user define any requirements file in options, we install them
if [[ -f ${INPUT_PIP_FILE} ]]; then
    echo 'installing custom requirements file ...'
    pip install -r ${INPUT_PIP_FILE}
fi

# Set default value for where to find MOLECULE folder
# chmod 777 -R ${PWD}
cd ${INPUT_MOLECULE_PARENTDIR}
echo "Current working dir: $PWD"

# Run Molecule scenario
echo "Running: molecule ${INPUT_MOLECULE_OPTIONS} ${INPUT_MOLECULE_COMMAND} ${INPUT_MOLECULE_ARGS}"
molecule --version
molecule ${INPUT_MOLECULE_OPTIONS} ${INPUT_MOLECULE_COMMAND} ${INPUT_MOLECULE_ARGS}

# chmod 777 -R ${PWD}

if [ -n ${INPUT_CHECK_GIT} ]; then
    echo "  * Run Git Verifier because CHECK_GIT is set to ${INPUT_CHECK_GIT}"
    # if git diff-index --quiet HEAD --; then
    if [ -n "$(git status --porcelain)" ]; then
        # No changes
        echo 'Some changes'
        echo '------------'
        git --no-pager status --short
        echo ''
        echo 'Diffs are:'
        echo '------------'
        git --no-pager diff
        if [ -n ${INPUT_CHECK_GIT_ENFORCED} ]; then
            exit 1
        else
            exit 0
        fi
    else
        # Changes
        echo 'No change'
        exit 0
    fi
fi