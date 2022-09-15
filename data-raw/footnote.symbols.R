footnote.symbols <- data.frame(symbol = c("\u002A", "\u2020", "\u2021",
                                          "\u00A7", "\u002A\u002A", "\u2021\u2021"),
                               name = c("asterisk", "dagger", "double dagger",
                                        "section sign", "double asterisk", "double double dagger"))

usethis::use_data(footnote.symbols, overwrite = TRUE)
