#!/usr/bin/env bash

set -eu
set -o pipefail

if [ "$EVENT_NAME" = "pull_request" ]; then
	git ls-files | grep -E "\.sh$" | xargs shellcheck --format=checkstyle |
		reviewdog -f=checkstyle \
			-name="shellcheck" \
			-reporter=github-pr-review \
			-level=warning \
			-fail-on-error=1
else
	git ls-files | grep -E "\.sh$" | xargs shellcheck
fi
