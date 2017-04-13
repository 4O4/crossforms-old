# This is just helper library to be sourced in other scripts

setup_env() {
	local use_defaults=0 #"${1+x}"
	local host="poligon"
	local user="apps"
	local pass="${apps:=}"

	if [[ "${use_defaults:=0}" == 0 ]]; then
		if [[ $(uname -s) == *"CYGWIN"* ]] || [[ $(uname -s) == *"MINGW"* ]]; then
			read -e -p "Host: " -i "${host}" host
			read -e -p "Username: " -i "${user}" user
		fi;

		if [[ -z "$pass" ]]; then
			read -s -p "Password for ${user}: " pass
		fi;
	fi;

	if [[ $(uname -s) == *"CYGWIN"* ]] || [[ $(uname -s) == *"MINGW"* ]]; then
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