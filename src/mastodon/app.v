module mastodon

import api

pub fn prepare_app() {
	server := 'https://mastodon.social'
	mast_app := api.create(
		server: server
		client_name: 'Test App'
		redirect_uris: 'urn:ietf:wg:oauth:2.0:oob'
		scopes: 'read write push'
	)

	mast_token := api.token(
		server: server
		client_id: mast_app.client_id
		client_secret: mast_app.client_secret
		redirect_uri: 'urn:ietf:wg:oauth:2.0:oob'
		grant_type: 'client_credentials'
	)
	
	println(mast_token)
}
