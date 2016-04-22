# Docker CloudWatch Logs

Small (~65 MB) Alpine based Docker container for logging to Amazon CloudWatch Logs


## Usage

```
docker run \
	-v /var/myapp/logs/:/mnt/logs
	-e LOG_FILE=/mnt/logs/my-file.log \
	-e LOG_GROUP=my-log-group \
	-e AWS_REGION=eu-west-1 \
	joshbalfour/cloudwatch-logs
```

