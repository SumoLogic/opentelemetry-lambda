# OpenTelemetry Collector AWS Lambda Extension layer

The OpenTelemetry Collector Lambda Extension provides a mechanism to export telemetry aynchronously from AWS Lambdas. It does this by embedding a stripped-down version of [OpenTelemetry Collector Contrib](https://github.com/open-telemetry/opentelemetry-collector-contrib) inside an [AWS Extension Layer](https://aws.amazon.com/blogs/compute/introducing-aws-lambda-extensions-in-preview/). This allows lambdas to use the OpenTelemetry Collector Exporter to send traces and metrics to any configured backend.


## Build your OpenTelemetry Collector Lambda layer from scratch
At the moment users have to build Collector Lambda layer by themselves, we will provide sharing Lambda layer in the future.
- Download a local copy of the Sumo Logic [opentelemetry-lambda repository from Github](https://github.com/SumoLogic/opentelemetry-lambda).
- Run command: `cd collector && make publish-layer` to publish OpenTelemetry Collector Lambda layer in your AWS account and get its ARN

Be sure to:

* Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
* Config [AWS credential](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

## Installing
To install the OpenTelemetry Collector Lambda layer to an existing Lambda function using the `aws` CLI:

```
aws lambda update-function-configuration --function-name Function --layers <your Lambda layer ARN>
```

Alternatively, to configure the OpenTelemetry Lambda Extension via CloudFormation template, add the following configuration:

```yaml
  Function:
    Type: AWS::Serverless::Function
    Properties:
      Layers:
        - <your Lambda layer ARN>
      ...
```

## Configuration

By default, OpenTelemetry Collector Lambda layer exports telemetry data to [Sumo Logic HTTP Traces Source](https://help.sumologic.com/Traces/HTTP_Traces_Source). 

Here is a sample configuration file:

```yaml
receivers:
  otlp:
    protocols:
      grpc:
      http:

exporters:
  otlphttp:
    traces_endpoint: $SUMOLOGIC_HTTP_TRACES_ENDPOINT_URL

service:
  pipelines:
    traces:
      receivers: [otlp]
      exporters: [otlphttp]
```

Once the file has been deployed with a Lambda, configuring the `SUMOLOGIC_HTTP_TRACES_ENDPOINT_URL` environment variable will tell the OpenTelemetry extension where to export traces:

```
aws lambda update-function-configuration --function-name Function --environment Variables={SUMOLOGIC_HTTP_TRACES_ENDPOINT_URL=YOUR_SUMO_LOGIC_HTTP_TRACES_SOURCE_URL}
```

You can configure environment variables via CloudFormation template as well:

```yaml
  Function:
    Type: AWS::Serverless::Function
    Properties:
      ...
      Environment:
        Variables:
          SUMOLOGIC_HTTP_TRACES_ENDPOINT_URL: YOUR_SUMO_LOGIC_HTTP_TRACES_SOURCE_URL
```

You can configure arguments passed to the collector command line with the
`OPENTELEMETRY_COLLECTOR_ARGS` environment variable.

```yaml
  Function:
    Type: AWS::Serverless::Function
    Properties:
      ...
      Environment:
        Variables:
          OPENTELEMETRY_COLLECTOR_ARGS: --set=service.telemetry.logs.level=debug
```
