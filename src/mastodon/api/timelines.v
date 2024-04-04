module api

import net.http
import json

@[params]
pub struct PublicParams {
	server string

	token      string
	local      bool
	remote     bool
	only_media bool
	max_id     string
	min_id     string
	since_id   string
	limit      int
}

pub fn public(params PublicParams) []Status {
	endpoint := '/api/v1/timelines/public'

	mut request := http.new_request(http.Method.get, params.server + endpoint, '' //+
			// "local=${params.local}&" +
			// "remote=${params.remote}&" +
			// "only_media=${params.only_media}&" +
			// "max_id=${null_if_empty(params.max_id)}&" +
			// "min_id=${null_if_empty(params.min_id)}&" +
			// "since_id=${null_if_empty(params.since_id)}&" +
			// "limit=${params.limit}"
		)

	request.add_header(http.CommonHeader.content_type, 'application/json')
	if !params.token.is_blank() {
		request.add_custom_header('Authorization', 'Bearer ${token}') or { panic(err) }
	}
	

	response := request.do() or { panic(err) }
	println(response)

	return json.decode([]Status, response.body) or { panic(err) }
}
