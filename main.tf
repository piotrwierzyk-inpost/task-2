module "network" {
  source = "./modules/network"
}

module "cloudsql" {
  source = "./modules/cloudsql"
  vpc_connection  = module.network.vpc_connection
  vpc_self_link   = module.network.vpc_self_link
}

module "storage" {
  source = "./modules/storage"
  project = var.project
  region  = var.region
  env     = var.env
}

module "cloudrun" {
  source = "./modules/cloudrun"

  project = var.project
  region  = var.region
  env     = var.env

  db_connection_name = module.cloudsql.connection_name
  db_user            = module.cloudsql.db_user
  db_pass            = module.cloudsql.db_pass

  vpc_connector_name = module.network.connector_name

  bucket_name = module.storage.bucket_name
}
