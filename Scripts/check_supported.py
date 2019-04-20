# -*- coding: utf-8 -*-
"""
This script check if a given part is between the supported modules
and also from which file it cames
"""

import os, pickle, sys

supported_pickle_path = os.path.dirname(os.getcwd()) + '/Supported.pickle'
supported_txt_path = os.path.dirname(os.getcwd()) + '/Supported.txt'
supported = dict()

# Print the models and the file in which it is located
def print_match(part):
    path = ', '.join(p[p.index('KiCad-Spice-Library')+19:] for p in supported[part])
    print('{} found in {}'.format(part, path))
    
# Get similar models
def get_similar(string):
    similar = list()
    for line in supported_str.splitlines():
        if line.find(string) != -1:
            similar.append(line)
    if string in similar: similar.remove(string) # We already printed this
    return similar

# Search
def search(module):
    print('Searching {} between {} models:'.format(module, len(supported)))
    if not module in supported_str:
        print('Not found!')
        
    elif module in supported_str and not module in supported: # Typo?
        similar_part = ', '.join(get_similar(module))
        print('Not found, maybe you meant one of these: {}'.format(similar_part))
        
    else:
        print('Found!\n')
        print_match(module)
        
        # Search also similar parts
        count = supported_str.count(module)
        
        if count > 1:
            print('\nAlso other {} similar part has been found:\n'.format(count - 1))
            
            similar_part = get_similar(module)
            
            for part in similar_part:
                print_match(part)


# Load the supported dictionary using pickle
with open(supported_pickle_path, 'rb') as file:
    supported = pickle.load(file)

# Load the string of supported models
with open(supported_txt_path, 'r') as file:
    supported_str = file.read()


# Part to search
print('Write \'exit\' when you want to stop')
to_search = input('Write here the part you are looking for: ').strip().lower()

while True:
    if to_search in ['exit', 'no']:
        print('Bye bye')
        sys.exit(0)
    elif to_search:
        search(to_search)
    to_search = input('Would you like to do another search? ').strip().lower()
