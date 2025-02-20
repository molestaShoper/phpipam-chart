#!/usr/bin/env sh
set -e

helm package --destination packages charts/*
helm repo index --url https://molestashoper.github.io/phpipam-chart/ .
