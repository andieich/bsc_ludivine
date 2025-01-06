# Get sample information from sample ID
get_info <- function(data){
data %>% 
  mutate(
    t = substr(sample_id, 1,1),
    site = substr(sample_id, 2,2),
    depth = substr(sample_id, 3,3),
    spec = substr(sample_id, 4,4),
    size = substr(sample_id, 5,5),
    replicate = as.numeric(substr(sample_id, 6,8))) %>% 
  mutate(site = dplyr::recode(site,
                              "T" = "Temae",
                              "E" = "E2B"),
         depth = dplyr::recode(depth,
                               "D" = "20 m",
                               "S" = "5 m"),
         spec = dplyr::recode(spec,
                              "A" = "A. hya",
                              "P" = "P. ver",
                              "M" = "P. mea"),
         size = dplyr::recode(size,
                              "L" = "Adult",
                              "S" = "Juvenile"))
}
