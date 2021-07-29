#!/bin/sh
find logs -name "*.gz" | \
    xargs gzcat | \
    goaccess \
	--log-format CLOUDFRONT \
	--date-format CLOUDFRONT \
	--time-format CLOUDFRONT \
	--ignore-crawlers \
	--ignore-status=301 \
	--ignore-status=302 \
	--keep-last=28 \
	--output index.html
