// displaying name of buckets
output "name" {
    description = "Name nof the bucket"
    value       = aws_s3_bucket.bucket.id
}