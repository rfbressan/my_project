# GGplot Theme ------------------------------------------------------------
# Based on: https://rpubs.com/Koundy/71792
theme_academic <- function(base_size=12, base_family="helvetica",
                           base_line_size = 0.8) {
  require(ggplot2)
  (ggthemes::theme_foundation(base_size = base_size, base_family = base_family) +
      theme(plot.title = element_text(face = "bold",
                                      size = rel(1.2), hjust = 0.5),
            text = element_text(),
            panel.background = element_rect(colour = NA),
            plot.background = element_rect(colour = NA),
            panel.border = element_rect(colour = NA),
            axis.title = element_text(face = "bold",size = rel(1)),
            axis.title.y = element_text(angle = 90, vjust = 2),
            axis.title.x = element_text(vjust = -0.2),
            axis.text = element_text(), 
            axis.line = element_line(colour = "black"),
            axis.ticks = element_line(),
            panel.grid.major = element_line(colour = "#f0f0f0"),
            panel.grid.minor = element_blank(),
            legend.key = element_rect(colour = NA),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.key.size = unit(0.2, "cm"),
            legend.margin = margin(unit = "cm"),
            legend.title = element_text(face = "italic"),
            plot.margin = unit(c(10,5,5,5),"mm"),
            strip.background = element_rect(colour = "#f0f0f0", fill = "#f0f0f0"),
            strip.text = element_text(face = "bold")
      )
  )
}

academic_col <- c("#386cb0","#ef3b2c","#7fc97f","#fb9a99","#984ea3",
                  "#fdb462","#a6cee3","#ffff33","#662506")
#' Color blind friendly. 
#' Paul Tol https://personal.sron.nl/~pault/#sec:qualitative
bright <- c('#4477AA', '#EE6677', '#228833', '#CCBB44', '#66CCEE',
            '#AA3377', '#BBBBBB', '#000000')
vibrant <- c('#EE7733', '#0077BB', '#33BBEE', '#EE3377', '#CC3311',
             '#009988', '#BBBBBB', '#000000')
muted <- c('#88CCEE', '#44AA99', '#117733', '#332288', '#DDCC77', 
           '#999933','#CC6677', '#882255', '#AA4499', '#DDDDDD')
light <- c('#BBCC33', '#AAAA00', '#77AADD', '#EE8866', '#EEDD88', 
           '#FFAABB', '#99DDFF', '#44BB99', '#DDDDDD')

#' From Color Universal Design (CUD): https://jfly.uni-koeln.de/color/
Okabe_Ito <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", 
               "#D55E00", "#CC79A7", "#000000")

manual_col <- vibrant

scale_fill_academic <- function(...){
  # library(scales)
  ggplot2::discrete_scale("fill","academic",
                          scales::manual_pal(values = manual_col), ...)
  
}

scale_color_academic <- function(...){
  # library(scales)
  ggplot2::discrete_scale("colour","academic",
                          scales::manual_pal(values = manual_col), ...)
  
}

scale_fill_academic_c <- function(...){
  ggplot2::continuous_scale("fill", "academic",
                            scales::viridis_pal(), ...)
}

scale_color_academic_c <- function(...){
  ggplot2::continuous_scale("colour", "academic",
                            scales::viridis_pal(), ...)
}