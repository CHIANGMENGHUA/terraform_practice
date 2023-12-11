terraform {
  backend "s3" {
    bucket = "terra-state-tr"
    key    = "terraform/backend"
    region = "ap-northeast-1"
  }
}
