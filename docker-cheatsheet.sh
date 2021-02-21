#!/bin/bash
# Docker cheatsheet, based on https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
# put in a neat, categorized, and organized way.

PS3='Please enter your choice: '
options=(
    "[EVERYTHING]   Clean slate - remove all images, containers, volumes and networks"
    "[EVERYTHING]   Remove all dangling resources (not associated with any containers)"
    "[IMAGES]       List all images"
    "[IMAGES]       List images with specific pattern"
    "[IMAGES]       List dangling images"
    "[IMAGES]       Run image then remove"
    "[IMAGES]       Remove dangling images"
    "[IMAGES]       Remove specific images by id"
    "[IMAGES]       Remove pattern of images"
    "[IMAGES]       Remove all images"
    "[CONTAINERS]   List all containers"
    "[CONTAINERS]   List all exited containers"
    "[CONTAINERS]   List containers with specific pattern"
    "[CONTAINERS]   List containers with specific filters"
    "[CONTAINERS]   Stop all containers"
    "[CONTAINERS]   Remove specific container by id"
    "[CONTAINERS]   Remove a container and its volumes by name"
    "[CONTAINERS]   Remove all exited containers"
    "[CONTAINERS]   Remove all containers with specific pattern"
    "[CONTAINERS]   Remove all containers with specific filters"
    "[CONTAINERS]   Remove all containers"
    "[VOLUMES]      List all volumes"
    "[VOLUMES]      List dangling volumes"
    "[VOLUMES]      Remove volumes by name"
    "[VOLUMES]      Remove dangling volumes"
)

command=(
    "docker system prune -a"
    "docker system prune"
    "docker images -a"
    "docker images -a | grep \"pattern\""
    "docker images -f dangling=true"
    "docker run --rm image_name"
    "docker images purge"
    "docker rmi image_id"
    "docker images -a | grep \"pattern\" | awk '{print \$3}' | xargs docker rmi"
    "docker rmi \$(docker images -a -q)"
    "docker ps -a"
    "docker ps -a -f status=exited"
    "docker ps -a | grep \"pattern\""
    "docker ps -a -f status=exited -f status=created"
    "docker stop \$(docker ps -a -q)"
    "docker rm container_id or container_name"
    "docker rm -v container_name"
    "docker rm \$(docker ps -a -f status=exited -q)"
    "docker ps -a | grep \"pattern\" | awk '{print \$3}' | xargs docker rmi"
    "docker rm \$(docker ps -a -f status=exited -f status=created -q)"
    "docker rm \$(docker ps -a -q)"
    "docker volume ls"
    "docker volume ls -f dangling=true"
    "docker volume rm volume_name volume_name"
    "docker volume prune"
)

function confirm_choice() {
    echo
    echo "Selection:"
    echo $opt
    echo
    echo "Command:"
    echo "${command[$REPLY-1]}"
}

select opt in "${options[@]}"
do
    case $opt in
        *) confirm_choice; break;;
    esac
done