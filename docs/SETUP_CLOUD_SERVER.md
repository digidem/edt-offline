# Setting up your own Earth Defenders Toolkit Cloud

1. **A cloud provider or a computer**: we recommend [Digital Ocean](https://digitalocean.com) or any computer your organization can provide
2. **Docker and docker-compose**: Some cloud providers (such as Digital Ocean) have a marketplace with [single-click Docker deployment](https://cloud.digitalocean.com/droplets/new?onboarding_origin=marketplace&appId=87786318&image=docker-20-04&activation_redirect=%2Fdroplets%2Fnew%3FappId%3D87786318%26image%3Ddocker-20-04). You can also install Docker and docker-compose on your machine using a single command:
```
curl -fsSL https://raw.githubusercontent.com/jinweijie/install-docker-and-compose/master/install.sh | sh
```
3. Clone repository
4. cd into server
5. cp and edit .env.example
6. `mkdir -p ~/data/content && chown -R 1000:1000 ~/data/content`
7. `docker-compose up -d`
8. `docker-compose logs -f`
9. `docker-compose logs -f syncthing`

## Usage

1. Setup a stronger password for FileBrowser and Syncthing apps
2. Change the description and moderation strategy for the Secure Scuttlebutt Room app
3. Using the FileBrowser application create folders for your content
4. Using the Syncthing application share the content folders

## Actions

To automate updates to the cloud you can fork the official repository and add your own Github Action secrets.

Check the [ssh-action](https://github.com/appleboy/ssh-action) repository to understand the different variables.