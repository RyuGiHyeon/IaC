variable "ACCESS_KEY" {
  type    = string
  default = ""

}

variable "SECRET_KEY" {
  type    = string
  default = ""

}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "region_name" {
  type    = string
  default = "seoul"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "sg_map" {
  type = map(object(
    {
      name = string
      desc = string
      ingress = object(
        {
          protocol    = string
          from_port   = number
          to_port     = number
          cidr_blocks = list(string)
        }
      )
      egress = object(
        {
          protocol    = string
          from_port   = number
          to_port     = number
          cidr_blocks = list(string)
        }
      )
    })
  )
  default = {
    ssh = {
      name = "fw-ssh"
      desc = "fw allow traffic - ssh"
      ingress = {
        protocol    = "tcp"
        from_port   = 22
        to_port     = 22
        cidr_blocks = ["200.100.100.10/32"]
      }
      egress = {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    http = {
      name = "fw-http"
      desc = "fw allow traffic - http"
      ingress = {
        protocol    = "tcp"
        from_port   = 80
        to_port     = 80
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress = {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    mysql = {
      name = "fw-mysql"
      desc = "fw allow traffic - mysql"
      ingress = {
        protocol    = "tcp"
        from_port   = 3306
        to_port     = 3306
        cidr_blocks = ["10.0.0.0/16"]
      }
      egress = {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
  }
}

variable "sg_list" {
  type = list(object(
    {
      name = string
      desc = string
      ingress = object(
        {
          protocol    = string
          from_port   = number
          to_port     = number
          cidr_blocks = list(string)
        }
      )
      egress = object(
        {
          protocol    = string
          from_port   = number
          to_port     = number
          cidr_blocks = list(string)
        }
      )
    })
  )
  default = [
    {
      name = "fw-ssh"
      desc = "fw allow traffic - ssh"
      ingress = {
        protocol    = "tcp"
        from_port   = 22
        to_port     = 22
        cidr_blocks = ["200.100.100.10/32"]
      }
      egress = {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
      }
    },
    {
      name = "fw-http"
      desc = "fw allow traffic - http"
      ingress = {
        protocol    = "tcp"
        from_port   = 80
        to_port     = 80
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress = {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
      }
    },
    {
      name = "fw-mysql"
      desc = "fw allow traffic - mysql"
      ingress = {
        protocol    = "tcp"
        from_port   = 3306
        to_port     = 3306
        cidr_blocks = ["10.0.0.0/16"]
      }
      egress = {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
  ]
}

