FROM python:3.7-alpine

LABEL "maintainer"="Thomas Grimonet <thomas.grimonet@gmail.com>"
LABEL "repository"="https://github.com/titom73/molecule-collection-actions"
LABEL "homepage"="https://github.com/titom73/molecule-collection-actions"

LABEL "com.github.actions.name"="molecule"
LABEL "com.github.actions.description"="Run Ansible Molecule"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="green"

ARG BUILD_DEPS="\
    gcc \
    libc-dev \
    make \
    musl-dev \
    libffi-dev \
    openssl-dev \
    "
ARG PACKAGES="\
    docker \
    git \
    openssh-client \
    "
ARG PIP_INSTALL_ARGS="\
    --no-cache-dir \
    "

ARG PIP_MODULES="\
    netaddr \
    treelib \
    "

ARG MOLECULE_EXTRAS="docker"

ADD ./molecule-runner.sh /root/

RUN apk add --update --no-cache ${BUILD_DEPS} ${PACKAGES} && \
    pip install ${PIP_INSTALL_ARGS} ${PIP_MODULES} "molecule[${MOLECULE_EXTRAS}]" && \
    apk del --no-cache ${BUILD_DEPS} && \
    rm -rf /root/.cache

CMD ['/root/molecule-runner.sh']