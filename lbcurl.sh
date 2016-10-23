#!/bin/bash

### Config/Envirnoment ###
source ./lbenv.sh

### Usage ###
usage () {

	echo "Usage: [-h host] [-e entity] [-q querytype] [-v version] [-p protocol] [-d json] [-o output file]"
}

### Curl ###
lbcurl(){

url=$1
protocol=$2
queryfile=$3
output=$4

echo "===================================================="
echo CURLING: $url
echo 

curl -H Content-Type:application/json -X $protocol $url --cert $cert -k -d @$queryfile | python -m json.tool >> lbcurl.log 

}

if [ $# -lt 1 ]; then
		### calling usage function
		usage
else
    while getopts :h:e:q:p:f:d:v:o option; do
	case $option in
				h) lb_host=$OPTARG;;  # environment dev/qa/prod
				e) lb_entity=$OPTARG;;  #entity
				q) lb_path=$OPTARG;; # find/insert/delete/update
				p) lb_protocol=$OPTARG;; # POST/PUT
				f) lb_datafile=$OPTARG;; # file
				v) lb_version=$OPTARG;;  # Version
                d) lb_queryfile=$OPTARG;; # json file
				o) lb_output=$OPTARG;;  # output
                ?) echo "invalid $OPTARG";;
			esac
	done

url="${hostarray[$lb_host]}${querypath[$lb_path]}$lb_entity/$lb_version"

## Calling lb_curl ###
lbcurl $url $lb_protocol $lb_queryfile 

fi



