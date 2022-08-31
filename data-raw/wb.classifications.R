library(dplyr)
library(WDI)

temp1 <- WDI::WDI(extra = TRUE, latest = 1, cache = WDIcache())

wb.classifications <- temp1 %>%
  filter(region != "Aggregates") %>%
  mutate(region.abb = case_when(region == "East Asia & Pacific" ~ "EAP",
                                region == "Europe & Central Asia" ~ "ECA",
                                region == "Latin America & Caribbean" ~ "LAC",
                                region == "Middle East & North Africa" ~ "MENA",
                                region == "North America" ~ "NA",
                                region == "South Asia" ~ "SA",
                                region == "Sub-Saharan Africa" ~ "SSA")) %>%
  select(iso3c, country, region, region.abb, year, income, lending) %>%
  arrange(country)

usethis::use_data(wb.classifications, overwrite = TRUE)
