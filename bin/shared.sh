# This is just helper library to be sourced in other scripts

# Copyright (c) 2018 Paweł Kierzkowski
# License: MIT
# Home: https://github.com/4O4/crossforms

setup_env() {
	local use_defaults=${1:-"0"}
	local host=${host:-"poligon"}
	local user=${user:-"apps"}
	local pass="${apps:=}"

	if [[ "${use_defaults}" -eq 0 ]]; then
		if [[ $(uname -s) == *"CYGWIN"* ]] || grep -q Microsoft /proc/version
		then
			read -e -p "Host: " -i "${host}" host
			read -e -p "Username: " -i "${user}" user
		fi;

		if [[ -z "$pass" ]]; then
			read -s -p "Password for ${user}: " pass
		fi;
	fi;

	if [[ $(uname -s) == *"CYGWIN"* ]] || grep -q Microsoft /proc/version
	then
		frmcmp="frmcmp.exe"
		connection="userid='apps/${pass}@${host}'"
		params=("batch=yes" "window_state=minimize")
	else
		frmcmp="frmcmp_batch.sh"
		connection="userid='apps/${pass}'"
	fi;
}

version() {
	cat <<-EOF
	${PROGNAME} v${VERSION}
	EOF
}

usage() {
	version
	cat <<-EOF

	${USAGE}
	EOF
}
