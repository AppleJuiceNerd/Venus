module logger

import os
import time

@[params]
pub struct NewLoggerParams {
	path string
}

@[noinit]
pub struct Logger {
pub:
	filepath string
pub mut:
	file os.File
}

pub fn new_logger(p NewLoggerParams) Logger {
	return Logger{
		filepath: './logs/${time.now().ymmdd()}-${time.now().hhmmss()}'
	}
}

pub fn (mut l Logger) log(text string, severity Severity) {
	mut str := ''

	str += '[ ${time.now().hhmmss()} ] - '

	match severity {
		.debug {
			str += 'DEBUG: '
		}
		.info {
			str += 'INFO: '
		}
		.warning {
			str += 'WARNING: '
		}
		.error {
			str += 'ERROR: '
		}
		.critical {
			str += 'CRITICAL: '
		}
	}

	str += text + '\n'

	l.file.write_string(str) or { panic('The logger failed. How???') }
}
