
![Intro figure](https://github.com/HuguesTHOMAS/KPConv/blob/master/doc/Github_intro.png)

### [Created by Hugues THOMAS](https://github.com/HuguesTHOMAS/KPConv)


### Update 27/04/2020: [PyTorch implementation](https://github.com/HuguesTHOMAS/KPConv-PyTorch) available. With SemanticKitti, and Windows supported.

This repository contains the implementation of **Kernel Point Convolution** (KPConv), a point convolution operator 
presented in our ICCV2019 paper ([arXiv](https://arxiv.org/abs/1904.08889)). 

**Update 03/05/2019, bug found with TF 1.13 and CUDA 10.** 
We found an internal bug inside tf.matmul operation. It returns absurd values like 1e12, leading to the 
apparition of NaNs in our network. We advise to use the code with CUDA 9.0 and TF 1.12.
More info in [issue #15](https://github.com/HuguesTHOMAS/KPConv/issues/15)


## Installation

A step-by-step installation guide for Ubuntu 16.04 is provided in [INSTALL.md](./INSTALL.md). Windows is currently 
not supported as the code uses tensorflow custom operations.


## Performances

The following tables report the current performances on different tasks and datasets. Some scores have been improved 
since the article submission.

### Classification and segmentation of 3D shapes

| Method | ModelNet40 OA | ShapeNetPart classes mIoU | ShapeNetPart instances mIoU |
| :--- | :---: | :---: | :---: |
| KPConv _rigid_      | **92.9%** | 85.0%   | 86.2%   |
| KPConv _deform_     | 92.7%   | **85.1%** | **86.4%** |

### Segmentation of 3D scenes

| Method | Scannet mIoU |  Sem3D mIoU  |  S3DIS mIoU  |  NPM3D mIoU  |
| :--- | :---: | :---: | :---: | :---: |
| KPConv _rigid_      | **68.6%** | **74.6%** | 65.4%   | 72.3%   |
| KPConv _deform_     | 68.4%   | 73.1%  | **67.1%** | **82.0%** |


## TO USE IN DALES DATASET

Use the [convert.py](convert.py) to convert the DALES ascii ply file to bin ply file.
copy the convert.py to the location of the ascii ply files and run it.<br>
Utilize [requirements](pipenvlist.txt) and [conda_env](envlist.txt)
For conda env creation you can use :
```
conda create --name <name of your choice> --file envlist.txt
```
and for pip
```
pip install -r pipenvlist.txt
```


