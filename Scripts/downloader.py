# -*- coding: utf-8 -*-
"""
This script download all the files from http://espice.ugr.es/espice/src/modelos_subckt/
and saves them in a folder, there are 1803 files so it takes a few minutes
"""

from bs4 import BeautifulSoup
import requests, os, urllib

target = 'http://espice.ugr.es/espice/src/modelos_subckt/'
save_folder = os.path.dirname(os.getcwd()) + '/download/'

if not os.path.exists(save_folder):
    os.makedirs(save_folder)
    print('{} created'.format(save_folder))

def get_models(site, folder):
    html = BeautifulSoup(requests.get(site).text, features="html.parser")
    for link in html.find_all('a'):
        href = link.get('href')
        
        if (href == '../' or href == 'http://subversion.tigris.org/'): # skip
            continue
        
        elif (href.find('/') != -1): # it is a sub folder
            sub_href = site + href
            sub_folder = folder + urllib.parse.unquote(href).split('/')[-2] + '/'
            
            if not os.path.exists(sub_folder):
                os.makedirs(sub_folder)
                print('{} created'.format(sub_folder))
            
            # iterate
            get_models(sub_href, sub_folder)
            
        else: #download
            print('Downloading {} in {}'.format(site + href, folder + href))
            mod = requests.get(site + href, allow_redirects=True)
            with open (folder + href, 'wb') as file:
                file.write(mod.content)

get_models(target, save_folder)
print('--end--')
