module mastodon

import api
// import utils.logger | implementation soon(tm)
import os
import json

pub struct Client {
pub:
	server      string          @[required]
	application api.Application @[required]
	token       api.Token       @[required]
}

pub fn prepare_client() Client {
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

	println(api.verify_credentials(server, mast_token.access_token))

	return Client{
		server: server
		application: mast_app
		token: mast_token
		// logger: logger.new_logger()
	}
}

pub fn (c Client) get_public_feed() []api.Status {
	return api.public(
		server: c.server
		token: c.token.access_token
	)
}

pub fn save_client_details(mut c Client) {
	os.write_file('./settings.json', json.encode(c)) or { panic(err) }
	// c.logger.log('Saved Settings', logger.Severity.debug)
}

pub fn load_client_details() Client {
	str := os.read_file('./settings.json') or { panic(err) }
	out := json.decode(Client, str) or { panic(err) }
	// logger.log('Loaded Settings', logger.Severity.debug)
	return out
}
