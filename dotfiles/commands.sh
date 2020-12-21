# USEFUL FUNCTIONS THAT I USE ALL THE TIME

# Formats a CSV file for convenient visualization with less
pretty_csv() {
  perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

# Formats a TSV file for convenient visualization with less
pretty_tsv() {
  perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s\t | less  -F -S -X -K
}

# Port forwarding
# Example usage: tunnel <remote host> <port>
tunnel() {
    ssh -N -n -L localhost:"$2":localhost:"$2" $1
}

# Port forwarding through a jump host
# Example usage: tunnel_through_host <jump host> <target host> <port>
tunnel_through_host() {
    ssh -N -n -J $1 -L localhost:"$3":localhost:"$3" $2
}

# Pushes a file to the public directory on cuBIC-cloud
push_to_public() {
  if [ -z "$2" ]
  then
   scp -r $1 cubiccloud:/var/www/html/public/$2
  else
   scp -r $1 cubiccloud:/var/www/html/public
  fi
}

# Docker-related functions

# Kills all the running containers
killallcontainers() {
	docker ps --all | awk '{if(NR>1) print $1}' | xargs -I{} docker kill {}
}

# Removes all the running containers
removeallcontainers() {
	docker ps --all | awk '{if(NR>1) print $1}' | xargs -I{} docker container rm {}
}
