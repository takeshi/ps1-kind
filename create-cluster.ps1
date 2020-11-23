$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

kind create cluster --config $scriptDir\kind.yaml


$node = kind get nodes
kubectl annotate node $node "kind.x-k8s.io/registry=localhost:5000"
