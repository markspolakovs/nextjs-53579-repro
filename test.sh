#!/usr/bin/env bash
set -euo pipefail

# Replace this with the path to your local nextjs clone's `packages/next` folder
yarn add ~/code2/next.js/packages/next
export NEXT_TEST=all_good
rm -r .next
yarn next build
node .next/standalone/server.js &
NODEPID=$!
sleep 1

output=$(curl -s http://localhost:3000/test)
kill $NODEPID
echo "$output"

if [[ "$output" != *"all_good"* ]]; then
  echo "Test failed"
  exit 1
fi
echo "Test passed"
