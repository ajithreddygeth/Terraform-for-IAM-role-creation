terraform {
backend "s3" {
  #replace the bucket name with your bucket name 
bucket = "bucket_name "
#foldername/filename
key = "devops/devops3roles_three-roles"
region = "us-west-2"
#dynamo db table name to lock the state file 
dynamodb_table = "dynamo_db_table_name"
profile = "${var.account}"
}
}
