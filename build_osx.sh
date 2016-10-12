#!/bin/bash

curl http://vaex.astro.rug.nl/install_conda.sh | bash -s -- --dev --python 2
pip install py2app
cd vaex
python setup.py install
python setup.py py2app
cd ..