
# AWS Commands for EC2 instance
 
Basics and Advanced commands which is useful for setting up and running Amazon AMI EC2 instance.   

## Managing External Storage  
  
For more detailed guide [try here](https://www.digitalocean.com/community/tutorials/how-to-partition-and-format-storage-devices-in-linux)  
Command used to list all usable storage  
```
sudo lsblk
```  
Some versions of lsblk will print all of this information if we type:
```
sudo lsblk --fs
```
Command for creating partition
```
sudo parted /dev/sda mklabel gpt
sudo parted -a opt /dev/sda mkpart primary ext4 0% 100%
```  

Create a Filesystem on the New Partition
```
sudo mkfs.ext4 -L datapartition /dev/sda1
``` 
  

## Mounting an extra storage eg: HDD storage  

Create the mounting point using the following commands  
```
cd /
sudo mkdir media/NewVol/
```
Adding storage to the running instance. (You should have already done the volume attach to the instance from the AWS Management Console)
```
cd /
sudo mount -t ext4 /dev/[storage_name] /media/NewVol/
``` 
<br>
[storage_name] 
: This should be found out on your own. This can be found out by checking command `lsblk` or the directory list using the ``` ls``` command in /dev/ folder before and after you attach the volume (Notice the change in it) to the instance via AWS Management Console.
<br>some common names look like nvme1n1 or SDF or XDF or XVDF where F is variable
  


## Copying files from/to s3 
```
aws s3 cp filename_from filename_to  
aws s3 cp --recursive folder_from folder_to  
```

## Copying folder from local storage to AWS s3 
As the usage of cp does not help in copying folder from the instance to the s3 cloud we utilize sync <br>
```
aws s3 sync folder_to_copy S3_URL 
```

## Configuring AWS credentials to access S3  
Fix for the error **"Unable to locate credentials"**  

### Quick configuration with aws configure

For general use, the aws configure command is the fastest way to set up your AWS CLI installation.  

the AWS CLI prompts you for four pieces of information:
- Access key ID (for each user have max 2. It can be found from IAM -> Users ->Select user -> Security credentials )
- Secret access key (for each user have max 2)
- AWS Region (eg: us-east-2)
- Output format  (you can leave it at none)

  




