#!/usr/bin/env bash

set -eu

git ls-files | grep -E "\.sh$" | xargs shellcheck --format=checkstyle |
	reviewdog -f=checkstyle \
		-name="shellcheck" \
		-reporter=github-pr-review \
		-level=warning \
		-fail-on-error=1
