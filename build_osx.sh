#!/bin/bash

#curl http://vaex.astro.rug.nl/install_conda.sh | bash -s -- --dev --python 2 --pyqt 4

wget https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh -O miniconda.sh

bash miniconda.sh -b -p ~/miniconda-vaex
export PATH=$HOME/miniconda-vaex/bin:$PATH

hash -r
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda info -a

conda create -q -n vaex python=2 pyqt=4 numpy scipy astropy matplotlib h5py pyopengl tornado future futures pyyaml Pillow
conda install -c conda-forge kapteyn cachetools progressbar2
source activate vaex

pip install py2app
pip install -r vaex/requirements.txt
pip install -e ./vaex
cd vaex
python setup.py install
python setup.py py2app &> py2app_log.txt
cd ..
conda list