# Launching and Setting up the instance

This page is a guide to setup the instance with required configurations and connecting to it so as to create the environment required for the training and testing of KPConv

## 1.	Recommended Instance Details 

```
Instance Type   : g4dn.2xlarge (for training); g4dn.xlarge (for testing)
Instance OS	: Deep Learning AMI (Ubuntu 18.04) Version 37.0
Hard Disk	: 150 GB SSD
Hard Disk-2	: 500 GB HDD Magnetic 	
``` 

## 2.	Launching the instance

On Amazon Console goto `EC2` from the `Services` menu in the top left corner. <br> 
Create an Instance using the `Launch instance` button. <br>
*   Steps to Launch Instance:  
    1.    Choose AMI. Utilise the recommended Instance details to set this.
    2.    Choose Instance Type. Utilise the recommended Instance details to set this.
    3.    Configure Instance. In the `Advanced Details` tab, for `User data` select `As file` and use `choose file` to upload setup.sh
    4.    Add Storage. Utilise the recommended Instance details to set this.
    5.    Review and Launch.   
 
Save the key pair generated from the launch (let's call it aws_key.pem). 
  
   
(Error may occur due to dedicated host limit which can be increased by request).<br> 
Choose a consistent region for your Amazon machines and plugs (Used US-east-2c which is the same as US Ohio).  

## 3.	Connecting to the instance

Connecting is done via ssh. If using windows utilize 

 *	WinSCP
 *	Putty

Using putty :

While creating the Instance you will get a *.pem(eg: aws_key.pem) file key. using this as the key for ssh connect using  
*	For Linux :   
` ssh -i "aws_key.pem" ubuntu@ec2-xxxxxx.compute.amazonaws.com `  

*	For windows :   
		1.	If ssh works in your shell you can follow the same as the Linux method.  
		2.	Use putty-gen to convert the key to .ppk format. Use [this link](https://www.puttygen.com/convert-pem-to-ppk) for more details.   
		3.	After the conversion of the key to PPK format. Use "Pageant" software and add this key to it.  
		4.	You will be able to connect with putty now, using the 'ubuntu@ec2-xxxxxx.compute.amazonaws.com' as the hostname.  
>**Host Name**  
If the hostname is unknown you can log in to the Amazon management console and choose EC2 from services which will lead you to EC2 Dashboard.  
In this dashboard, you can choose the running instance and click on 'connect' on the top right side. 
The 'SSH Client' tab will show you the methods to connect along with your actual hostname.
## 4.	File transfer to and from the Instance
**In Linux**  
You can do file transfer from your local pc to the instance via SCP commands after the ssh connection is complete.  
**In Windows**  
You can use WinSCP for the same (more convenient). For more details use [this link](https://winscp.net/eng/docs/guide_public_key)

## 5.	Configuring the instance for KPConv
-	After successfully logging into the instance. Transfer the setup.sh file to the {Home} location and run it.-  
-	Mount the extra 500 GB HDD to the system using the guide [AWS_help.md](AWS_help.md)
-	Copy the files of data into a specific folder (Preferably in the 500GB HDD):(yet to make this change in code from ../Data/)  
Create the folder tree looks like this
```
├── Data
│   ├── test_bin
│   └── train_bin
│ 
└── KPConv_for_DALES
    ├── INSTALL.md
    ├── LICENSE
    ├── README.md
    ├── convert.py
    ├── cpp_wrappers
    ├── datasets
    ├── doc
    ├── envlist.txt
    ├── kernels
    ├── models
    ├── pipenvlist.txt
    ├── plot_convergence.py
    ├── results
    ├── test
    ├── test_accuracy.py
    ├── test_any_model.py
    ├── tf_custom_ops
    ├── training_DALES.py
    ├── training_ModelNet40.py
    ├── training_NPM3D.py
    ├── training_S3DIS.py
    ├── training_Scannet.py
    ├── training_Semantic3D.py
    ├── training_ShapeNetPart.py
    ├── utils
    ├── visualize_ERFs.py
    ├── visualize_deformations.py
    └── visualize_features.py
```
In this tree, test_bin and train_bin contain the files for test and train respectively in binary ply format.
-	If necessary to convert *' ASCII ply'* file format to *'binary ply'* format utilize **"convert.py".** by copying the **convert.py** to the location of the ASCII ply files and run it.
