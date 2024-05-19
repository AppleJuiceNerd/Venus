module main

// import mastodon | unused for now
import app.cli

fn main() {
	// mut client := mastodon.load_client_details()

	mut ui := cli.new()
	ui.tui.run() or { panic(err) }
}
