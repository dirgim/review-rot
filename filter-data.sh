#!/bin/bash
set -euo pipefail

authors='[
  "MartinBasti",
  "Josh-Everett",
  "kasemAlem",
  "dirgim",
  "hongweiliu17",
  "dheerajodha",
  "sonam1412",
  "jsztuka",
  "14rcole",
  "hacbs-test-bot"
]'

bots='[
  "dependabot[bot]",
  "renovate[bot]"
]'


# Assumes data from stdin!
jq --argjson authors "${authors}" --argjson bots "${bots}" -r '[
    .[] | select(
        ([.user] | inside($authors)) or
        (.url | contains("/test-team/")) or
        (
	  ([.user] | inside($bots)) and
	  (.url | test ("build-definitions|integration-service|integration-examples|hacbs-test|clair-in-ci-db"))
        )
    )
]'
