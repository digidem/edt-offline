# Using a Balena Virtual Machine

Read details on the [official repository](https://github.com/balena-labs-research/balena-virt).

Make sure you have a Balena Fleet with **generic x86_64 (GPT)** as the **Default device type**.

On a Digital Ocean droplet with at least 25Gbs of storage and 1Gb of ram, and latest Docker pre-installed, run:

```
docker run -it \
    -d \
    --restart always \
    -v bv_pid:/app/pid \
    --device=/dev/kvm \
    --cap-add=net_admin \
    -e API_TOKEN="your_balena_token" \
    -e FLEET="your_balena_fleet" \
    -e MEM=1024M \
    -e DISK=20G \
    -e DEV_MODE=true \
    --network host \
    ghcr.io/balena-labs-research/balena-virt:latest
```

After a few seconds a new device should appear on your amd64 and should start updating itself with latest release for the Fleet.

In order to make it easier to debug and do QA testing on a feature or a release, it's helpful to expose the virtual device's services. We can use [tailscale](https://tailscale.com) for that.

SSH into the virtual Balena device using the **UUID** which can be obtained from the Balena dashboard:

`balena ssh <uuid>`

Within the virtual Balena environment, run:

```
balena run -d \
    --name=tailscaled \
    --restart always \
    -e TS_STATE_DIR=/var/lib/tailscale \
    -v tailscale-state:/var/lib/tailscale \
    -v /dev/net/tun:/dev/net/tun \
    --network=host \
    --privileged \
    tailscale/tailscale tailscaled
```

And to start the **tailscale** service, run:
```
balena exec tailscaled tailscale up --advertise-routes=10.0.3.0/24 --accept-routes --reset
```

The Tailscale container will provide you a URL to access that adds the device to your Tailscale account.

Then [enable the subnets](https://tailscale.com/kb/1019/subnets/#step-3-enable-subnet-routes-from-the-admin-console) from your Tailscale admin panel to be able to use all the devices locally through the IP addresses they are assigned by Balena Virt.

On your own machine run:
```
docker run -d \
    --name=tailscaled \
    --restart always \
    -e TS_STATE_DIR=/var/lib/tailscale \
    -v tailscale-state:/var/lib/tailscale \
    -v /dev/net/tun:/dev/net/tun \
    --network=host \
    --privileged \
    tailscale/tailscale tailscaled
```

And to start tailscale:
```
docker exec tailscaled tailscale up --advertise-routes=10.0.3.0/24 --accept-routes --reset
```

Don't forget to also enable the subnets. And now on your machine you should be able to access services on the balena device's ip.