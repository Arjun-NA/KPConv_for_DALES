# **NOTES**

### 1.  Error while execution compile.sh "-ltensorflow_core not found":
__*Reason*__ : Library files of Tensorflow in ubuntu systems are saved in .so format. For some weird reasons versions of them are saved as so.1 or so.2 and suddenly shell forgets what they are
'So' better go to the location of the include and see which is what. 

To see the location use this inside python or the conda environment python (whichever you created for your project):
```
import tensorflow as tf
print(tf.sysconfig.get_lib())
```
OR you could also do the following in normal shell/cmd do the following
```
TF_INC=$(python3 -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
TF_LIB=$(python3 -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
cd $TF_LIB
```
After that the variables TF_LIB will lead you to the location.
Where did I magically get these from? It's over here in [compile_op.sh](./tf_custom_ops/compile_op.sh)

Inside the location, you can either create a soft link like this [issue solution](https://github.com/HuguesTHOMAS/KPConv/issues/79)
or You can create a duplication of libtensorflow_framework.so.1 or libtensorflow_framework.so.2 with the name libtensorflow_framework.so
to do that you can use:
```
cp libtensorflow_framework.so.1 libtensorflow_framework.so
```
