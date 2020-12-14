# FROM python:3.7-alpine
FROM avdteam/base:3.6

LABEL "maintainer"="Thomas Grimonet <thomas.grimonet@gmail.com>"
LABEL "repository"="https://github.com/titom73/molecule-collection-actions"
LABEL "homepage"="https://github.com/titom73/molecule-collection-actions"

LABEL "com.github.actions.name"="molecule"
LABEL "com.github.actions.description"="Run Ansible Molecule"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="green"

USER root

ADD molecule-runner.sh /bin/molecule-runner.sh

RUN cp -r /home/avd/.local /root/ && \
    echo "export PATH=$(echo "$PATH" | sed -e 's/:\/home\/avd\/.local\/bin//'):/root/.local/bin" >> $HOME/.bashrc

ENTRYPOINT ["sh", "-c", "/bin/molecule-runner.sh"]