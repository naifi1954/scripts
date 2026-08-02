# manifest build GKI
```
curl -LSs https://raw.githubusercontent.com/naifi1954/kernel_gki_manifest/refs/heads/main/gki.sh | bash
```

# Build
```
LTO=thin BUILD_CONFIG=build.config.gki.aarch64 build/build.sh
```
