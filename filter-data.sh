#!/bin/bash
set -euo pipefail

authors='[
  "MartinBasti",
  "Josh-Everett",
  "jencull",
  "jinqi7",
  "dirgim",
  "hongweiliu17",
  "dheerajodha",
  "sonam1412",
  "jsztuka",
  "hacbs-test-bot",
  "dependabot[bot]",
  "renovate[bot]"
]'

# Assumes data from stdin!
jq --argjson authors "${authors}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/test-team/"))
    )
]'
