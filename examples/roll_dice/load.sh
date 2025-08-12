#!/bin/bash

echo "\nRunning script:\n$PWD/$0\n"

# -e, -o errexit: Exit on error.
set -e

BASE_URL=${BASE_URL:-"http://localhost:4000"}

URLS=(
  "/random"
  "/api/oops"
  "/api/rolldice"
)
URLS_LEN=${#URLS[@]}

while true; do
  # shellcheck disable=SC2004
  URL_IDX=$((${RANDOM} % ${URLS_LEN}))
  URL="${BASE_URL}${URLS[$URL_IDX]}"
  echo "calling ${URL}"
  curl -k -s  "${URL}" > /dev/null

  sleep "$(echo "scale=4;${URL_IDX} / ${URLS_LEN}0 " | bc)"
done