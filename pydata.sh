#!/bin/bash

conda-env remove -y -n pydata

conda create -y -n pydata python=2.7.*

conda install -c conda-forge -c bokeh -n pydata -y \
    'bokeh=0.11' \
    'cartopy=0.14*' \
    'cython=0.23.*' \
    'dask=0.8*' \
    'datashader=0.2*', \
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

conda install -y -n pydata -c anaconda-nb-extensions nbpresent nbbrowserpdf

source activate pydata

pip install -U --no-deps geopy descartes clusterpy mplleaflet brewer2mpl
pip install -U --no-deps git+https://github.com/quantopian/qgrid.git@v0.3.0
pip install -U --no-deps pysal==1.11.1

pip install -U --no-deps git+git://github.com/geopandas/geopandas.git@v0.2

rm -f pydata_test.html
jupyter nbconvert --to notebook --execute --allow-errors pydata_check.ipynb --output pydata_test.ipynb
jupyter nbconvert --to html pydata_test.ipynb
rm pydata_test.ipynb

