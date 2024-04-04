module api

import json

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
	created_at   u64    @[required]
}

pub struct Status {
pub:
	id                     string             @[required]
	uri                    string             @[required]
	created_at             string             @[required]
	account                Account            @[required]
	content                string             @[required]
	visibility             string             @[required]
	sensitive              bool               @[required]
	spoiler_text           string             @[required]
	media_attatchments     []MediaAttatchment @[required]
	application            Application
	mentions               []StatusMention    @[required]
	tags                   []StatusTag        @[required]
	emojis                 []CustomEmoji      @[required]
	reblogs_count          int                @[required]
	favourites_count       int                @[required]
	replies_count          int                @[required]
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
	id       string @[required]
	username string @[required]
	url      string @[required]
	acct     string @[required]
}

pub struct StatusTag {
pub:
	name string @[required]
	url  string @[required]
}

pub struct Account {
pub:
	id              string        @[required]
	username        string        @[required]
	acct            string        @[required]
	url             string        @[required]
	display_name    string        @[required]
	note            string        @[required]
	avatar          string        @[required]
	avatar_static   string        @[required]
	header          string        @[required]
	header_static   string        @[required]
	locked          string        @[required]
	fields          []Field       @[required]
	emojis          []CustomEmoji @[required]
	bot             bool          @[required]
	group           bool          @[required]
	discoverable    bool
	noindex         bool
	moved           string // v.is.complaining.comment
	suspended       bool
	limited         bool
	created_at      string        @[required]
	last_status_at  string
	statuses_count  int           @[required]
	followers_count int           @[required]
	following_count int           @[required]
}

pub struct Field {
pub:
	name        string @[required]
	value       string @[required]
	verified_at string
}

pub struct MediaAttatchment {
pub:
	id          string @[required]
	type_       string @[json: 'type'; required]
	url         string @[required]
	preview_url string @[required]
	remote_url  string
	// meta string @[required] // TODO: Media metadata
	description string
	blurhash    string @[required]
}

pub struct CustomEmoji {
	shortcode         string @[required]
	url               string @[required]
	static_url        string @[required]
	visible_in_picker bool   @[required]
	category          string @[required]
}

pub struct Poll {
pub:
	id           string        @[required]
	expires_at   string
	expired      bool          @[required]
	multiple     bool          @[required]
	voters_count int
	options      []PollOption  @[required]
	emojis       []CustomEmoji @[required]
	voted        bool
	own_votes    bool
}

pub struct PollOption {
pub:
	title       string @[required]
	votes_count int
}

pub struct PreviewCard {
pub:
	url           string @[required]
	title         string @[required]
	description   string @[required]
	type_         string @[json: 'type'; required]
	author_name   string @[required]
	providor_name string @[required]
	html          string @[required]
	width         int    @[required]
	height        int    @[required]
	image         string
	embed_url     string @[required]
	blurhash      string
}
