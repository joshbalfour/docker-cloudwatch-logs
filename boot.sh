#!/bin/sh

cat > awslogs.conf <<EOF
[general]
state_file = /var/awslogs/state/agent-state
EOF

push_log() 
{

cat >> awslogs.conf <<EOF
[${1}]
file = ${1}
buffer_duration = 5000
log_stream_name = {instance_id}
initial_position = start_of_file
log_group_name = ${2}
EOF

}

aws configure set plugins.cwlogs cwlogs
aws configure set default.region $AWS_REGION

for mapping in "$@"
do
	ctr=0
	prev=''
	while [ "$mapping" ]
	do
		iter=${mapping%%:*}
		
		ctr=$((ctr+1))
		
		if [ "$ctr" = "2" ] 
		then
			push_log $prev $iter
		fi

		prev=$iter

		[ "$mapping" = "$iter" ] && \
			mapping='' || \
			mapping="${mapping#*:}"
		
	done
done

aws logs push --config-file awslogs.conf