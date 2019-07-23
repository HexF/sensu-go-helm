#!/bin/bash

# Test basic helm syntax
helm lint helm-chart/*/

# Test Kubernetes manifest syntaxes
rm -rf manifests
mkdir -p manifests
helm template helm-chart/* --output-dir manifests
kubeval manifests/*/templates/*.yaml

# Unit-test the chart 
helm unittest -u helm-chart/*/
