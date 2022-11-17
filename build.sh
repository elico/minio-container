#!/usr/bin/env bash

mkdir -p build-dir/linux/{amd64,arm64,arm}

wget "$(head -1 build-dir/amd64-url )" -O "build-dir/linux/amd64/$(head -1 container-name )"
wget "$(head -1 build-dir/arm64-url )" -O "build-dir/linux/arm64/$(head -1 container-name )"
wget "$(head -1 build-dir/arm-url )" -O "build-dir/linux/arm/$(head -1 container-name )"

wget "$(head -1 build-dir/mc-amd64-url )" -O "build-dir/linux/amd64/mc"
wget "$(head -1 build-dir/mc-arm64-url )" -O "build-dir/linux/arm64/mc"
wget "$(head -1 build-dir/mc-arm-url )" -O "build-dir/linux/arm/mc"

chmod +x "build-dir/linux/arm/$(head -1 container-name )"
chmod +x "build-dir/linux/arm64/$(head -1 container-name )"
chmod +x "build-dir/linux/amd64/$(head -1 container-name )"

chmod +x "build-dir/linux/arm/mc"
chmod +x "build-dir/linux/arm64/mc"
chmod +x "build-dir/linux/amd64/mc"

upx "build-dir/linux/arm/$(head -1 container-name )"
upx "build-dir/linux/arm64/$(head -1 container-name )"
upx "build-dir/linux/amd64/$(head -1 container-name )"

upx "build-dir/linux/arm/mc"
upx "build-dir/linux/arm64/mc"
upx "build-dir/linux/amd64/mc"
