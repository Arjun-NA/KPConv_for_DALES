# This file is a summary of hyperparameter that was adjusted to improve accuracy

For KP Convolution the following parameters change the network complexity :
  1.  architecture: Trivially this helps in varying the complexity of the network as required. The parameter is provided as a list of words that the software recognizes. The words/ modules that exist in this particular software are the followings
    - 'unary'
    - 'simple'
    - 'simple_strided'
    - 'resnet'
    - 'resnetb'
    - 'resnetb_light'
    - 'resnetb_deformable'
    - 'inceptiong_deformable'
    - 'resnetb_strided'
    - 'resnetb_light_strided'
    - 'resnetb_deformable_strided'
    - 'inception_deformable_strided'
    - 'vgg'
    - 'max_pool'
    - 'global_average'
    - 'nearest_upsample'
    - 'simple_upsample'
    - 'resnetb_upsample'
  2.  num_kernel_points: This parameter Highly influences the accuracy of the model as well as the complexity of the model. Correct tuning is required and this parameter should be an odd number
  3.  first_subsampling_dl: This parameter reduces the input cloud into a cloud with a min distance between points with the value provided for the variable.
  4.  in_radius: This is the radius of the sphere which is taken in for each iteration of the convolution.
  5.  density_parameter: Density of neighborhoods for deformable convs (which need bigger radiuses). For normal conv we use KP_extent.
  6.  KP_influence: This sets the behavior of the KPConv. Acceptable parameters are : 'linear','constant' and 'gaussian'.
  7.  convolution_mode: This sets another behavior of the KPConv. Acceptable parameters are: 'closest' and 'sum'.
  8.  batch_num: Batch number for training.
  9.  learning_rate: Learning rate of the network.
  10. Augmentation of the input: This is another crucial way to improve the model. This includes many variables  
      -  augment_scale_anisotropic = True
      -  augment_symmetries = [True, False, False]
      -  augment_rotation = 'vertical'
      -  augment_scale_min = 0.9
      -  augment_scale_max = 1.1
      -  augment_noise = 0.01
      -  augment_occlusion = 'none'
      -  augment_color = 1.0
 
## What I tried

- The architecture, to include Squeeze and Excite which did not provide a better result
- The architecture, reducing the number of layers decreased accuracy tremendously, thus 5 is the minimum number of layers for the dataset (one layer means the start of the model to a strided layer, the exception being the first layer).
- Radius of KPConv, More radius gained more accuracy (20 was optimum)
- density_parameter, no significant change was observed
- first_sabsampling_dl, there was variations and proper tuning is needed
- num_kernel_points, increasing was not possible due to Graphics card limits.
- KP_influence, tried gaussian but no good change was observed.
- convolution_mode, changed to closest but no improvement was observed.
