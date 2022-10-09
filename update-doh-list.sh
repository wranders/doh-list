#!/bin/bash

FILE="curl.wiki/DNS-over-HTTPS.md"

CONTENT=$(sed -n '/^# Publicly available servers/,/^# Private DNS Server/p' $FILE | \
    grep "^|" | tail -n +3 | \
    sed 's/^|// ; s/^[ ]*// ; s/^[^|]*|// ; s/^[ ]*// ; /^\*\*/d ; s/|.*//' | \
    grep -o 'https://[a-zA-Z0-9./?=_%:-]*' | \
    awk -F[/:] '{ print $4 }')

cat << EOF > doh-list.txt
#$(sha256sum $FILE| cut -d' ' -f1)
#
# DNS-over-HTTPS Providers
# Compiled from curl/curl wiki
#
# POTENTIAL PROBLEM DOMAINS:
#   !!! These DoT resolvers are at a base url, so blocking these providers
#   !!! may block regular web access to these services.
#
$(echo "$CONTENT" | awk -F'.' 'NF==2' | awk '{ print "#\t" $0}')
#

$CONTENT
EOF
