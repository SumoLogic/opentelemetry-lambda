# OpenTelemetry Lambda Python

Scripts and files used to build AWS Lambda Layers for running OpenTelemetry on AWS Lambda for Python.

### Sample App 

1. Install [SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html) and [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
2. Run aws configure to [set aws credential(with administrator permissions)](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-mac.html#serverless-sam-cli-install-mac-iam-permissions) and default region.
3. Download a local copy of the this repository from Github.
4. cd python/sample-apps && ./run.sh
5. Set `SUMOLOGIC_HTTP_TRACES_ENDPOINT_URL` environment variable with [Sumo Logic HTTP Traces URL](https://help.sumologic.com/Traces/HTTP_Traces_Source)

### Sumo Logic AWS Distro Python Lambda Layers

Sumo Logic AWS Distro Python lambda layers support:
* `Python 3.8` and `Python 3.9` runtimes
* `x86_64` and `arm64` architectures

#### Amd64 lambda layers list
|AWS Region|ARN|
|:-----------|:-------|
|US East (N.Virginia) us-east-1|arn:aws:lambda:us-east-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|US East (Ohio) us-east-2|arn:aws:lambda:us-east-2:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|US West (N.Carolina) us-west-1|arn:aws:lambda:us-west-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|US West (Oregon) us-west-2|arn:aws:lambda:us-west-2:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|Africa (Cape Town) af-south-1|arn:aws:lambda:af-south-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Asia Pacific (Hong Kong) ap-east-1|arn:aws:lambda:ap-east-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Asia Pacific (Mumbai) ap-south-1|arn:aws:lambda:ap-south-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Asia Pacific (Osaka) ap-northeast-3|arn:aws:lambda:ap-northeast-3:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|Asia Pacific (Seoul) ap-northeast-2|arn:aws:lambda:ap-northeast-2:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Asia Pacific (Singapore) ap-southeast-1|arn:aws:lambda:ap-southeast-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|Asia Pacific (Sydney) ap-southeast-2|arn:aws:lambda:ap-southeast-2:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Asia Pacific (Tokyo) ap-northeast-1|arn:aws:lambda:ap-northeast-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Canada (Central) ca-central-1|arn:aws:lambda:ca-central-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|Europe (Frankfurt) eu-central-1|arn:aws:lambda:eu-central-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|Europe (Ireland) eu-west-1|arn:aws:lambda:eu-west-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Europe (London) eu-west-2|arn:aws:lambda:eu-west-2:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:2|
|Europe (Milan) eu-south-1|arn:aws:lambda:eu-south-1:663229565520:layer:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Europe (Paris) eu-west-3|arn:aws:lambda:eu-west-3:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Europe (Stockholm) eu-north-1|arn:aws:lambda:eu-north-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|Middle East (Bahrain) me-south-1|arn:aws:lambda:me-south-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|
|South America (Sao Paulo) sa-east-1|arn:aws:lambda:sa-east-1:663229565520:layer:sumologic-otel-python-x86_64-ver-1-10-0:1|

#### Arm64 lambda layers list
|AWS Region|ARN|
|:-----------|:-------|
|US East (N.Virginia) us-east-1|arn:aws:lambda:us-east-1:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:3|
|US East (Ohio) us-east-2|arn:aws:lambda:us-east-2:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:2|
|US West (Oregon) us-west-2|arn:aws:lambda:us-west-2:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:1|
|Asia Pacific (Mumbai) ap-south-1|arn:aws:lambda:ap-south-1:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:3|
|Asia Pacific (Osaka) ap-northeast-3|arn:aws:lambda:ap-northeast-3:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:2|
|Asia Pacific (Singapore) ap-southeast-1|arn:aws:lambda:ap-southeast-1:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:3|
|Asia Pacific (Sydney) ap-southeast-2|arn:aws:lambda:ap-southeast-2:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:1|
|Asia Pacific (Tokyo) ap-northeast-1|arn:aws:lambda:ap-northeast-1:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:1|
|Europe (Frankfurt) eu-central-1|arn:aws:lambda:eu-central-1:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:2|
|Europe (Ireland) eu-west-1|arn:aws:lambda:eu-west-1:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:1|
|Europe (London) eu-west-2|arn:aws:lambda:eu-west-2:663229565520:layer:sumologic-otel-python-arm64-ver-1-10-0:2|
