#!/bin/bash

# setup working directory
[ -z "$1" ] || [ ! -d "$1" ] && {
    echo "No working directory or directory does not exist."
    exit 1
}
workdir="$( readlink -f "$1" )"

# setup docker hub
cd "$( dirname "$( readlink -f "$0" )" )"
imagetag="basti-tee/texlive:latest"
docker build -t $imagetag - < Dockerfile
clear

# check if image was previously started
cid=$( docker ps -a | grep "$imagetag" | awk '{ print $1 }' )
[ ! -z "$cid" ] && {
    docker start -i "$cid"
} || {
    docker run -ti -v ${workdir}:/workdir $imagetag bash
}
