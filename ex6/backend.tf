terraform {
  backend "s3" {
    bucket = "terra-state-tr"
    key    = "terraform/ex6-backend"
    region = "ap-northeast-1"
  }
}
