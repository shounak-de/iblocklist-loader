# iblocklist-loader
Generic script to create ipsets lists from the free lists available from iblocklist.com with optional whitelisting by domain

For ASUSWRT, place this in `/jffs/scripts` and make it executable. This script can be called from `/jffs/scripts/firewall-start` or can be scheduled to be run periodically via cron

For PCs and other routers with ipsets, this should work as well. I've tested it on a CentOS machine
