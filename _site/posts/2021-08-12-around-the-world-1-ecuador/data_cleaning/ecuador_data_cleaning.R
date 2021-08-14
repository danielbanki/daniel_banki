library(tidyverse)
library(sf)
library(here)

# number of hospital beds in each province
beds <- read.csv(paste0(here(), "/data_cleaning/camas_2020.csv"), sep = ";") %>% 
  select(prov_ubi, camas_disp) %>% 
  mutate(CC_1 = formatC(prov_ubi, width = 2, flag = "0")) %>% 
  group_by(CC_1) %>% 
  summarise(n_beds = sum(camas_disp))

# shapefiles for provinces
polygons <- readRDS(paste0(here(),"/data_cleaning/gadm36_ECU_1_sf.rds"))

# projected population in each province
population <- read_csv(paste0(here(), "/data_cleaning/population.csv"))

# combine the three sources & add sf class
beds <- left_join(beds, polygons, by = c("CC_1")) %>% 
  left_join(., population %>% select(-NAME_1), by = "CC_1") %>% 
  select(CC_1, NAME_1, n_beds, geometry, population) %>% 
  mutate(beds_per_1000 = round(n_beds / (population / 1000), 2)) %>% 
  st_as_sf()



write_rds(beds, paste0(here(), "/ecuador_data.rds"))
