brew install docker
brew install docker-machine
brew install docker-machine-nfs
# Compose is a tool for defining and running multi-container Docker applications
brew install docker-compose
# Boot2Docker is a lightweight Linux distribution made specifically to run Docker containers
curl -Lo ~/.docker/machine/cache/boot2docker.iso https://github.com/boot2docker/boot2docker/releases/download/v1.13.0/boot2docker.iso
# Create the VM
docker-machine create --driver virtualbox default
# Connect docker client and Docker Engine to the new created virtual Machine
# https://medium.com/@TomKeur/install-docker-on-mac-os-x-10-11-x-794c4153dc62#.73sru1ema
docker-machine env default
# Configure your shell to use the new created Virtual Machine
eval $(docker-machine env default)
# Get the IP address from the machine
docker-machine ip default

docker run hello-world
# Activate NFS for the "default" VM
docker-machine-nfs default
# Configure the /Users/nicolasmignard/Projects folder with NFS and the options "-alldirs -maproot=nicolasmignard"
docker-machine-nfs default --shared-folder=/Users/nicolasmignard/Projects --nfs-config="-alldirs -maproot=nicolasmignard"

-> pour monter les dossiers partagés

ln -s overblog/projects/achievement OverblogAchievement
ln -s overblog/projects/admin-client AdminClient
ln -s overblog/projects/comment OverblogComment
ln -s overblog/projects/core OverblogCore
ln -s overblog/projects/dev-center OverblogDevCenter
ln -s overblog/projects/graph OverblogGraph
ln -s overblog/projects/site OverblogSite
ln -s overblog/projects/stat OverblogStat
ln -s overblog/projects/super-admin OverblogSuperAdmin
ln -s overblog/projects/user OverblogUser

Télécharger https://drive.google.com/open?id=0B-iLTiZ0W0_FMTNZd2xtajNpWE0 et le mettre au même niveau que /Docker
tar -xjf ssl.tar.bz

export DOCKER_OVERBLOG_IP=33.33.33.10
cd Docker

supprimer les ip du docker-compose.yml
cd data/
chown -R 112:118 postgresql
chown -R 108:113 mysql

docker-compose up -d

sudo ifconfig en0 alias 33.33.33.10

docker exec -it docker_overblog_1 bash

si vous avez un fail composer, téléchargez le à la main
https://getcomposer.org/download/
