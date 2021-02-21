#!/usr/bin/env bash

#SPLITWISE_USER=
#PLITWISE_KEY=

curl -s -H "Authorization: Bearer $SPLITWISE_KEY" https://secure.splitwise.com/api/v3.0/get_expenses \
    | jq -r ".expenses[]
        | . + {\"user\": (.users[] | select(.user.id == $SPLITWISE_USER))}
        | [.id, (.date | strptime(\"%Y-%m-%dT%H:%M:%SZ\") | strftime(\"%Y-%m-%d\")), .user.paid_share, .user.net_balance, .description]
        | @csv"
