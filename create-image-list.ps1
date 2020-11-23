
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 動作中のPODのimageの一覧を取得する
kubectl get pod -o json | jq -r .items[].spec.containers[].image > $scriptDir\images.txt
