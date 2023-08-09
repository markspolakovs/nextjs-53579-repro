#!/usr/bin/env bash
set -euo pipefail

export NEXT_TEST=all_good
rm -r .next
yarn next build
node .next/standalone/server.js &
NODEPID=$!
sleep 1

output=$(curl -s http://localhost:3000/test)
kill $NODEPID

if [[ "$output" != *"all_good"* ]]; then
  echo "Test failed"
  exit 1
fi
echo "Test passed"
