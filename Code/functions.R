# Project simple feature to different CRS
project_sf <- function(sf, crs) {
  # Transform simple feature
  sf <- sf %>% 
    st_transform(crs = crs) 
  
  # Get coordinates in projected x/y
  sf.xy <- as.data.frame(st_coordinates(sf)) 
  
  # Combine and return data frame
  df <- sf %>%
    bind_cols(sf.xy) %>% 
    st_set_geometry(NULL)
  
  return(df)
}

# Project data frame to different CRS
project_df <- function(df, lat, long, crs.geog = 4326, crs.proj) {
  # Convert data frame to sf and transform
  df <- st_as_sf(df, coords = c(long,lat), crs = crs.geog) %>% 
    st_transform(crs = crs.proj) 
  
  # Get coordinates in projected x/y
  df.xy <- as.data.frame(st_coordinates(df)) 
  
  # Combine and return data frame
  df <- df %>%
    bind_cols(df.xy) %>% 
    st_set_geometry(NULL)
  
  return(df)
}
