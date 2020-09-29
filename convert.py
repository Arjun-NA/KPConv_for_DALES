from plyfile import PlyData, PlyElement, PlyProperty, PlyListProperty
from os import listdir,path

to_ascii = False
file_path = '.'
files = [f for f in listdir(file_path) if f[-4:] == '.ply']
for each_file in files:
    print('\n Loading.... ', path.join(file_path, each_file) )
    data = PlyData.read(path.join(file_path, each_file) )
    print('\n Loaded..... ', path.join(file_path, each_file) )
    data.elements[0].data.dtype.names = ['x', 'y', 'z', 'reflectance', 'class']
    data.elements[0].properties = (PlyProperty('x', 'float'), PlyProperty('y', 'float'),
                                   PlyProperty('z', 'float'), PlyProperty('reflectance', 'int'),
                                   PlyProperty('class', 'int'))
    data1 = PlyData([data.elements[0]], text=to_ascii)
    data1.write(path.join(file_path,'bin_'+ each_file) )
    print('\n completed.. ', each_file)
    data2 = PlyData.read(path.join(file_path, 'bin_'+each_file) )
    print(data.elements[0])
    print('\n')
