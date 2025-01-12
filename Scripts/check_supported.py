#! /usr/bin/env python3
# -*- coding: utf-8 -*-
"""
This script checks if a given part is among the supported modules
and also identifies the file from which it comes.
"""

import os
import pickle
import sys
from termcolor import colored

root_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..')
supported_pickle_path = os.path.join(root_path, 'Supported.pickle')
supported_txt_path = os.path.join(root_path, 'Supported.txt')
supported = dict()

# Print the models and the file in which it is located
def print_match(part):
    try:
        paths = ['- {0}'.format(i) for i in supported[part]]
        print(colored(part, 'green') + ' found in')
        for path in paths:
            print(colored(path, 'yellow'))
    except Exception as e:
        print(colored('Error processing {}: '.format(part), 'red'), e)

# Get similar models
def get_similar(string):
    similar = list()
    for line in supported_str.splitlines():
        if string in line:
            similar.append(line)
    if string in similar: 
        similar.remove(string)  # We already printed this
    return similar

# Search
def search(module):
    if module not in supported_str:
        print(colored('{} not found!'.format(module), 'red'))
    elif module in supported_str and module not in supported:  # Typo?
        similar_part = ', '.join(get_similar(module))
        print(colored('{} not found, maybe you meant one of these: {}'.format(module, similar_part), 'red'))
    else:
        print_match(module)
        # Search also similar parts
        count = supported_str.count(module)
        if count > 1:
            print(colored('\nAlso, other {} similar part(s) have been found:\n'.format(count - 1), 'cyan'))
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
        print("Searching for " + colored(s, 'blue'))
        search(s.lower())
else:
    # Part to search
    print(colored('Write \'exit\' when you want to stop', 'magenta'))
    to_search = input(colored('Write here the part you are looking for: ', 'magenta')).strip().lower()
    while True:
        if to_search in ['exit', 'no']:
            print(colored('Bye bye', 'magenta'))
            sys.exit(0)
        elif to_search:
            search(to_search)
        to_search = input(colored('Would you like to do another search? ', 'magenta')).strip().lower()
