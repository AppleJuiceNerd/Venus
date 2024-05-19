module api

pub struct Application {
pub:
	name          string
	website       string
	client_id     string
	client_secret string
}

pub struct Token {
pub:
	access_token string
	token_type   string
	scope        string
	created_at   u64
}

pub struct Status {
pub:
	id                     string
	uri                    string
	created_at             string
	account                Account
	content                string
	visibility             string
	sensitive              bool
	spoiler_text           string
	media_attatchments     []MediaAttatchment
	application            Application
	mentions               []StatusMention
	tags                   []StatusTag
	emojis                 []CustomEmoji
	reblogs_count          int
	favourites_count       int
	replies_count          int
	url                    string
	in_reply_to_id         string
	in_reply_to_account_id string
	reblog                 string // Will be just the reblogged Status id; compiler complains about recursive struct
	poll                   Poll
	card                   PreviewCard
	language               string
	text                   string
	edited_at              string
	favourited             bool
	reblogged              bool
	muted                  bool
	bookmarked             bool
	pinned                 bool
	filtered               bool
}

pub struct StatusMention {
pub:
	id       string
	username string
	url      string
	acct     string
}

pub struct StatusTag {
pub:
	name string
	url  string
}

pub struct Account {
pub:
	id              string
	username        string
	acct            string
	url             string
	display_name    string
	note            string
	avatar          string
	avatar_static   string
	header          string
	header_static   string
	locked          string
	fields          []Field
	emojis          []CustomEmoji
	bot             bool
	group           bool
	discoverable    bool
	noindex         bool
	moved           string // v.is.complaining.comment
	suspended       bool
	limited         bool
	created_at      string
	last_status_at  string
	statuses_count  int
	followers_count int
	following_count int
}

pub struct Field {
pub:
	name        string
	value       string
	verified_at string
}

pub struct MediaAttatchment {
pub:
	id          string
	type_       string @[json: 'type']
	url         string
	preview_url string
	remote_url  string
	// meta string  // TODO: Media metadata
	description string
	blurhash    string
}

pub struct CustomEmoji {
	shortcode         string
	url               string
	static_url        string
	visible_in_picker bool
	category          string
}

pub struct Poll {
pub:
	id           string
	expires_at   string
	expired      bool
	multiple     bool
	voters_count int
	options      []PollOption
	emojis       []CustomEmoji
	voted        bool
	own_votes    bool
}

pub struct PollOption {
pub:
	title       string
	votes_count int
}

pub struct PreviewCard {
pub:
	url           string
	title         string
	description   string
	type_         string @[json: 'type']
	author_name   string
	providor_name string
	html          string
	width         int
	height        int
	image         string
	embed_url     string
	blurhash      string
}
