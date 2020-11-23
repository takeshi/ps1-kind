docker inspect -f '{{.State.Running}}' kind-registry | Out-Null

if($LastExitCode -eq 1){
    echo "create kind-registry"
    docker run -d --restart=always -p "5000:5000" --name kind-registry registry:2
    docker network connect "kind" "kind-registry"
    exit 0
}

$repo = $(docker inspect -f '{{.State.Running}}' kind-registry)

if($repo -eq "false"){
    echo "restart kind-registry"
    docker restart kind-registry
}
