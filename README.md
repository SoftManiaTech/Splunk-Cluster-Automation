# Prerequires:

## 1. Install "Terraform CLI"
- Download Terraform: https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_windows_amd64.zip.
- Navigate file **downloaded folder.**
- Right click an **Terraform zip** file and Select **Extract all**.
- Click Browse **C:\terraform** create this directory and **Select Folder**.
- Click **Extract.**


### Add Environment Vaiables
- Click Windows button Type "**Edit the system environment variables**" hit** enter.**
- Click **Environment Variables** ... button.
- User **variable table**> Double click on **Path**.
- Click New > Type **"C:\terraform" **hit enter and click** OK**.
- Again **OK**.
- Verify App is installed - Open cmd type **"terraform -v"**
  **- response**
    - Terraform v1.10.5
    - on windows_amd64
## 2. Install "AWS CLI"
- Download AWS CLI https://awscli.amazonaws.com/AWSCLIV2.msi 
- Follow App Interactions you can install.
- Verify App is installed - Open cmd type "aws --version"
  **- response**
    - aws-cli/2.23.12 Python/3.12.6 Windows/11 exe/AMD64
   
## 3. Create "AWS IAM Security Credentials"
- Open your AWS **IAM services** page.
- Page right side **Quick Links tab** click **My security credentails.** (you can run this only root user)
- In the Access keys tab, Click **Create access key**
- click on **checkbox**> Click Create access key button.
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

```
---

## Before using this automation to create a Splunk Enterprise instance, you must first subscribe to Splunk Enterprise on the AWS Marketplace.

Additionally, ensure that you have sufficient AWS credits and follow these guidelines:

**Instance Count:** Must be below `8`.
- If you are using between 6 to 8 instances, do not add an Elastic IP.

---


## Splunk AMI - (latest version)

splunk enterprise version of ami findout here: https://aws.amazon.com/marketplace/server/configuration?productId=7b65de6c-5006-4ca2-bd75-fdba95ae5d9d

- ap-southeast-1(Singapure) - ami-08f75f3652f7d91ef
- us-east-2 (Ohio) - ami-092484aa52514c4fd
- us-west-2 (Oregon) - ami-0f59e596bfab2d9cf
- us-east-1 (Virginia) - ami-09041c38b0523b954
- us-west-1 (N. California) - ami-0f6eefa9bcd20c6fe
- ap-south-1 (Mumbai)- ami-0ce2b421400012344
- ap-southeast-2 (Sydney) - ami-073d1f71ff3f1b969
- ap-northeast-3 (Osaka) - ami-0c21205c1ccc847b2
- ap-northeast-2 (Seoul) - ami-0eddf325ed0603e40
- ap-northeast-1 (Tokyo) - ami-03fe4f0017a618b75
- ca-central-1 (Central) - ami-0ea202e2fd68e541a
- eu-central-1 (Frankfurt) - ami-0b43a36b3d38be336
- eu-west-1 (Ireland) - ami-079f8d6cfabe5a428
- eu-west-2 (London) - ami-0b6374030d6461abe
- eu-west-3 (Paris) - ami-0265048c92cbd07fa
- eu-north-1 (Stockholm) - ami-084f0bd811ba09257

- redhat AWS EC2 AMI https://access.redhat.com/solutions/15356#us_east_1
- Ubuntu AWS EC2 AMI https://cloud-images.ubuntu.com/locator/ec2/
