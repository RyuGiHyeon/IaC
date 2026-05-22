resource "aws_elasticache_serverless_cache" "main" {
  engine               = "valkey"
  major_engine_version = "7"
  name                 = "cache-test-board"
  description          = "Test Board Cache Server"

  subnet_ids         = var.private_subnet_ids
  security_group_ids = [var.sg_map["cache"]]
  cache_usage_limits {
    data_storage {
      minimum = 1
      maximum = 10
      unit    = "GB"
    }
    ecpu_per_second {
      minimum = 1000
      maximum = 2000
    }
  }
}
