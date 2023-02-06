#!/bin/bash
set -euo pipefail

authors='[
  "martinbasti"
]'

# Assumes data from stdin!
jq --argjson authors "${authors}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/test-team/"))
    )
]'
