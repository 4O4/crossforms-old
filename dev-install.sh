#!/usr/bin/env bash

sqlplus apps/$apps <<-EOF
	@./specs/FTREE.pks
	/
	@./specs/XFRM.pks
	/
EOF

for i in *.pks; do
	sqlplus apps/$apps <<-EOF
		@./specs/$i
		/
	EOF
done