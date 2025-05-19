# KiCad Spice Library
This organization and repo is born from the need of having an easy way to find Spice models. It is not made by KiCad or Spice themself but it is user powered

There are a total of 50.093 models

## Modules
In this folder there are all the modules and libraries, I tried to organize them with a minimum of logic but better approaches then mine are really welcome

## Supported.txt
This is the list of supported parts in a human readable way, useful if you wish to do a quick search

## Scripts

### check_supported.py
This script check if a given part is between the supported modules. If yes it says us from which file it cames so we can easily add to our Spice simulation. It also contain a simple but working wrong-spell checks. See the examples at the end of the README

In the future it could be easily turned into a command line interface script or maybe a KiCad plugin

### extractModels.pl
This script extracts the models for the requested components from the libraries.
You can redirect it to a file like 'localSpice.lib' in your KiCAD project to have a local copy to reference.  This avoids several side effects (libraries that are too big, libraries with invalid characters, duplicate models).
You can add the models you need to 'spiceModel.lst' so that you can automate the extraction in a script.

Run the script without parameters for help.

### generate_supported.py
This script generate the list of supported modules, it should be run only when new files are added to the repo

NOTE: Right now I am extracting the `.model` and `.subckt` from `*.lib` and `*.mod` files, the `.subckt` from `*.fam` files and the models from `EESchema-LIBRARY Version 2.x` so maybe there are some hidden modules around

### downloader.py
This script downloaded all the 1803 files from http://espice.ugr.es/espice/src/modelos_subckt/ and saved them. It is not needed anymore and is here only for reference

### GUI Application: SPICE Model Viewer
A cross-platform Tkinter app (`form_spice.py`) provides a user-friendly interface:

1. **Search tab**:
   - Enter a SPICE model name (e.g. `2n2222`).
   - See all matching variants and library paths.
   - Extract, export, or copy the full `.lib` file.
   - Automatically highlights the top-priority variant (Manufacturer > `spice_complete` > `uncategorized`).
2. **Configuration tab**:
   - Persistently set the path to your `Scripts` directory and your output folder.
   - Settings are saved to `Scripts/config.json` and reloaded on startup.

**To launch the GUI**:
```bash
$ cd Scripts
$ python form_spice.py
```

## Supported.pickle
This file is a [python serialized dictionary](https://docs.python.org/3/library/pickle.html) where every key is a model and the items are path to libraries where that model is defined. It is not made to be read by humans, use [Supported.txt](Supported.txt) instead

# License
I do not own any license for the files inside the `Modules` folder, if you find any of them that breaks a license open an issue or send a message and it would be removed as soon as possible. All library, modules and other are released with their own license. The GPL3 is related only to the files in the `Scripts` folder

# Contribuite
Do a pull request, add a library, module, whatever in the category that suit better in [Modules](/Modules) or improve the python scripts

I would like to accept in the organization other KiCad or Spice fans to keep this page going on, if you would like to partecipate open an issue

# Resources
- http://espice.ugr.es/espice/src/modelos_subckt/
- https://github.com/ryansturmer/kicad-spice-library
- https://groups.yahoo.com/neo/groups/LTspice/info
- https://forum.kicad.info/t/adding-spice-components-that-do-not-exist-in-pspice-library/12036/2
- http://ltwiki.org/index.php?title=Main_Page

# Examples

Here there are a few possible usage scenarios with `check_supported.py`:

- Searching `bc337`
```
Write here the part you are looking for: bc337
bc337 found in /Models/Manufacturer\Infineon Technologies\infineon.lib, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\siemens.lib

Also other 10 similar part has been found:

bc337/sie found in /Models/uncategorized\spice_complete\siemens.lib
bc337ap found in /Models/Manufacturer\Zetex Semiconductors\ZMODELS.LIB, /Models/Transistor\BJT\BJTN.LIB, /Models/uncategorized\spice_complete\zetex.lib, /Models/uncategorized\spice_complete\zmodels.lib
bc337ap_zx found in /Models/uncategorized\spice_complete\zetex.lib
bc337c_in found in /Models/Manufacturer\Infineon Technologies\infineon.lib
bc337s found in /Models/uncategorized\spice_complete\S_AFBJT.LIB
qbc337-16/plp found in /Models/uncategorized\spice_complete\phil_bjt.lib
qbc337-25/plp found in /Models/uncategorized\spice_complete\phil_bjt.lib
qbc337-40/plp found in /Models/uncategorized\spice_complete\phil_bjt.lib
qbc337/plp found in /Models/uncategorized\spice_complete\phil_bjt.lib
qbc337a/plp found in /Models/uncategorized\spice_complete\phil_bjt.lib
```

- Searching `2n2222`
```
Write here the part you are looking for: 2n2222
2n2222 found in /Models/uncategorized\IdealDiode.lib

Also other 5 similar part has been found:

2n2222a found in /Models/uncategorized\spice_complete\zetex.lib, /Models/uncategorized\spice_complete\zmodels.lib
2n2222a_zx found in /Models/uncategorized\spice_complete\zetex.lib
2n2222c found in /Models/uncategorized\spice_complete\ad.lib
q2n2222 found in /Models/uncategorized\spice_complete\cadlab.lib
q2n2222a found in /Models/Manufacturer\TRT-Electronics\2n2222a.lib, /Models/Manufacturer\Zetex Semiconductors\ZMODELS.LIB, /Models/uncategorized\spice_complete\cadlab.lib
```
NOTE: there are different models of these IC produced by different manufacturers, so we can pick the model more similar to our use case

- If we don't know/remember perfectly the IC we are looking for
```
Write here the part you are looking for: 2n2
2n2 not found, maybe you meant one of these: 2n2102_on, 2n2222, 2n2222a, 2n2222a_zx, 2n2222c, mtd2n20, mtp12n20, mw32n20e, q2n2219, q2n2219a, q2n2222, q2n2222a, q2n2905, q2n2905a, q2n2907, q2n2907a, tn0102n2, tn0602n2, tp0102n2, tp0602n2
```

- Searching less common part like the `2sa1940`
```
Write here the part you are looking for: 2sa1940
2sa1940 not found, maybe you meant one of these: q2sa1940

Would you like to do another search? q2sa1940
q2sa1940 found in /Models/uncategorized\spice_complete\other_models\BJT_PNP\TOSH_PWR.LIB
```

Just for reference this is the output that I got from `generate_supported.py` the first time I run this project, now after better filtering the models are much more
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
