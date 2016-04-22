cat > awslogs.conf <<EOF
[general]
state_file = /var/awslogs/state/agent-state
EOF

cat >> awslogs.conf <<EOF
[${LOG_FILE}]
file = ${LOG_FILE}
buffer_duration = 5000
log_stream_name = {instance_id}
initial_position = start_of_file
log_group_name = ${LOG_GROUP}
EOF

aws configure set plugins.cwlogs cwlogs
aws configure set default.region $AWS_REGION

aws logs push --config-file awslogs.conf