# -*- coding: utf-8 -*-
"""
This script generate a file called Supported.txt
basing on the models found in the lib and mod files
"""

import os, re, pickle

folder = os.path.dirname(os.getcwd()) + '/Models/'
supported_txt_path = os.path.dirname(os.getcwd()) + '/Supported.txt'
supported_pickle_path = os.path.dirname(os.getcwd()) + '/Supported.pickle'

supported =	dict()

files_txt = list()
files_lib = list()
files_mod = list()
files_spi = list()
files_fam = list()
files_cir = list()
files_other = list()

# Function to extract models from spice file
def extrac_models(file, extract):
    with open(file, 'r', encoding="utf8", errors='ignore') as f:
        content = f.read().lower()

    for line in content.splitlines():
        if (line.startswith(extract)):
            model = re.split('\s', line)[1]
            if model: # Get rid of empty string
                add_model(model, file)

# Function to add model and the file from where it cames
def add_model(mod, path):
    if not mod in supported: # It is the first time we see this model
        supported[mod] = list()
        supported[mod].append(path) # Add to supported with the path to find it
    else: # It is a duplicate...
        if not path in supported[mod]: # ...but from a different file
            supported[mod].append(path) # So we add it
    

# Separate file by extension
for root, dirs, files in os.walk(folder):
    for name in files:
        f = os.path.join(root, name)
        extension = os.path.splitext(f)[1][1:].lower()
        
        if (extension == 'txt'):
            files_txt.append(f)
        elif (extension == 'lib'):
            files_lib.append(f)
        elif (extension == 'mod'):
            files_mod.append(f)
        elif (extension == 'spi'):
            files_spi.append(f)
        elif (extension == 'fam'):
            files_fam.append(f)
        elif (extension == 'cir'):
            files_cir.append(f)
        else:
            files_other.append(f)

# Lets see what we have
print('{} txt found'.format(len(files_txt)))
print('{} lib found'.format(len(files_lib)))
print('{} mod found'.format(len(files_mod)))
print('{} spi found'.format(len(files_spi)))
print('{} fam found'.format(len(files_fam)))
print('{} cir found'.format(len(files_cir)))
print('{} other kind found'.format(len(files_other)))
for f in files_other:
    print('Not recognized: {}'.format(f))
print()

# Extract model from lib files
for file in files_lib:
    extrac_models(file, '.model')

# Extract model from mod files
for file in files_mod:
    extrac_models(file, '.model')      

# Extract subckt from fam files
for file in files_mod:
    extrac_models(file, '.subckt')


print('There are {} models'.format(len(supported)))

# Write supported models and the path to find them to file
# Pickle file useful to load it later https://docs.python.org/3/library/pickle.html
with open(supported_pickle_path, 'wb') as file:
    pickle.dump(supported, file, protocol=pickle.HIGHEST_PROTOCOL)
    print('{} created'.format(supported_pickle_path))    

# Normal text file, good to be read by humans
with open(supported_txt_path, 'w') as file:
    ''' # Write part name and path
    for part, path in sorted(supported.items()):
        path = ' - '.join(p[p.index('KiCad-Spice-Library') + 19:] for p in path)
        file.write('{}\t{}\n'.format(part, path))
    '''
    # Write only part name
    for part in sorted(supported.keys()):
        file.write(part + '\n')
    print('{} created'.format(supported_txt_path))
