#!/bin/bash

set -e

curl -L -o GeoLite2-Country-CSV.zip "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&license_key=${LICENSE_KEY}&suffix=zip"
unzip GeoLite2-Country-CSV.zip
rm GeoLite2-Country-CSV.zip
mv GeoLite2* geoip
ls ./geoip

go get -u github.com/v2ray/geoip
$GOPATH/bin/geoip --country=./geoip/GeoLite2-Country-Locations-en.csv --ipv4=./geoip/GeoLite2-Country-Blocks-IPv4.csv --ipv6=./geoip/GeoLite2-Country-Blocks-IPv6.csv

mkdir ./publish
mv ./geoip.dat ./publish/
