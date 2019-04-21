# KiCad Spice Library
This organization and repo is born from the need of having an easy way to find Spice models. It is not made by KiCad or Spice itself but it is user powered

## Modules
In this folder there are all the modules and libraries, I tried to organize them with a minimum of logic but better approaches then mine are really welcome

## Supported.txt
This is the list of supported parts in a human readable way, useful if you wish to do a quick search

## Scripts

### check_supported
This script check if a given part is between the supported modules. If yes it says us from which file it cames so we can easily add to our Spice simulation. It also contain a simple but working wrong-spell checks. See the examples at the end of the README

In the future it could be easily turned into a command line interface script or maybe a KiCad plugin

### generate_supported
This script generate the list of supported modules, it should be run only when new files are added to the repo

NOTE: Right now there is a **lot** to improve here, I am extracting only the `.model` from `*.lib` and `*.mod` files and the `.subckt` from `*.fam` files so there are still **many** hidden modules around

### downloader
This script downloaded all the 1803 files from http://espice.ugr.es/espice/src/modelos_subckt/ and saved them. It is not needed anymore and is here only for reference

## Supported.pickle
This file is a [python serialized dictionary](https://docs.python.org/3/library/pickle.html) where every key is a model and the items are path to libraries where that model is defined. It is not made to be read by humans, use [Supported.txt](Supported.txt) instead

# License

I do not own any license for the files inside the `Modules` folder, if you find any of them that breaks a license open an issue or send a message and it would be removed as soon as possible. All library, modules and other are released with their own license. The GPL3 is related only to the files in the `Scripts` folder

# Contribuite

Do a pull request, add a library, module, whatever in the category that suit better in [Modules](/Modules) or improve the python scripts or surprise me!

I would like to accept in the organization other KiCad or Spice fans to keep this page going on, if you would like to partecipate open an issue

# Resources
- http://espice.ugr.es/espice/src/modelos_subckt/
- https://github.com/ryansturmer/kicad-spice-library
- https://groups.yahoo.com/neo/groups/LTspice/info


# Examples

Here there are a few possible usage scenarios:

- Searching `bc337`
```
Searching bc337 between 8004 models:
Found!

bc337 found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib

Also other 7 similar part has been found:

bc337ap found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib
bc337s found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib
qbc337-16/plp found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib
qbc337-25/plp found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib
qbc337-40/plp found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib
qbc337/plp found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib
qbc337a/plp found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib
```

- Searching `2n2222`
```
Write here the part you are looking for: 2n2222
Searching 2n2222 between 8004 models:
Found!

2n2222 found in /Models/uncategorized\IdealDiode.lib

Also other 4 similar part has been found:

2n2222a found in /Models/uncategorized\spice_complete\zetex.lib, /Models/uncategorized\spice_complete\zmodels.lib
2n2222c found in /Models/uncategorized\spice_complete\ad.lib
q2n2222 found in /Models/uncategorized\spice_complete\cadlab.lib
q2n2222a found in /Models/Manufacturer\TRT-Electronics\2n2222a.lib, /Models/Manufacturer\Zetex Semiconductors\ZMODELS.LIB, /Models/uncategorized\spice_complete\cadlab.lib
```
NOTE: this is actually quite a good example because it shows us that we have this IC produced by different manufacturers, so we can pick the model more similar to our use case

- If we don't know/remember perfectly the IC we are looking for
```
Searching 2n2 between 8004 models:
Not found, maybe you meant one of these: 2n2102_on, 2n2222, 2n2222a, 2n2222c, q2n2219, q2n2219a, q2n2222, q2n2222a, q2n2905, q2n2905a, q2n2907, q2n2907a
```

- Searching less common part like the `2sa1940`
```
Write here the part you are looking for: 2sa1940
Searching 2sa1940 between 8004 models:
Not found, maybe you meant one of these: q2sa1940

Would you like to do another search? q2sa1940
Searching q2sa1940 between 8004 models:
Found!

q2sa1940 found in /Models/uncategorized\spice_complete\other_models\BJT_PNP\TOSH_PWR.LIB

Would you like to do another search? exit
Bye bye
```

Just for reference this is the output that I got from `generate_supported` the first time I run this project
```
5 txt found
375 lib found
290 mod found
699 spi found
71 fam found
356 cir found
9 other kind found

There are 8004 models
```