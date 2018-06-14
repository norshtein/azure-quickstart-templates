#!/usr/bin/env bash

set -e

export BOSH_LOG_LEVEL="Debug"
export BOSH_LOG_PATH="./run.log"

bosh create-env ~/example_manifests/bosh.yml \
	--state=state.json \
	--vars-store=~/bosh-deployment-vars.yml \
	-o ~/example_manifests/cpi.yml \
	-o ~/example_manifests/custom-cpi-release.yml \
	-o ~/example_manifests/custom-environment.yml \
	-o ~/example_manifests/use-azure-dns.yml \
	-o ~/example_manifests/jumpbox-user.yml \
	-o ~/example_manifests/keep-failed-or-unreachable-vms.yml \
	-v director_name=azure \
	-v internal-cidr=10.0.0.0/24 \
	-v internal_gw=10.0.0.1 \
	-v internal_ip=10.0.0.4 \
	-v cpi_release_url=
