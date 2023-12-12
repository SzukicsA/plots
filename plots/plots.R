library(tidyverse)

# Data
# ---------
d = tibble(my_x = seq(0, 10, length.out = 50)) %>%
  mutate(y1 = 0.5 * sin(my_x),
         y2 = 1.8 * sin(my_x),
         y3 = 0.3 * my_x
         ) %>%
pivot_longer(c(y1, y2, y3))
d

# Plot
# ---------

ggplot(data = d,
       mapping = aes(x = my_x, y = value, color = name)) +
geom_line() +
geom_point() +
facet_wrap(~name, nrow = 3)
