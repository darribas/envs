#!/bin/bash

conda-env remove -y -n pydata

conda create -y -n pydata ipython=4.1 jupyter=1.*

conda install -n pydata -y --no-update-deps pip \
    'pandas=0.16*' \
    'numpy=1.9' \
    'psycopg2' \
    'fiona=1.5' \
    'six' \
    'rasterio' \
    'pytables=3.2.1' \
    'shapely=1.5.8' \
    'pyproj=1.9.4' \
    'matplotlib=1.5*' \
    'seaborn=0.7' \
    'bokeh=0.11' \
    'ipywidgets=4.1*' \
    'scipy=0.17' \
    'statsmodels=0.6*' \
    'scikit-learn=0.17*'

conda install -y -n pydata -c anaconda-nb-extensions nbpresent

source activate pydata

pip install -U geopy descartes clusterpy mplleaflet
pip install -U --no-deps pysal==1.11.0

pip install -U --no-deps git+git://github.com/geopandas/geopandas.git

