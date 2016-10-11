#!/bin/bash

brew update;
brew install python;
brew install brew install pyqt5 --with-python --without-python3;
pip install virtualenv;
virtualenv venv --no-site-packages;
source venv/bin/activate;
pip install --upgrade pip;
pip install --upgrade matplotlib;
FILE=`python -c "import matplotlib.backends.backend_tkagg as m; print (m.__file__)"`;
rm -f $FILE ${FILE}c;
pip install numpy;
pip install -r vaex/requirements.txt;
pip install -e vaex;
pip install qtconsole appdirs;
pip install setuptools==19.2;
pip install requests==2.5.1;

pip install macholib==1.5.1 modulegraph==0.11 py2app==0.7
cd vaex
python setup.py install
python setup.py py2app
cd ..