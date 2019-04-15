# standardtfmodules
standard terraform modules

Making a standard Infrastructure as a code is not easy tasks. In this source repository i will try to make modular infrastructure so anything from web-server to kubernetes can be initialised with basic settings by just pulling and running these codes.

For Now, we have following modules.

# Modules

1. Build
2. Test
3. Production


Inside of each module we will create set of standard .tf files required for implementing basic infrastructure.


# product(root)
  product module is root module and contains production content and sub-folders.
    
            1. main.tf 
            2. provider.tf          ✅ 
            3. terraform.tfvars
            4. accesskey.tf
            5. variables.tf         ✅ 
            6. output.tf
            7. terraform.tfstates   ✅ 
            
     
            securitygroup(module)
            
            
Inside of the product folder there are three sub folders with the naming convention of build, test and production.

  # 1. Build(sub-folder)
     a. vendoraccess.tf
     b. terraform.tfvars
     c. accesskey.tf
     d. variables.tf
     e. output.tf

  # 2. Test(sub-folder)
     a. vendoraccess.tf
     b. terraform.tfvars
     c. accesskey.tf
     d. variables.tf
     e. output.tf

  # 3. Production(sub-folder)
       contains the copy of product folder which is root folder.
     a. vendoraccess.tf
     b. terraform.tfvars
     c. accesskey.tf
     d. variables.tf
     e. output.tf



# Production folder contents
  # Main.tf
    1. Should connect to AWS and perform authentication.
    2. Should create a small S3 bucket with filename as name of the project for checking project from CLI
       # $aws s3 ls
    3. Move your state file ".tfstate" to S3 bucket. Name convention can be project.tfstate
   
   
