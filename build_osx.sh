#!/bin/bash

#curl http://vaex.astro.rug.nl/install_conda.sh | bash -s -- --dev --python 2 --pyqt 4

wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh

bash miniconda.sh -b -p ~/miniconda-vaex
export PATH=$HOME/miniconda-vaex/bin:$PATH

hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda info -a

conda install python=2 pyqt=4 numpy scipy pyqt matplotlib pyopengl h5py numexpr astropy tornado
conda install -c conda-forge kapteyn


export PATH=$HOME/miniconda-vaex/bin:$PATH
pip install py2app
pip install -r vaex/requirements.txt
pip install -e ./vaex
cd vaex
python setup.py install
python setup.py py2app &> py2app_log.txt
cd ..
conda list