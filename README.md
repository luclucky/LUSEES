
## SOFTWARE-FRAMEWORK, INPUT-DATA, CODE & ADDITIONAL GRAPHS FOR THE PUBLICATION UNDER REVIEW:

# SPACE DRIVES SYNERGISM OF LAND USE AND CLIMATIC EXTREME EVENTS IN INSECT META-POPULATIONS

Lucas Streib¹*, Noel Juvigny-Khenafou¹, Henriette Heer¹, Mira Kattwinkel¹, Ralf B. Schäfer¹

¹ iES - Institute for Environmental Sciences, University of Koblenz-Landau, 76829 Landau i. d. Pfalz, Germany\
\* Corresponding author

-----

### A. SOFTWARE-FRAMEWORK

All model results (see **C.**) are stored in a [PostgreSQL](https://www.postgresql.org/) database extended by [PostGIS](https://postgis.net/).\ 
The model is implemented in [PYTHON](https://www.python.org/) using the PostgreSQL database adapter [Psycopg](http://initd.org/psycopg/docs/index.html) for PostGIS functions, data querying / storage.\
Analyses were performed in [R](https://www.r-project.org/).

- [PostgreSQL 9.6.20](https://www.postgresql.org/docs/9.6/release-9-6-20.html)
- [PostGIS 2.3.3](https://postgis.net/2017/07/01/postgis-2.3.3/)
- [Python 3.9.0](https://www.python.org/downloads/release/python-390/)
- [R 3.6.3](https://cran.r-project.org/src/base/R-3/)

**PYTHON PACKAGES** required: 
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

**R PACKAGES** required: 
- [RPostgreSQL 0.6-2](https://cran.r-project.org/web/packages/RPostgreSQL/index.html)

Use of other package versions may result in unpredictability!

### B. INPUT-DATA

Required geo-data is stored in the sub-folder [GeoData](https://github.com/luclucky/LUSEES/tree/main/GeoData) as [SQL dump](https://www.postgresql.org/docs/9.6/backup.html). 
To apply the model, the dump-file **gd** has to be [restored](https://www.postgresql.org/docs/9.6/app-pgrestore.html) in a PostgreSQL database extended by PostGIS first.\
Hereto, it is required to enable the [GDAL drivers](https://postgis.net/docs/postgis_gdal_enabled_drivers.html) in the PostGIS environment by following SQL query:

'SET postgis.gdal_enabled_drivers = 'ENABLE_ALL';'

### C. CODE

#### Python

Software implementation of the presented meta-population model in Python is stored as (commented) files in the sub-folder [CodePython](https://github.com/luclucky/LUSEES/tree/main/CodePython).\
To run the Model execute the files in the following order:

- LUSEES_1_LandUseScenarios.py 
- LUSEES_2_PatchArragmentScenarios.py
- LUSEES_3_MetaPopulationConnections.py
- LUSEES_4_MetaPopulationPatches_P1.py
- LUSEES_4_MetaPopulationPatches_P2.py
- LUSEES_1_LandUseScenarios.py

In all files it is required to specify DataBase connection parameters; i.e. to replace **???** in the following snippet:

'psycopg2.connect("host=??? port=??? dbname=??? user=??? password=???")' 

#### R

Analyses are performed in **R** by executing the (commented) files stored in the sub-folder [CodeR](https://github.com/luclucky/LUSEES/tree/main/CodeR) in the following order:

- ANALYSIS_1_ExportDB.R
- ANALYSIS_2_ComputationEEA.R

In the 'ANALYSIS_1_ExportDB.R'-file it is required to specify DataBase connection parameters; i.e. to replace **???** in the following snippet:

'con = dbConnect(drv, dbname = "???", host = "???", port = ???, user = "???", password = "???")'

### D. GAPHS

#### LUS

Graphs representing the effect of every specific land use related stress (LUS) level combined with all extreme event related stress (EES) levels on meta-population network size (y-Axis) from time-step 5 to time-step 110 (x-Axis) are stored in the sub-folder [LUSEES_Course/LUS](https://github.com/luclucky/LUSEES/tree/main/Graphs/LUSEES_Course/LUS).

#### EES

Graphs representing the effect of every specific extreme event related stress (EES) level combined with all land use related stress (LUS) levels on meta-population network size (y-Axis) from time-step 5 to time-step 110 (x-Axis) are stored in the sub-folder [LUSEES_Course/EES](https://github.com/luclucky/LUSEES/tree/main/Graphs/LUSEES_Course/EES).

-----

For suggestions or requests for further information please contact the corresponding author **Lucas Streib**:

&#9993; streib@uni-landau.de\
&#9990; +49 6341 280-32317\
iES - Institute for Environmental Sciences\
Quantitative Landscape Ecology\
University of Koblenz-Landau, Campus Landau\
Fortstraße 7\
76829 Landau\
Germany
