provider "aws" {
  region = "eu-central-1"
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.sample.id
  acl    = "public-read"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

  # acl    = "public-read"
  # region = "eu-central-1"

  tags = {
    public_bucket = true
  }
}
