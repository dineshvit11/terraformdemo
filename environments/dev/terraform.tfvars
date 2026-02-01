rgs = {
  rg1 = {
    name       = "rg-dev-tfdemo-dk"
    location   = "west us"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }

}

networks = {
  vnet1 = {
    name                = "vnet-dev-tfdemo-01"
    location            = "west us"
    resource_group_name = "rg-dev-tfdemo-dk"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  app1 = {
    name                = "pip-dev-tfdemo-01"
    resource_group_name = "rg-dev-tfdemo-dk"
    location            = "west us"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "dev"
    }
  }
  app2 = {
    name                = "pip-dev-tfdemo-02"
    resource_group_name = "rg-dev-tfdemo-dk"
    location            = "west us"
    allocation_method   = "Static"
    tags = {
      app = "frontend"
      env = "dev"
    }
  }
}


key_vaults = {
  kv1 = {
    kv_name  = "kv-dev-tfdemo-dk"
    location = "west us"
    rg_name  = "rg-dev-tfdemo-dk"
  }
}

key_vault_secrets = {
  vm_username_vm1 = {
    name   = "vm-username-vm1"
    value  = "adminuser1"
    kv_key = "kv1"
  }
  vm_password_vm1 = {
    name   = "vm-password-vm1"
    value  = "AdminPass1@123"
    kv_key = "kv1"
  }
  vm_username_vm2 = {
    name   = "vm-username-vm2"
    value  = "adminuser2"
    kv_key = "kv1"
  }
  vm_password_vm2 = {
    name   = "vm-password-vm2"
    value  = "AdminPass2@123"
    kv_key = "kv1"
  }
}



sql_servers = {
  sql1 = {
    sql_server_name = "sql-dev-tfdemo-dk"
    rg_name         = "rg-dev-tfdemo-dk"
    location        = "west us"
    admin_username  = "devopsadmin"
    admin_password  = "Administrator1@123"
    tags = {
      env = "dev"
    }
  }
}

sql_dbs = {
  db1 = {
    sql_db_name  = "sqldb-dev-tfdemo"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb  = "2"
    sku_name     = "GP_Gen5_2"
    compute_model = "Serverless"
    enclave_type = "VBS"
    min_capacity = 0.5
    auto_pause_delay_in_minutes = 60 
    
    tags = {
      env = "dev"
    }
  }
}


vms = {
  vm1 = {
    vm_name   = "vm-dev-tfdemo-01"
    kv_name   = "kv-dev-tfdemo-dk"
    rg_name   = "rg-dev-tfdemo-dk"
    location  = "westus"
    size      = "Standard_D2ads_v6"
    nic_name  = "nic-dev-tfdemo-01"
    pip_name    = "pip-dev-tfdemo-01"
    subnet_name = "frontend-subnet"
    vnet_name   = "vnet-dev-tfdemo-01"
    subnet_key = "subnet1"
    pip_key    = "pip1"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts-gen2"
      version   = "latest"
    }
  }

  vm2 = {
    vm_name   = "vm-dev-tfdemo-02"
    kv_name   = "kv-dev-tfdemo-dk"
    rg_name   = "rg-dev-tfdemo-dk"
    location  = "westus"
    size      = "Standard_D2ads_v6"
    nic_name  = "nic-dev-tfdemo-02"
    pip_name    = "pip-dev-tfdemo-02"
    subnet_name = "backend-subnet"
    vnet_name   = "vnet-dev-tfdemo-01"
    subnet_key = "subnet2"
    pip_key    = "pip2"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts-gen2"
      version   = "latest"
    }
  }
}


