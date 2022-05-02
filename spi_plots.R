#Script for SPI plots
library(ggplot2)
library(ggthemes)
library(ggpubr)
library(scales)
setwd("C:/Users/USER/Desktop/DATA_OBJECTIVES/")
kam_data = read.csv("kamenya_final.csv", header = T); head(kam_data)
plot_kam = ggplot(kam_data, aes(x=year, y=spi, color=var)) + geom_line(aes(color=var), size=1.2) +
  labs(x="Years", y="SPI Value") + scale_x_continuous(breaks = seq(1980,2018,2)) + 
  geom_hline(yintercept=0) + scale_color_manual(values=c('black','blue', 'violetred1')) + 
  theme_bw() + theme(legend.title = element_blank(), panel.grid.minor = element_blank(),
                     panel.grid.major = element_blank(), axis.text=element_text(size=12),
                     legend.text = element_text(size = 12)) + 
  scale_y_continuous(breaks = seq(-3,3,1)) + annotate("text", x=1981, y=2.7, label= "(a)", size=5.2)

mub_data = read.csv("mubende_spi.csv", header = T); head(mub_data)
plot_mub = ggplot(mub_data, aes(x=year, y=spi, color=var)) + geom_line(aes(color=var), size=1.2) +
  labs(x="Years", y="SPI Value") + scale_x_continuous(breaks = seq(1980,2018,2)) + 
  geom_hline(yintercept=0) + scale_color_manual(values=c('black','blue', 'violetred1')) + 
  theme_bw() + theme(legend.title = element_blank(), panel.grid.minor = element_blank(),
                     panel.grid.major = element_blank(), axis.text=element_text(size=12),
                     legend.text = element_text(size = 12)) + 
  scale_y_continuous(breaks = seq(-3,3,1)) + annotate("text", x=1981, y=2, label= "(b)", size=5.2)

ggarrange(plot_kam, plot_mub,
          ncol = 1, nrow = 2, common.legend = T, legend = "bottom")



### SPI VALUES - SINGLE ANNUAL WITH MONTHS
kam_data$year = as.Date(kam_data$year,  format = "%m/%d/%y")
ggplot(kam_data, aes(x=year, y=spi)) + geom_line(aes(group=1)) + labs(x="Years", y="SPI Value") + 
  geom_hline(yintercept=0) + theme_bw() + theme(legend.title = element_blank(), panel.grid.minor = element_blank(),
                     panel.grid.major = element_blank(), axis.text=element_text(size=12),
                     legend.text = element_text(size = 12)) +
  scale_x_datetime(major = "3 years")