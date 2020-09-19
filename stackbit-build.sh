#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5f661a6a0fd029001d39b1ce/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5f661a6a0fd029001d39b1ce
curl -s -X POST https://api.stackbit.com/project/5f661a6a0fd029001d39b1ce/webhook/build/ssgbuild > /dev/null
cd exampleSite && hugo --gc --baseURL "/" --themesDir ../.. && cd ..
curl -s -X POST https://api.stackbit.com/project/5f661a6a0fd029001d39b1ce/webhook/build/publish > /dev/null
