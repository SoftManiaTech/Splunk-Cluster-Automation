# Prerequires:

## 1. Install "Terraform CLI"
- Download Terraform: https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_windows_amd64.zip.
- Navigate file **downloaded folder.**
- Right click an** Terraform zip** file and Select **Extract all**.
- Click Browse **C:\terraform** create this directory and** Select Folder**.
- Click **Extract.**


### Add Environment Vaiables
- Click Windows button Type "**Edit the system environment variables**" hit** enter.**
- Click** Environment Variables.**.. button.
- User **variable table **> Double click on **Path**.
- Click New > Type **"C:\terraform" **hit enter and click** OK**.
- Again **OK**.
- Verify App is installed - Open cmd type **"terraform -v"**
  **- response **
    - Terraform v1.10.5
    - on windows_amd64
## 2. Install "AWS CLI"
- Download AWS CLI https://awscli.amazonaws.com/AWSCLIV2.msi 
- Follow App Interactions you can install.
- Verify App is installed - Open cmd type "aws --version"
  - response 
    - aws-cli/2.23.12 Python/3.12.6 Windows/11 exe/AMD64
   
## 3. Create "AWS IAM Security Credentials"
- Open your AWS** IAM services** page.
- Page right side** Quick Links tab** click **My security credentails.** (you can run this only root user)
- In the Access keys tab, Click **Create access key**
- click on **checkbox **> Click Create access key button.
- You can see your access key.
- Download and **save your credentials** for feature usage.
## 4. Configure AWS CLI
- Open Commend Prompt
- Run following commends.
```
aws configure

  AWS ACCESS Key ID [None]: <Your-Access-key>
  AWS Secret Access Key [None]: <You-secret-access-key>
  Default region name [None]: <frequently-using-region-name>
  Default output format [None]: <click-enter>
