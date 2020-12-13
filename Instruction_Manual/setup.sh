#!/bin/bash
## Arjun's KPConv adjustments...
sudo mkdir -p -m 777 $HOME/lidar 
sudo chmod g+s $HOME/lidar
cd $HOME/lidar
git clone https://github.com/Arjun-NA/KPConv_for_DALES 

cd $HOME/lidar/KPConv_for_DALES
if ( ! /home/ubuntu/anaconda3/bin/conda env list | grep "^aerotronic" >/dev/null 2>&1 ); then
  /home/ubuntu/anaconda3/bin/conda env create --file ./aerotronic.yml
else
  echo "aerotronic conda environment is already present"
  echo "run conda activate aerotronic"
fi

eval "$(conda shell.bash hook)"
conda activate aerotronic
cd $HOME/lidar/KPConv_for_DALES/tf_custom_ops
TF_LIB=$(python3 -c 'import tensorflow as tf;print(tf.sysconfig.get_lib())' 2>/dev/null)

echo "TFLIB: " 
echo $TF_LIB
cd $TF_LIB
ls
sudo cp libtensorflow_framework.so.1 libtensorflow_framework.so
cd $HOME/lidar/KPConv_for_DALES/tf_custom_ops
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}${TF_LIB}
sh ./compile_op.sh


cd $HOME/lidar/KPConv_for_DALES/cpp_wrappers
sh ./compile_wrappers.sh


## Tmux Installation 
sudo apt-get --assume-yes install tmux
