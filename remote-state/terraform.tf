terraform {
  backend "s3" {
    bucket = "terraform--state123"
    key    = "terraform--state123/key"
    region = "us-east-1"
    dynamodb_table = "value"
  }
}
# create a dynamoDb table with LockID partition