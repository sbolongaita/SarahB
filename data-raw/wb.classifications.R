usethis::use_package("dplyr")
usethis::use_package("WDI")

temp1 <- WDI::WDI(extra = TRUE, latest = 1, cache = WDI::WDIcache())

wb.classifications <- temp1 %>%
  dplyr::filter(region != "Aggregates") %>%
  dplyr::mutate(region.abb = dplyr::case_when(region == "East Asia & Pacific" ~ "EAP",
                                              region == "Europe & Central Asia" ~ "ECA",
                                              region == "Latin America & Caribbean" ~ "LAC",
                                              region == "Middle East & North Africa" ~ "MENA",
                                              region == "North America" ~ "NA",
                                              region == "South Asia" ~ "SA",
                                              region == "Sub-Saharan Africa" ~ "SSA")) %>%
  dplyr::select(iso3 = iso3c, country, region, region.abb, year, income, lending) %>%
  dplyr::arrange(country)

usethis::use_data(wb.classifications, overwrite = TRUE)
