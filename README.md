
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

The following three geo-datasets are  as **INPUT-DATA**:

Required geo-data is stored in the repository folder [geoDATA](https://github.com/luclucky/HabitatConnectivity_Colonization/tree/master/geoDATA_gitHUB) and initially have to been imported into a database-schema named **gd**; the schema has to be [created](https://www.postgresql.org/docs/9.3/sql-createschema.html) in advance. 
For the import into the database see e.g. [PostGIS 2.4.8dev Manual](https://postgis.net/stuff/postgis-2.4.pdf) - 4.4.Loading GIS (Vector) Data & 5.1 Loading and Creating Rasters. 

### C. PYTHON CODE

For database access from Python, first the connection parameters have to be specified in each script stored in the repository folder [pythonCODE](https://github.com/luclucky/HabitatConnectivity_Colonization/tree/master/pythonCODE). Therefore, replace **???** in the command **psycopg2.connect("host=??? port=??? dbname=??? user=??? password=???")** found in each script according to the [psycopg manual](http://initd.org/psycopg/docs/module.html).
The individual code is commented regarding specific implementation details, variable declarations, data storage etc..
Please run the scripts in the following order:

**1. Landscape_Scenarios.py**\
**2. EuclideanDistance_Networks.py**\
**3. Patch_Arragments.py**\
**4. Habitat_Networks.py**\
**5. Simulation.py**

### D. R CODE

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
