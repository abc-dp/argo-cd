#!/bin/bash
set -eux -o pipefail

apt-get update && \
  apt-get install -y curl awscli gnupg jq procps&& \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

BIN=/usr/local/bin

CURL_WITH_ARGS="curl -sSL --fail"
TAR_WITH_ARGS="tar zxf - -C ${BIN}"

SOPS_VERSION=v3.6.1
${CURL_WITH_ARGS} -o ${BIN}/sops https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux
chmod +x ${BIN}/sops

HELMFILE_VERSION=v0.139.7
${CURL_WITH_ARGS} -o ${BIN}/helmfile https://github.com/roboll/helmfile/releases/download/${HELMFILE_VERSION}/helmfile_linux_amd64
chmod +x ${BIN}/helmfile

CUE_VERSION=v0.4.0
${CURL_WITH_ARGS} https://github.com/cuelang/cue/releases/download/${CUE_VERSION}/cue_${CUE_VERSION}_linux_amd64.tar.gz | ${TAR_WITH_ARGS} cue

YQ_VERSION=2.12.0
pip3 install yq==${YQ_VERSION}
