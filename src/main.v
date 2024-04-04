module main

import mastodon

fn main() {
	client := mastodon.load_client_details()
	println(client.get_public_feed())
}
