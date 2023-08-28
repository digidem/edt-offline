#!/bin/sh

# Ensure .docker directory exists
mkdir -p .docker

# Read config file
config=$(cat ../docker-stacks.yml)

# Parse YAML 
demo_config=$(echo $config | yq .demo)
local_config=$(echo $config | yq .local)

# Demo environment 
# Exclude services 
sed "/python-wifi-connect/d" docker-compose.yml > .docker/docker-compose-demo.yml
# Exclude volumes
sed -i "/wifi_db/d" .docker/docker-compose-demo.yml
# Include services 
echo "  portal:
    ports:
      - 80:80" >> .docker/docker-compose-demo.yml
# Include environment
echo "    environment:" >> .docker/docker-compose-demo.yml 
echo "      - BALENA_INTERFACE_API=http://" >> .docker/docker-compose-demo.yml

# Local environment
# Exclude services
sed "/balena-interface/d" docker-compose.yml > .docker/docker-compose-local.yml
# Exclude volumes 
sed -i "/interface_db/d" .docker/docker-compose-local.yml
# Include services
echo "  portal:
    ports:
      - 80:80" >> .docker/docker-compose-local.yml
# Include environment
echo "    environment:" >> .docker/docker-compose-local.yml
echo "      - BALENA_INTERFACE_API=http://balena-interface" >> .docker/docker-compose-local.yml
# #!/bin/sh

# # Read docker-compose.yml
# # Read balena.yml file
# # Read docker-stacks.yml
# # Parse YAML
# # For each environment
# # 1. Exclude: labels, services, environments
# # 2. Include: labels, environments
# # TODO: include services

# # Read config file
# config=$(cat ../docker-stacks.yml)

# # Parse YAML 
# demo_config=$(echo $config | yq .demo)
# local_config=$(echo $config | yq .local)

# # Demo environment 
# # Exclude services 
# sed -i "/python-wifi-connect/d" docker-compose.yml 
# # Exclude volumes
# sed -i "/wifi_db/d" docker-compose.yml
# # Include services 
# echo "  portal:
#     ports:
#       - 80:80" >> docker-compose.yml
# # Include environment
# echo "    environment:" >> docker-compose.yml 
# echo "      - BALENA_INTERFACE_API=http://" >> docker-compose.yml

# # Local environment
# # Exclude services
# sed -i "/balena-interface/d" docker-compose.yml
# # Exclude volumes 
# sed -i "/interface_db/d" docker-compose.yml
# # Include services
# echo "  portal:
#     ports:
#       - 80:80" >> docker-compose.yml
# # Include environment
# echo "    environment:" >> docker-compose.yml
# echo "      - BALENA_INTERFACE_API=http://balena-interface" >> docker-compose.yml

# # This script:

# # Reads the docker-stacks.yml config file
# # Parses the YAML using yq to get the demo and local environment configs 
# # For the demo environment, it excludes the python-wifi-connect service and wifi_db volume
# # It includes the portal service and BALENA_INTERFACE_API environment variable
# # For the local environment, it excludes the balena-interface service and interface_db volume
# # It includes the portal service and BALENA_INTERFACE_API environment variable pointing to balena-interface
# # It modifies the docker-compose.yml file based on these inclusions and exclusions
