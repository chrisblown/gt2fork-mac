#!/bin/sh

set -e

contents_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "${HOME:-/}"
exec "$contents_dir/MacOS/gt2fork-bin" "$@"
