#!/bin/bash

curl http://vaex.astro.rug.nl/install_conda.sh | bash -s -- --dev --python 2
export PATH=$HOME/miniconda-vaex/bin:$PATH
conda install pyqt=4
pip install py2app
cd vaex
python setup.py install
python setup.py py2app &> py2app_log.txt
cd ..
conda list