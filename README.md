# create-cloak-package

Scaffolds a package intended for re-use in Cloak apps.  See [Cloak Package Approach](https://bukwild.slab.com/posts/cloak-package-approach-arp4lcrr) for more info.

## Usage

From the directory you want to create the new Cloak app:

```
yarn create cloak-package
```

This will ask you a couple of questions, copy files from the [template](./template), init a new git repo, and run initial install commands.  This incluces setting up a demo Cloak project that you can use to develop your package with.


## Contributing

1. Run `yarn sao ./ ~/Desktop/cloak-package` to test.
2. Track the changes you make to that instance using the git repo that was automatically set up.
3. Replay those changes (manually, unless someone has some git brilliance to share), back onto the /template directory as part of a PR.
