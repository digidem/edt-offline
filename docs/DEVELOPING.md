# Developing and realeasing EDT-Offline

- Use the `compose` stack to test the stack locally
- For fast, offline, local iterations with a device read the [Develop locally](https://www.balena.io/docs/learn/develop/local-mode/) documentation
- Make use of Git, Balena Cloud and Github Actions for development by reading the sections bellow
- To dive deeper into Balena install the [cli](https://www.balena.io/docs/reference/balena-cli/) and try pushing some draft releases manually.


## Developing on branch

In order to start having builds automatically built and published as drafts to Balena Cloud create a Pull Request for the main branch.

After that all your commits will trigger draft pushes to Balena Cloud to both fleets with the PR's number.

## Releasing Beta

Realeasing entails in pushing a draft image to Balena Cloud and generating the image files that can be burned to storage devices (sd, ssds, usbs) in order to install the Beta stack on the device

Beta releases are created whenever a tag with `-something` is created, such as `v1.0.0-beta` or `v1.0.0-draft` etc.

Releases are built and published for all these platforms: pi3, pi4, rockpi4, rockpro64, generic_aarch64, nuc, generic_amd64.



Create a new beta tag:

```
git tag -a "v1.2.0-beta" -m "Beta test of super new service"
git push origin v1.2.0-beta
```

## Releasing

Realeasing entails in pushing a release image to Balena Cloud. All devices that are tracking the latest will download to this release image, so be sure to test it well.

It'll also generate image files that can be burned to storage devices (sd, ssds, usbs) in order to install the current release stack on the devices.

Create a new release tag:
```
git tag -a "v1.2.0" -m "Super new release"
git push origin v1.2.0
```

Follow the progress of builds in the [Repository's Action](https://github.com/digidem/edt-offline/actions) tab.