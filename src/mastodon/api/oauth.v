module api

import net.http
import json

@[params]
pub struct TokenParams {
	server string @[required]

	grant_type string @[required]
	code string
	client_id string @[required]
	client_secret string @[required]
	redirect_uri string @[required]
	scope string
}

pub fn token(params TokenParams) Token {
	endpoint := '/oauth/token'

	response := http.post_json(params.server + endpoint, '{
			"grant_type": "${params.grant_type}",
			"code": ${null_if_empty(params.code)},
			"client_id": "${params.client_id}",
			"client_secret": "${params.client_secret}",
			"redirect_uri": "${params.redirect_uri}",
			"scope": ${null_if_empty(params.scope)}	
		}') or {
		panic('Something went wrong. (server)')
	}

	return json.decode(Token, response.body) or {
		print(response.str())
		panic('Something went wrong. (decode)')
	}
}
