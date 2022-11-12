library(magrittr)
library(dplyr)

out.df <- read.csv('full_used_points.csv', row.names = FALSE)

# converting data to standard format

out.df <- out.df %>%  mutate(date_visit = as.Date(date, "%m/%d/%Y"))

# calculating length of each cat's data time span

out.df <- out.df %>% 
  group_by(catid) %>%
  mutate(first_visit = min(date_visit), 
            last_visit = max(date_visit), 
            collar.days = last_visit - first_visit)



# remove cats with less than 1yr of data
out.df=subset(out.df, collar.days > 364)

length(unique(out.df$catid))


#write.csv(out.df, "over1yrdata.csv", row.names = FALSE )





















