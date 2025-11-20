#!/bin/bash
# test.sh — basic sanity check
set -euo pipefail

if grep -q "Hello from Jenkins CI/CD" index.html; then
  echo "[test.sh] Basic content check OK"
  exit 0
else
  echo "[test.sh] Basic content check FAILED"
  exit 1
fi
