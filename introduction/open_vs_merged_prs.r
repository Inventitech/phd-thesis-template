library(readr)
library(ggplot2)
library(scales)
gh_history_prs <- read_csv("~/projects/phd-thesis/dissertation-tudelft-latex/introduction/results-20171204-171053.csv")
gh_history_prs$aggregated_date <- as.Date(paste0(gh_history_prs$pr_yr, '-', gh_history_prs$pr_mt, '-1'))
gh_history_prs <- gh_history_prs[gh_history_prs$action %in% c("opened","merged"),]
gh_history_prs <- gh_history_prs[gh_history_prs$aggregated_date < as.Date("2014-01-01"),]

ggplot(gh_history_prs, aes(aggregated_date, freq, shape=action, group=action)) + geom_point() + geom_line()

ggplot(gh_history_prs, aes(aggregated_date, freq, shape=action, group=action, colour=action)) + geom_point() + geom_line() + geom_smooth()
