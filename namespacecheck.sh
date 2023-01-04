#!/bin/bash

namespaceStatus=$(kubectl get ns $1 -o json | jq .status.phase -r)
if [ $namespaceStatus == "Active" ]
then
    echo "namespace is present"
else
   kubectl create namespace $1
fi
