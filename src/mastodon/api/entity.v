module api

pub struct Application {
pub:
	name          string @[required]
	website       string
	client_id     string
	client_secret string
}

pub struct Token {
pub:
	access_token string @[required]
	token_type   string @[required]
	scope        string @[required]
	created_at   u64 @[required]
}