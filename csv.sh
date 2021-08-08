#!/bin/sh
cd ~/stats
find logs -name "*.gz" | \
    xargs gzcat | \
    grep --invert-match --file=exclude.txt | \
    /usr/local/bin/goaccess \
	--log-format CLOUDFRONT \
	--date-format CLOUDFRONT \
	--time-format CLOUDFRONT \
	--ignore-crawlers \
	--ignore-status=301 \
	--ignore-status=302 \
	--keep-last=28 \
	--output stats.csv
