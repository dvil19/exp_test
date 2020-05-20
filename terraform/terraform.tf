terraform {
  backend "s3" {
    encrypt = true
    region  = "us-east-1"
    bucket  = "exp-test-bucket-terraform"
    key     = "exp-test/terraform.tfstate"

    #ksm_key_id     = "alias/terraform"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}


