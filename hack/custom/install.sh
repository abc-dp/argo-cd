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

HELMFILE_VERSION=0.138.4-3-g90de61a
HELMFILE_RELEASE=https://github.com/yujunz/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_Linux_x86_64.tar.gz
${CURL_WITH_ARGS} ${HELMFILE_RELEASE} | ${TAR_WITH_ARGS} helmfile

CUE_VERSION=v0.4.0
${CURL_WITH_ARGS} https://github.com/cuelang/cue/releases/download/${CUE_VERSION}/cue_${CUE_VERSION}_linux_amd64.tar.gz | ${TAR_WITH_ARGS} cue

YQ_VERSION=2.12.0
pip3 install yq==${YQ_VERSION}
