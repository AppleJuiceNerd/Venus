module api

import net.http
import json

@[params]
pub struct CreateParams {
	server string @[required]

	client_name   string @[required]
	redirect_uris string @[required]
	scopes        string
	website       string
}

pub fn create(params CreateParams) Application {
	endpoint := '/api/v1/apps'

	response := http.post_json(params.server + endpoint, '{
			"client_name": "${params.client_name}",
			"redirect_uris": "${params.redirect_uris}",
			"scopes": ${null_if_empty(params.scopes)},
			"website": ${null_if_empty(params.website)}			
		}') or {
		panic('Something went wrong.')
	}

	return json.decode(Application, response.body) or {
		panic('Something went wrong.')
	}
}
