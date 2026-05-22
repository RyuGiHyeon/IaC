variable "burket" {
  type    = string
  default = "s3-xxxxxx-board"
}

variable "rds_endpoint" {
  type    = string
  default = "endpoint-xxxxxxxx"
}

variable "password" {
  type    = string
  default = "Passw0rd123"
}

variable "file_map" {
  description = "생성될 파일 정보 맵"
  type        = map(object(
    {
      key = string
    }
  ))
  default     = {
    db_script = {
      key = "db_script.sh"
    }
    web_script = {
      key = "web_script.sh"
    }
    sql    = {
        key = "db_init.sql"
    }
    config = {
        key = "config.php"
    }
  }
}

variable "database" {
  type = object(
    {
      db_name  = string
      hostname = string
      username = string
      password = string
    }
  )
  default = {
    db_name  = "test_board"
    hostname = "%"
    username = "webmaster"
    password = "P@ssw0rd"
  }
}
