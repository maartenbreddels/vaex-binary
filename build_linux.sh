#!/bin/bash
set +x

pip install virtualenv;
virtualenv venv --no-site-packages;
virtualenv venv --no-site-packages;
pip install requests[security];
git clone https://github.com/maartenbreddels/vaex

cd vaex
pip install --upgrade pip
pip install --upgrade matplotlib

FILE=`python -c "import matplotlib.backends.backend_tkagg as m; print (m.__file__)"`;
rm -f $FILE ${FILE}c;

pip install numpy # kapteyn package complaints otherwise
pip install -r requirements.txt
pip install -e .
pip install PyQt5
pip install qtconsole appdirs
pip install setuptools==19.2
pip install requests==2.5.1

#pip install --upgrade pip
#pip install --upgrade matplotlib
FILE=`python -c "import matplotlib.backends.backend_tkagg as m; print (m.__file__)"`;
rm -f $FILE ${FILE}c;
pip install qtconsole appdirs
pip install setuptools==19.2
pip install requests==2.5.1
pip install pyinstaller==3.1
pip install appdirs
cp misc/vaex.spec .
export MPLBACKEND=qt5agg
pyinstaller --hidden-import requests.auth vaex.spec
cd ..