# standardtfmodules
standard terraform modules

Making a standard Infrastructure as a code is not easy tasks. In this source repository i will try to make modular infrastructure so anything from web-server to kubernetes can be initialised with basic settings by just pulling and running these codes.

For Now, we have following modules.

# Modules

1. Build
2. Test
3. Production


Inside of each module we will create set of standard .tf files required for implementing basic infrastructure.


# product( root modulr)
  product module is root module and contains production content and sub-modules.
    
      
            a. vendoraccess.tf
            b. terraform.tfvars
            c. accesskey.tf
            d. variables.tf
            e. output.tf
            
            securitygroup(sub-module)
            vendoracces(sub-module)
            

  # 1. Build(sub-module)
     a. vendoraccess.tf
     b. terraform.tfvars
     c. accesskey.tf
     d. variables.tf
     e. output.tf

  # 2. Test(sub-module)
     a. vendoraccess.tf
     b. terraform.tfvars
     c. accesskey.tf
     d. variables.tf
     e. output.tf

  # 3. Production(sub-module)
     a. vendoraccess.tf
     b. terraform.tfvars
     c. accesskey.tf
     d. variables.tf
     e. output.tf
