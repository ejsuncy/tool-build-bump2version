# tool-build-bump2version

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat)

Installs [bump2version](https://github.com/c4urself/bump2version) in a python3-alpine image

## Usage

> **Note**
> See these docs for the latest release by selecting the appropriate tag or branch above

bump2version uses the [.bumpversion.cfg](.bumpversion.cfg) file in the `/bump` directory to bump the version found 
in the files listed in that config file.

To use this image, just mount the root directory at `/bump` with RW permissions:

```shell
docker run \
  --mount type=bind,src="$(pwd)",dst=/bump \
  -it ghcr.io/ejsuncy/tool-build-bump2version:0.0.1 \
  bump2version patch
```

For use with [buildrunner](https://github.com/adobe/buildrunner), see [buildrunner.yaml](buildrunner.yaml).

## Contributing and Development

### Update git-submod-lib submodule for current Makefile Targets
```shell
git submodule update --remote
```

### Build Image Locally
```shell
make -f git-submod-lib/makefile/Makefile build-image
```

### Make a pull request to `main`
```shell
make -f git-submod-lib/makefile/Makefile pull-request-main
```

## Releasing

### Minor releases
```shell
make -f git-submod-lib/makefile/Makefile promotion-alpha
```

Once the PR is approved and merged:
```shell
make -f git-submod-lib/makefile/Makefile github-release
```

Once the Release is published:
```shell
make -f git-submod-lib/makefile/Makefile github-image
```

Now cut a version release branch:
```shell
make -f git-submod-lib/makefile/Makefile github-branch
```

Now move `main` to the next `alpha` version to capture future development
```shell
make -f git-submod-lib/makefile/Makefile version-alpha
```

### Patch releases
Start with the version branch to be patched (ie `0.0.x`)
```shell
make -f git-submod-lib/makefile/Makefile promotion-patch
```

Once the PR is approved and merged:
```shell
make -f git-submod-lib/makefile/Makefile github-release-patch
```

Once the Patch Release is published:
```shell
make -f git-submod-lib/makefile/Makefile github-image
```
