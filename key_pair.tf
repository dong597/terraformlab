resource "aws_key_pair" "aws_key" {
  key_name   = "aws_key"
  public_key = file("/root/terraformlab/lab5_aws/awskey.pem.pub")
}