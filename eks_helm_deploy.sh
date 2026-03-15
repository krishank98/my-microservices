#!/bin/bash

helm upgrade --install myapp ./k8s/myapp -f ./k8s/myapp/values-eks.yaml --namespace my-micro-dev --create-namespace

