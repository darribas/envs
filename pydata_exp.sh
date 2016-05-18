#!/bin/bash

conda-env remove -y -n pydata_exp

conda create -y -n pydata_exp ipython=4.2 jupyter=1.*

conda install -c conda-forge -n pydata_exp -y --no-update-deps \
    'pip' \
    'cython=0.23.*' \
    'dask=0.8*' \
    'pandas=0.18*' \
    'xlrd=0.9*' \
    'xlsxwriter=0.8.*' \
    'numpy=1.10*' \
    'psycopg2' \
    'sqlalchemy=1.0.12' \
    'six' \
    'pytables=3.2*' \
    'matplotlib=1.5*' \
    'seaborn=0.7' \
    'bokeh=0.11' \
    'ipywidgets=4.1*' \
    'scipy=0.17' \
    'statsmodels=0.6*' \
    'networkx=1.11' \
    'scikit-learn=0.17*' \
    'fiona=1.6*' \
    'libgdal=1.11*' \
    'gdal=1.11*' \
    'shapely=1.5*' \
    'pyproj=1.9.4' \
    'cartopy=0.14*' \
    'rasterio=0.32*' \
    'krb5'

conda install -y -n pydata_exp -c anaconda-nb-extensions nbpresent nbbrowserpdf

source activate pydata_exp

pip install -U --no-deps geopy descartes clusterpy mplleaflet brewer2mpl rpy2
pip install -U --no-deps git+https://github.com/quantopian/qgrid.git@v0.3.0
pip install -U --no-deps pysal==1.11.1
pip install --process-dependency-links git+https://github.com/pymc-devs/pymc3

pip install -U --no-deps git+git://github.com/geopandas/geopandas.git@master

rm -f pydata_test.html
jupyter nbconvert --to notebook --execute --allow-errors pydata_check.ipynb --output pydata_test.ipynb
jupyter nbconvert --to html pydata_test.ipynb
rm pydata_test.ipynb

