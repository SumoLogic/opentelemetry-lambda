variable "name" {
  type        = string
  description = "Name of created function and API Gateway"
  default     = "hello-nodejs-awssdk-test"
}

variable "architecture" {
  type        = string
  description = "Lambda function architecture, valid values are arm64 or x86_64"
  default     = "x86_64"
}

variable "application_name" {
  type        = string
  description = "Application attribute, expected key=value like application=YOUR_APPLICATION_NAME"
  default     = "application=nodejs-application"
}

variable "service_name" {
  type        = string
  description = "Application service name"
  default     = "nodejs-lambda-svc"
}

variable "traces_sampler" {
  type        = string
  description = "OpenTelemetry Traces Sampler configuration"
  default     = "always_on"
}

variable "sumologic_http_traces_endpoint_url" {
  type        = string
  description = "Sumo Logic HTTP Traces URL"
}
