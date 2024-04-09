# AUTOBRR-DISTROLESS

> [!NOTE]
> This is not the official repository for autobrr.
> Please go to [autobrr/autobrr](https://github.com/autobrr/autobrr) if you want to use the standard builds.

## Distroless

This repo is solely used to create alternative docker images using [https://github.com/GoogleContainerTools/distroless](https://github.com/GoogleContainerTools/distroless). Specifically `static-debian12:nonroot`.

### Why aren't autobrr using distroless by default?
Many users rely on a shell inside their containers to run scripts. Distroless images won't let you do that.

### Benefits of Distroless

Distroless images are minimal images that do not contain package managers, shells, or any other programs you would expect to find in a standard Linux distribution.
This minimalism leads to several key benefits:

1. **Security:** Distroless images improve security by reducing the attack surface of the image. By removing unnecessary components like package managers, shells, or other programs, you reduce the amount of software that can contain vulnerabilities. This means that if an attacker manages to break into the container, they will have fewer tools at their disposal.

2. **Performance:** Distroless images are significantly smaller than standard images (even Alpine), which can lead to faster startup times, less disk usage, and less network bandwidth consumption when pulling the images.

3. **Maintainability:** With fewer components in the image, there are fewer things that need to be maintained, updated, or patched.
