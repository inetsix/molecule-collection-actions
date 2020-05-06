# molecule-collection-actions

First GitHub action allows you to run Molecule to test Ansible role.

## Inputs

```yaml
---
  molecule_parentdir:
    description: Relative path where your molecule folder is.
    required: no

  molecule_options:
    description: |
      Options:
        --debug / --no-debug    Enable or disable debug mode. Default is disabled.
        -c, --base-config TEXT  Path to a base config.  If provided Molecule will
                                load this config first, and deep merge each
                                scenario's molecule.yml on top.
                                (/home/gofrolist/.config/molecule/config.yml)
        -e, --env-file TEXT     The file to read variables from when rendering
                                molecule.yml. (.env.yml)
        --version               Show the version and exit.
        --help                  Show this message and exit.
    required: false

  molecule_command:
    description: |
      Commands:
        check        Use the provisioner to perform a Dry-Run...
        cleanup      Use the provisioner to cleanup any changes...
        converge     Use the provisioner to configure instances...
        create       Use the provisioner to start the instances.
        dependency   Manage the role's dependencies.
        destroy      Use the provisioner to destroy the instances.
        idempotence  Use the provisioner to configure the...
        init         Initialize a new role or scenario.
        lint         Lint the role.
        list         Lists status of instances.
        login        Log in to one instance.
        matrix       List matrix of steps used to test instances.
        prepare      Use the provisioner to prepare the instances...
        side-effect  Use the provisioner to perform side-effects...
        syntax       Use the provisioner to syntax check the role.
        test         Test (lint, cleanup, destroy, dependency,...
        verify       Run automated tests against instances.
    required: true
    default: 'test'

  molecule_args:
    description: |
      Arguments:
        --scenario-name foo  Targeting a specific scenario.
        --driver-name foo    Targeting a specific driver.
        --all                Target all scenarios.
        --destroy=always     Always destroy instances at the conclusion of a Molecule run.
    required: false

  pip_file:
    description: |
      Relative path from `${GITHUB_REPOSITORY}` to install
      any requirements prior to run molecule
    required: false

```

## Usage

To use the action simply create an main.yml (or choose custom *.yml name) in the .github/workflows/ directory.
Basic example:

```yaml
on: push

jobs:
  molecule:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          path: "${{ github.repository }}"
      - uses: titom73/molecule-collection-actions@master
```

NOTE: the checkout action needs to place the file in ${{ github.repository }} in order for Molecule to find your role.
