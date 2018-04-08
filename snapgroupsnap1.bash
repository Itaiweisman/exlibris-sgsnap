#! /usr/bin/bash
#byItai
JQ="/usr/bin/jq"
CURL="/usr/bin/curl"
IBOX_USER=""
IBOX_PW=""
IBOX_IP=""
SUFFIX="-clone"
SNAPGROUP=$1
REPLACED_FROM=$2
REPLACED_TO=$3

SLEEP=1

function json_to_list()
{
	url=$1
	#echo "list is $list"
	field=$2
	page_size=$3
	extra_filter=$4
	post=""
	if [ ! -z "$extra_filter" ] ; then post="&${extra_filter}" ; fi
	curl_json_response="$CURL -u ${IBOX_USER}:${IBOX_PW} \"http://${IBOX_IP}/${url}?fields=${field}&page_size=${page_size}${post}\""
	#echo "is $curl_json_response"
	list=`eval $curl_json_response | $JQ [.result] | awk -F: '{print $2}' `
	echo $list
}
function create_snapshots_to_sg() 
{
	list=$1
	for snap in $list
	do
		id=`echo $snap | awk -F, '{print $1}'`
		name=`echo $snap | awk -F, '{print $2}'`
		nname="echo $name | sed 's/${REPLACED_FROM}/${REPLACED_TO}/g'"
		new_name="`eval $nname`$SUFFIX"
		body="{\"parent_id\":$id,\"name\":\"$new_name\"}"	
		echo "body is $body"
		CREATE_CMD="$CURL -u ${IBOX_USER}:${IBOX_PW} http://${IBOX_IP}/api/rest/volumes -X POST -d '$body' -H  \"Content-Type: application/json\""
		eval $CREATE_CMD
		sleep $SLEEP
	done
}
	cgname=$SNAPGROUP
	cgid=`json_to_list "api/rest/cgs" "id" 100 name=$cgname`
	members=`json_to_list "api/rest/cgs/$cgid/members" "id,name" 100 | sed 's/, /,/g'`
	create_snapshots_to_sg "$members"
