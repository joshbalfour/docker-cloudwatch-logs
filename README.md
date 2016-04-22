# Docker CloudWatch Logs

Small (~18 MB) Alpine based Docker container for logging to Amazon CloudWatch Logs


## Usage

```
docker run \
	-v /var/myapp/logs/:/mnt/logs
	-e AWS_REGION=eu-west-1 \
	joshbalfour/cloudwatch-logs \
	/mnt/logs/my-file.log:my-log-group \
	/mnt/logs/my-other-file.log:my-other-group \
```

