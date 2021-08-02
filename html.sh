#!/bin/sh
find ~/stats/logs -name "*.gz" | \
    xargs gzcat | \
    /usr/local/bin/goaccess \
	--log-format CLOUDFRONT \
	--date-format CLOUDFRONT \
	--time-format CLOUDFRONT \
	--ignore-crawlers \
	--ignore-status=301 \
	--ignore-status=302 \
	--keep-last=28 \
	--output ~/stats/index.html
