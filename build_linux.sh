#!/bin/bash
set -x
ls /opt/python/
export PATH=/opt/python/3.5/bin:$PATH
which python

#pip install

git clone https://github.com/maartenbreddels/vaex
cd vaex
pip install --upgrade pip
pip install --upgrade matplotlib
FILE=`python -c "import matplotlib.backends.backend_tkagg as m; print (m.__file__)"`;
rm -f $FILE ${FILE}c;
pip install numpy
pip install -r requirements.txt
pip install -e .
pip install PyQt5
pip install qtconsole appdirs
pip install setuptools==19.2
pip install requests==2.5.1
pip install pyinstaller==3.1
cd vaex
cp misc/vaex.spec .
export MPLBACKEND=qt5agg
pyinstaller --hidden-import requests.auth vaex.spec
cd ..