
## SOFTWARE-FRAMEWORK, INPUT-DATA & CODE FOR THE PUBLICATION UNDER REVIEW:

# LAND USE INTERACTS WITH CLIMATIC EXTREME EVENTS TO SYNERGISTIC META-POPULATION DECLINE

Lucas Streib¹*, Noel Juvigny-Khenafou¹, Henriette Heer¹, Mira Kattwinkel¹, Ralf B. Schäfer¹

¹ iES - Institute for Environmental Sciences, University of Koblenz-Landau, 76829 Landau i. d. Pfalz, Germany\
\* Corresponding author

-----

### A. SOFTWARE-FRAMEWORK

All model results (see **C.**) are stored in a [PostgreSQL](https://www.postgresql.org/) database extended by [PostGIS](https://postgis.net/). 
The model is implemented in [PYTHON](https://www.python.org/) using the PostgreSQL database adapter [Psycopg](http://initd.org/psycopg/docs/index.html) for PostGIS functions, data querying / storage.\

1. [PostgreSQL 9.6.20](https://www.postgresql.org/docs/9.6/release-9-6-20.html)
2. [PostGIS 2.3.3](https://postgis.net/2017/07/01/postgis-2.3.3/)
3. [Python 3.9.0](https://www.python.org/downloads/release/python-390/)

Further **PYTHON PACKAGES** required: 
- [gdal 2.2.2](https://pypi.org/project/pygdal/)
- [multiprocessing 0.70a1](https://pypi.org/project/multiprocess/)
- [nlmpy 0.1.5](https://pypi.org/project/nlmpy/)
- [numpy 1.19.5](https://pypi.org/project/numpy/)
- [os](https://docs.python.org/3/library/os.html)
- [pandas 1.1.4](https://pandas.pydata.org/)
- [psycopg2 2.8.6](https://pypi.org/project/psycopg2/)
- [random](https://docs.python.org/3/library/random.html)
- [scikit-image 0.18.1](http://scikit-image.org/docs/dev/api/skimage.graph.html) 
- [subprocess](https://docs.python.org/3/library/subprocess.html)

### B. INPUT-DATA

Required geo-data is stored in the repository subfolder [GeoData](https://github.com/luclucky/LUSEES/tree/main/GeoData) as [SQL dump](https://www.postgresql.org/docs/9.6/backup.html). To run the model the dump-file **gd** has to be [restored](https://www.postgresql.org/docs/9.6/backup-dump.html#BACKUP-DUMP-RESTORE) in a PostgreSQL database extended by PostGIS; it is required to enable the GDAL drivers in the PostGIS environment previously by following SQL query:

'SET postgis.gdal_enabled_drivers = 'ENABLE_ALL';'

### C. CODE

For database access from Python, first the connection parameters have to be specified in each script stored in the repository folder [pythonCODE](https://github.com/luclucky/HabitatConnectivity_Colonization/tree/master/pythonCODE). Therefore, replace **???** in the command **psycopg2.connect("host=??? port=??? dbname=??? user=??? password=???")** found in each script according to the [psycopg manual](http://initd.org/psycopg/docs/module.html).
The individual code is commented regarding specific implementation details, variable declarations, data storage etc..
Please run the scripts in the following order:

1. **LUSEES_1_LandUseScenarios.py**
2. **LUSEES_2_PatchArragmentScenarios.py**
3. **LUSEES_3_MetaPopulationConnections.py**
4-1. **LUSEES_4_MetaPopulationPatches_P1.py**
4-2. **LUSEES_4_MetaPopulationPatches_P2.py**
5. **LUSEES_1_LandUseScenarios.py**

-----

For suggestions or requests for further information please contact the corresponding author **Lucas Streib**:

&#9993; streib@uni-landau.de\
&#9990; +49 6341 280-32317\
iES - Institute for Enviornmental Sciences\
Quantitative Landscape Ecology\
University of Koblenz-Landau, Campus Landau\
Fortstraße 7\
76829 Landau\
Germany
