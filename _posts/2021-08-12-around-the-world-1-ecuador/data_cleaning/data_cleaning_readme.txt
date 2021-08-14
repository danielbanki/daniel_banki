The data I use for the visualizations ('ecuador_data.rds') is combined from three inputs by the script 'ecuador_data_cleaning.R'.

Three inputs:
1. Shapefiles for the provinces of Ecuador. Source: https://gadm.org/download_country_v3.html, choosing Ecuador and level1 (sf). EPSG: 4326.

2. Projected population data for 2020 for each province. Source: https://www.ecuadorencifras.gob.ec/proyecciones-poblacionales/.  

3. Number of hospital beds in each province for 2020. Source: https://www.ecuadorencifras.gob.ec/camas-y-egresos-hospitalarios/.

(+1. The provinces can be described by a name or a number; e.g., AZUAY province is 01. Some data sources, such as the data on the number of hospital beds, use the number of the province, not its name. 
The provinces' number-name mappings are available at https://www.ecuadorencifras.gob.ec/clasificador-geografico-estadistico-dpa/.)






