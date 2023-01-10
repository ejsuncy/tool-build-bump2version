# tool-build-bump2version

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat)

Installs [bump2version](https://github.com/c4urself/bump2version) in a python3-alpine image

## Usage

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

### Build this image locally
```shell
buildrunner -s build
```

## Releases

### Making a minor version release 
1. Bump the new minor version of this container
    ```shell
    BUILDRUNNER_BUMP_TYPE=patch buildrunner -s bump-version
    ```
2. Commit
3. Make the release on GitHub with the new minor version tag
4. Make a new branch from `main` with the new version name (ie `0.0.x`)
5. Move `main` to the next `alpha` version to capture future development 
    ```shell
    BUILDRUNNER_BUMP_TYPE=minor buildrunner -s bump-version
    ```

### Making a patch version release
1. Start with the version branch to be patched
    ```shell
    git checkout 0.0.x
    ```
2. Run a `patch` and `snap` version bump
    ```shell
    BUILDRUNNER_BUMP_TYPE=patch buildrunner -s bump-version
    ```
    ```shell
    BUILDRUNNER_BUMP_TYPE=snap buildrunner -s bump-version
    ```
3. Commit
4. Make the patch release on GitHub targeting the minor version branch with the new patch version tag

## Publishing an Image
```shell
docker buildx build . --platform linux/amd64,linux/arm/v8 --tag ghcr.io/ejsuncy/tool-build-bump2version:0.0.1 --push
```

