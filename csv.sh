#!/bin/sh
cd ~/stats
find logs -name "*.gz" | \
    xargs gzcat | \
    grep --invert-match --file=exclude.txt | \
    /usr/local/bin/goaccess \
	--log-format "%d\\t%t\\t%^\\t%b\\t%h\\t%m\\t%^\\t%r\\t%s\\t%R\\t%u\\t%^" \
	--date-format CLOUDFRONT \
	--time-format CLOUDFRONT \
	--ignore-crawlers \
	--ignore-status=301 \
	--ignore-status=302 \
	--keep-last=28 \
	--output stats.csv
