# **REQUIREMENTS:**
    MEDIAWIKI PROBLEM STATEMENT
    ( We expect this to be installed using below link. )

[Installation Guide](https://www.mediawiki.org/wiki/Manual:Running_MediaWiki_on_Red_Hat_Linux)


***
![image.png](./Images/Installation-1.png)

As Mentioned in the installation link, We are going to setup LAMP environment.
- L - Linux - CentOS   ( CentOS Linux is a rebuild of Red Hat Enterprise Linux ). 
- A - Apache
- M - MySQL
- P - PHP

FOR LAMP environment Setup We are going to use Docker images.
- Application Image - Contains CentOS , Apache, PHP
- MYSQL Image - MYSQL

### **SERVICES AND TOOLS USED:**
- TERRAFORM
- HELM
- KUBERNETES ( AZURE )
- AZURE
- DOCKERHUB
- Service Connection in Azure DevOps to Establish connection to Azure and DockerHub ![image.png](./Images/ServiceConnection-2.png).

## STEPS:
1. Create Infrastructure Using Terraform.
1. Trigger CI Pipeline by Pushing Some Changes to mediawiki Directory.
1. Check for the Website Url ( kubectl get svc -n media-wiki-ns )
1. Setup the Mediawiki Website and download the LocalSettings.php
1. Push the LocalSettings.php to mediawiki Directory


# **Create Infrastructure Using Terraform**
Run following commands in terraform directory

```
terraform init
terraform plan -out myplan
terraform apply myplan
```

![image.png](./Images/Commit-3.png)

Creates three resources
- Resource group
- Azure Kubernetes Service
- NodePool

# **Trigger CI Pipeline by Pushing Some Changes to mediawiki Directory.**

# _Simple Change is made to mediawiki Directory._
![image.png](./Images/Push-4.png)

# _Build Pipeline (CI) started running on trigger_
![image.png](./Images/CI-5.png)

# _Deploy Pipeline (CD) started running on trigger by completion of Build Pipeline_
![image.png](./Images/CD-6.png)

# _Deploy Pipeline (CD) requires Approval_
![image.png](./Images/Approval-7.png)
![image.png](./Images/Approval-8.png)

# _Post Approval CD gets triggerred and completed_
![image.png](./Images/CD-Complete-9.png)

# _Post Completion, see the status of deployment using the command 
`kubectl get all -n media-wiki-ns_`
![image.png](./Images/Kubectl-status-10.png)

# _Get External IP Address (Load Balancer IP - 4.188.3.246)_
![image.png](./Images/PublicIP-11.png)

# _Click on setup the wiki_
![image.png](./Images/Setup1-12.png)

![image.png](./Images/Setup2-13.png)

![image.png](./Images/Setup3-14.png)

# Values 
_Database-host = Name of DB service_

_Database-name = wiki_db ( added in Dockerfile.DB )_

_Database-password = root ( added in Dockerfile.DB )_
![image.png](./Images/Setup4-15.png)

![image.png](./Images/Setup5-16.png)

# _Create Wiki and User Account_
![image.png](./Images/Setup6-17.png)

# _Download LocalSettings.php_
![image.png](./Images/Setup7-18.png)

# _Add LocalSettings.php to mediawiki directory_
![image.png](./Images/LocalSettingCopy-19.png)

# _Push to the Repository_
![image.png](./Images/LocalSettingPush-20.png)

# _Pipeline started_ 
![image.png](./Images/CI-21.png)

# _Once Completed , Setup is Completed and is ready to Use._
![image.png](./Images/Completed-22.png)
