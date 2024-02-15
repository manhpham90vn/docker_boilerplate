DOMAIN=domain.com

# ping
ping $DOMAIN

# check dns
nslookup -type=any $DOMAIN

# traceroute
traceroute $DOMAIN