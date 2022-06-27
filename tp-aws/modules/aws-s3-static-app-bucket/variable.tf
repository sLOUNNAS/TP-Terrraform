variable "bucket_name" {
    description = "Name of the s3 bucket. Must be unique."
    type = string
}
variable "lambda_role_name" {
    type = string
}

variable "lambda_iam_policy_name" {
    type = string
}
variable "function_name" {
    type = string
}

