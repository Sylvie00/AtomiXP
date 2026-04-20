# AtomiXP &nbsp; [![bluebuild build badge](https://github.com/sylvie00/atomixp/actions/workflows/build.yml/badge.svg)](https://github.com/sylvie00/atomixp/actions/workflows/build.yml)

AtomiXP is an experimental ublue image with XFCE and the latest build of xfce-winxp-tc prebuilt. Primarily made for personal use, but you're welcome to try it. Expect bugs and X11 related issues.

<img width="1280" height="800" alt="image" src="https://github.com/Sylvie00/AtomiXP/blob/main/assets/screenshot.png?raw=true" />

## Features

- [x] Full XP desktop, taskbar, and greeter experience out of the box (wintc-desktop disabled OOTB for better functionality, can be re-enabled by removing .disabled from the autostart entry)
- [x] Automatic theme configuring for new and existing users rebasing from another image
- [x] Steam and Bazaar flatpaks included
- [ ] ISO Downloads (coming soontm)
- [x] Nvidia Support (atomixp-nvidia-open)
- [ ] Wayland support via labwc? (maybe)

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/sylvie00/atomixp:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/sylvie00/atomixp:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Credits (WIP)
[bluexp](https://github.com/winblues/bluexp/) For inspiration and xfce-winxp-tc install script

[xfce-winxp-tc](https://github.com/rozniak/xfce-winxp-tc) For theming

## ISO

Will be provided when ready

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/sylvie00/atomixp
```
