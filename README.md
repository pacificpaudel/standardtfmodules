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
    
        main.tf
        variables.tf
        vpc.tf	
        sg.tf
        loadbalancer.tf
        output.tf
        userdata.tf	
        	

            
            
Inside of the product folder there are three sub folders with the naming convention of build, test and production.

  # 1. Build(sub-folder)
     

  # 2. Test(sub-folder)
     

  # 3. Production(sub-folder)
       


# Production folder contents
  # Main.tf
    1. Should connect to AWS and perform authentication.
    2. Should create a small S3 bucket with filename as name of the project for checking project from CLI
       # $aws s3 ls
    3. Move your state file ".tfstate" to S3 bucket. Name convention can be project.tfstate
   
   
