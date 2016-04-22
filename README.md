# Docker CloudWatch Logs

Small (~18 MB) Alpine based Docker container for logging to Amazon CloudWatch Logs


## Usage

```
docker run \
	-v /var/myapp/logs/:/mnt/logs \
	-e AWS_REGION=eu-west-1 \
	joshbalfour/cloudwatch-logs \
	/mnt/logs/my-file.log:my-log-group \
	/mnt/logs/my-other-file.log:my-other-group
```

## Notes
Remember to set the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables if you're not running this on an EC2 instance under an IAM role.