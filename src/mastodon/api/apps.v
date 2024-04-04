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

	mut request := http.new_request(http.Method.post, params.server + endpoint, '{
			"client_name": "${params.client_name}",
			"redirect_uris": "${params.redirect_uris}",
			"scopes": ${null_if_empty(params.scopes)},
			"website": ${null_if_empty(params.website)}			
		}')

	request.add_header(http.CommonHeader.content_type, 'application/json')

	response := request.do() or { panic(err) }

	return json.decode(Application, response.body) or { panic(err) }
}

pub fn verify_credentials(server string, token string) Application {
	endpoint := '/api/v1/apps/verify_credentials'

	mut request := http.new_request(http.Method.get, server + endpoint, '')

	request.add_custom_header('Authorization', 'Bearer ${token}') or { panic(err) }

	response := request.do() or { panic(err) }

	return json.decode(Application, response.body) or { panic(response.status()) }
}
