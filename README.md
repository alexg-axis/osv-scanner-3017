# osv-scanner #3017 reproduction

```shell
# Download the SBOM from the image built and published in this repo
docker buildx imagetools inspect --format '{{json .SBOM }}' ghcr.io/alexg-axis/osv-scanner-3017:latest | jq .SPDX > sbom.spdx.json

# Scan (fails)
go run "github.com/google/osv-scanner/v2/cmd/osv-scanner@v2.5.1" scan --no-ignore --format vertical sbom.spdx.json
# Scan (fails)
go run "github.com/google/osv-scanner/v2/cmd/osv-scanner@22613e79b26132083987bbe6eb29b1e48e241d3d" scan --no-ignore --format vertical sbom.spdx.json
# Scan (works)
go run "github.com/google/osv-scanner/v2/cmd/osv-scanner@v2.4.0" scan --no-ignore --format vertical sbom.spdx.json
```
