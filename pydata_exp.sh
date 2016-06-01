#!/bin/bash

conda install -y conda=4.0.6

conda-env remove -y -n pydata_exp

conda create -y -n pydata_exp python=2.7.*

conda install -c conda-forge -n pydata_exp -y \
    'bokeh=0.11' \
    'cartopy=0.14*' \
    'cython=0.23.*' \
    'dask=0.8*' \
    'fiona=1.6*' \
    'gdal=1.11*' \
    'ipython=4.2.*' \
    'ipywidgets=4.1*' \
    'jupyter=1.*' \
    'krb5' \
    'libgdal=1.11*' \
    'networkx=1.11' \
    'numpy=1.10*' \
    'matplotlib=1.5*' \
    'pandas=0.18*' \
    'pip' \
    'psycopg2' \
    'pyproj=1.9.4' \
    'pytables=3.2*' \
    'rasterio=0.32*' \
    'seaborn=0.7*' \
    'shapely=1.5*' \
    'six' \
    'scipy=0.17' \
    'scikit-learn=0.17*' \
    'sqlalchemy=1.0.12' \
    'statsmodels=0.6*' \
    'xlrd=0.9*' \
    'xlsxwriter=0.8.*'

# rpy2 as in http://stackoverflow.com/questions/24987932/installing-rpy2-on-mac-osx-with-anaconda-python-3-4-and-r-3-1-installed-via-macp
conda install -n pydata_exp -y --no-update-deps patchelf
conda skeleton pypi rpy2 --version 2.8.0
conda build rpy2
conda install -n pydata_exp -y --use-local rpy2
rm -r rpy2

conda install -c anaconda-nb-extensions -n pydata_exp -y \
    'nbpresent=2.*' \
    'nbbrowserpdf' 

source activate pydata_exp

pip install -U pip==8.1.*
pip install -U --no-deps geopy descartes clusterpy mplleaflet brewer2mpl
pip install -U --no-deps git+https://github.com/quantopian/qgrid.git@v0.3.0
pip install -U --no-deps https://github.com/pysal/pysal.git@dev
pip install --process-dependency-links git+https://github.com/pymc-devs/pymc3
pip install -U --no-deps git+git://github.com/geopandas/geopandas.git@master

rm -f pydata_test.html
jupyter nbconvert --to notebook --execute --allow-errors pydata_check.ipynb --output pydata_test.ipynb
jupyter nbconvert --to html pydata_test.ipynb
rm pydata_test.ipynb

