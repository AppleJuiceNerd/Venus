module api

fn null_if_empty(str string) string {
	if str.is_blank() {
		return 'null'
	} else {
		return '"${str}"'
	}
}

// TODO: JSON generation from struct
