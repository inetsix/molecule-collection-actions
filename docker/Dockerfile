# FROM python:3.7-alpine
FROM avdteam/base:3.6

LABEL "maintainer"="Thomas Grimonet <thomas.grimonet@gmail.com>"
LABEL "repository"="https://github.com/titom73/molecule-collection-actions"
LABEL "homepage"="https://github.com/titom73/molecule-collection-actions"

LABEL "com.github.actions.name"="molecule"
LABEL "com.github.actions.description"="Run Ansible Molecule"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="green"

USER avd

ADD molecule-runner.sh /home/avd/molecule-runner.sh

WORKDIR /projects
VOLUME ["/projects"]

# ENTRYPOINT ["sh","-c",'/root/molecule-runner.sh']
CMD ["sh", "/home/avd/molecule-runner.sh"]