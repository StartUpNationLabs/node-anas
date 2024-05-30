# Ensure the "traefik" network exists
docker network create traefik || true

# Restart all containers
docker compose up -d --force-recreate --remove-orphans

echo "Successfully updated!"