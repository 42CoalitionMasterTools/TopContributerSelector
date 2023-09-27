#!/bin/bash

set -eux;

FT_API_UID=u-s4t2ud-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
FT_API_SECRET=s-s4t2ud-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

_main()
{
	curl -X POST --data "grant_type=client_credentials&client_id=$FT_API_UID&client_secret=$FT_API_SECRET" https://api.intra.42.fr/oauth/token > access_token.json

	ACCESS_TOKEN=$(jq -r '.access_tokenl' access_token.json)

	curl -H "Authorization: Bearer $ACCESS_TOKEN" http://api.intra.42.fr/v2/cursus | jq .

}

_main
