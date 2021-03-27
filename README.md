
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
## MY RESULTS IN DALES DATASET
The result of the testing is uploaded [here](https://indiana-my.sharepoint.com/:u:/g/personal/arjuna_iu_edu/ERlV6lBVnQtMvAyfloE354YBNUglxQbroAUnGds8x8Rjcg?e=vIk490)
and the [test_accuracy.py](./test_accuracy.py) was used to calculate F1 scores which gave [this](./Log_2020-09-29_02-19-56/F1_Score.txt) result with Final Avg micro F1 : 0.97 | Avg macro F1: 0.72. This result was far better than any other point convolutions I had used.
