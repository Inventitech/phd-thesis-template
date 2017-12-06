library(readr)
library(ggplot2)
library(ggthemes)
library(scales)

### ggplot configuration
ggplot.defaults <- 
  theme_few() +
  theme(axis.text.x = element_text(size = 22)) + 
  theme(axis.text.y = element_text(size = 22)) +
  theme(axis.title.x = element_text(size = 22, vjust = 1)) +
  theme(axis.title.y = element_text(size = 22, vjust = 1)) +
  theme(legend.text = element_text(size = 22))  +
  theme(legend.title = element_text(size = 22)) + 
  theme(axis.title.x=element_text(margin=margin(20,0,0,0))) + 
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))

ggplot.small.defaults <-
  ggplot.defaults + theme(axis.title.x = element_text(size = 22, vjust = -0.5)) +
  theme(axis.title.y = element_text(size = 22, hjust = 0.5, vjust = 1.5), panel.grid = element_line(colour = "grey", size=0.3))

gh_history_prs <- read_csv("~/projects/phd-thesis/dissertation-tudelft-latex/introduction/results-20171204-171053.csv")
gh_history_prs$aggregated_date <- as.Date(paste0(gh_history_prs$pr_yr, '-', gh_history_prs$pr_mt, '-1'))
gh_history_prs <- gh_history_prs[gh_history_prs$action %in% c("opened","merged"),]
gh_history_prs <- gh_history_prs[gh_history_prs$aggregated_date < as.Date("2014-02-01"),]

ggplot(gh_history_prs, aes(aggregated_date, freq, shape=action, group=action, colour=action)) + geom_point(size=2.5) + geom_line() + geom_smooth(se = FALSE) +
  scale_y_continuous(labels = scales::comma) +
  ggplot.small.defaults +
  ylab("#Events") + xlab("") + labs(shape='Pullrequest Events',colour='Pullrequest Events') + theme(legend.position = "bottom")

total <- aggregate(freq ~ action, gh_history_prs, sum)
# Number of openend and not closed pull requests
total[2,]$freq - total[1,]$freq

