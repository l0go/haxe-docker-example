# Haxe Docker/Podman Example
Made for notbilly

## Usage
```
podman build . -t "haxetest"
podman run -it --name="haxetest-cont" --replace haxetest
```
For docker, just replace ``podman`` with ``docker``.
