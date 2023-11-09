#! /usr/bin/env python3
# -*- coding: utf-8 -*-
"""
This script check if a given part is between the supported modules
and also from which file it cames
"""

import os, pickle, sys

root_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..')
supported_pickle_path = os.path.join(root_path, 'Supported.pickle')
supported_txt_path = os.path.join(root_path, 'Supported.txt')
supported = dict()

# Print the models and the file in which it is located
def print_match(part):
    try:
        paths = ['- {0}'.format(i) for i in supported[part]]
        print(part + ' found in')
        print(*paths, sep = '\n')
    except Exception as e:
        print('Error processing {}: '.format(part), e)

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
    if not module in supported_str:
        print('{} not found!'.format(module))
        
    elif module in supported_str and not module in supported: # Typo?
        similar_part = ', '.join(get_similar(module))
        print('{} not found, maybe you meant one of these: {}'.format(module, similar_part))
        
    else:
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

if len(sys.argv) > 1:
    for s in sys.argv[1:]:
        print("Searching for " + s)
        search(s.lower())
else:
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
