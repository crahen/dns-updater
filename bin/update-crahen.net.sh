#!/ffp/bin/sh -xe
PATH=/ffp/bin:/ffp/sbin:$PATH

# Resolve addresses
GW=$(wget -qO- http://ipecho.net/plain)
PP=$(netstat -r | awk '{print $2}' | sed -ne '/[0-9].*/p')
ZZ=$(ifconfig egiga0 | sed -ne 's,.*inet addr:\([^ ]*\) .*,\1,pg')

# Push addresses into DNS
DOMAIN=crahen.net
cli53 rrcreate $DOMAIN gw A $GW --replace
cli53 rrcreate $DOMAIN zz A $ZZ --replace
cli53 rrcreate $DOMAIN pp A $PP --replace
