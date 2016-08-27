# Docker CloudWatch Logs

[![Docker Automated build](https://img.shields.io/docker/automated/joshbalfour/cloudwatch-logs.svg?maxAge=2592000)](https://hub.docker.com/r/joshbalfour/cloudwatch-logs/)
[![Docker Pulls](https://img.shields.io/docker/pulls/joshbalfour/cloudwatch-logs.svg?maxAge=2592000)](https://hub.docker.com/r/joshbalfour/cloudwatch-logs/)

Small (~18 MB) Alpine based Docker container for logging to Amazon CloudWatch Logs.

Auto-built and available from [Docker Hub](https://hub.docker.com/r/joshbalfour/cloudwatch-logs/).

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