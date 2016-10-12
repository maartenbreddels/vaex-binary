#!/bin/bash
pip install py2app
cd vaex
#python setup.py install
python setup.py py2app
cd ..