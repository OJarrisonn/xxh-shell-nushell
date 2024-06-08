## Install
```
xxh +I xxh-shell-nushell+git+https://github.com/OJarrisonn/xxh-shell-nushell
```
Connect:
```
xxh myhost +s nushell
```
To avoid adding `+s` every time use xxh config in `~/.config/xxh/config.xxhc` (`$XDG_CONFIG_HOME`):
```
hosts:
  ".*":                     # Regex for all hosts
    +s: nushell
```

## Plugins

WIP

## Thanks

The [the xxh shell example](https://github.com/xxh/xxh-shell-example) for showing me where to start.

The [elvish shell](https://github.com/krageon/xxh-shell-elvish) which [agnosticlines](https://github.com/agnosticlines) shamelessly ripped to make this (his own words)

To [agnosticlines](https://github.com/agnosticlines/xxh-shell-nushell) which i forked this repo from