# GGplot Theme ------------------------------------------------------------

#' Academic Theme
#'
#' @description A customized theme for \href{ggplot}{ggplot} to be used in academic writings.
#' Bold face helvetica font is used for labels, legend at the bottom and colorblind
#' friendly palettes are provided. It should be used in conjunction with
#' scale_color_academic (or fill versions) to set aesthetic's labels.
#'
#' Based on: \url{https://rpubs.com/Koundy/71792}
#'
#'
#' @param base_size Baseline font size. Defaults to 12.
#' @param base_family Baseline font family. Defaults to helvetica
#' @param base_line_size Line size. Defaults to 0.8
#'
#' @return A ggplot theme
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(displ, hwy, color = class)) +
#'   geom_point() +
#'   theme_academic()
theme_academic <- function(base_size = 12, base_family = "Helvetica",
                           base_line_size = 0.8) {
  (ggthemes::theme_foundation(
    base_size = base_size,
    base_family = base_family
  ) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        face = "bold",
        size = ggplot2::rel(1.2),
        hjust = 0.5
      ),
      text = ggplot2::element_text(),
      panel.background = ggplot2::element_rect(colour = NA),
      plot.background = ggplot2::element_rect(colour = NA),
      panel.border = ggplot2::element_rect(colour = NA),
      axis.title = ggplot2::element_text(face = "bold", size = ggplot2::rel(1)),
      axis.title.y = ggplot2::element_text(angle = 90, vjust = 2),
      axis.title.x = ggplot2::element_text(vjust = -0.2),
      axis.text = ggplot2::element_text(),
      axis.line = ggplot2::element_line(colour = "black"),
      axis.ticks = ggplot2::element_line(),
      panel.grid.major = ggplot2::element_line(colour = "#f0f0f0"),
      panel.grid.minor = ggplot2::element_blank(),
      legend.key = ggplot2::element_rect(colour = NA),
      legend.position = "bottom",
      legend.direction = "horizontal",
      legend.key.size = ggplot2::unit(0.2, "cm"),
      legend.margin = ggplot2::margin(unit = "cm"),
      legend.title = ggplot2::element_text(face = "italic"),
      plot.margin = ggplot2::unit(c(10, 5, 5, 5), "mm"),
      strip.background = ggplot2::element_rect(
        colour = "#f0f0f0",
        fill = "#f0f0f0"
      ),
      strip.text = ggplot2::element_text(face = "bold")
    )
  )
}

#' Color palettes for academic theme
#'
#' @description Internal use only
#'
#' @param pal Palette name, one of: orig, bright, vibrant, muted, light, or
#' OkabeIto
#'
#' @return Character vector with hexadecimal color codes
#'
rfb_academic_palettes <- function(pal = "vibrant") {
  checkmate::assert_choice(pal, c( "orig", "bright", "vibrant", "muted",
                                   "light", "OkabeIto"
  ))
  selected <- switch(pal,
                     orig = c(
                       "#386cb0", "#ef3b2c", "#7fc97f", "#fb9a99", "#984ea3",
                       "#fdb462", "#a6cee3", "#ffff33", "#662506"
                     ),
                     # Color blind friendly.
                     # Paul Tol https://personal.sron.nl/~pault/#sec:qualitative
                     bright = c(
                       "#4477AA", "#EE6677", "#228833", "#CCBB44", "#66CCEE",
                       "#AA3377", "#BBBBBB", "#000000"
                     ),
                     vibrant = c(
                       "#EE7733", "#0077BB", "#33BBEE", "#EE3377", "#CC3311",
                       "#009988", "#BBBBBB", "#000000"
                     ),
                     muted = c(
                       "#88CCEE", "#44AA99", "#117733", "#332288", "#DDCC77",
                       "#999933", "#CC6677", "#882255", "#AA4499", "#DDDDDD"
                     ),
                     light = c(
                       "#BBCC33", "#AAAA00", "#77AADD", "#EE8866", "#EEDD88",
                       "#FFAABB", "#99DDFF", "#44BB99", "#DDDDDD"
                     ),
                     # From Color Universal Design (CUD): https://jfly.uni-koeln.de/color/
                     OkabeIto = c(
                       "#E69F00", "#56B4E9", "#009E73", "#F0E442",
                       "#0072B2", "#D55E00", "#CC79A7", "#000000"
                     )
  )
  
  return(selected)
}

#' Fill aesthetics for academic theme
#'
#' @description Discrete scale version
#'
#' @param pal Color palette. Default is vibrant
#' @param ... Parameters to be passed to ggplot2::discrete_scale
#'
#' @return A ggplot scale
#'
scale_fill_academic <- function(pal = "vibrant", ...) {
  ggplot2::discrete_scale(
    "fill", "academic",
    scales::manual_pal(
      values = rfb_academic_palettes(pal)
    ),
    ...
  )
}


#' Color aesthetics for academic theme
#'
#' @description Discrete scale version
#'
#' @param pal Color palette. Default is vibrant
#' @param ... Parameters to be passed to ggplot2::discrete_scale
#'
#' @return A ggplot scale
#'
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(displ, hwy, color = class)) +
#'   geom_point() +
#'   scale_color_academic(labels = c(
#'     "Two-seats", "Compact", "Mid-size",
#'     "Mini-van", "Pickup", "Sub-compact",
#'     "SUV"
#'   )) +
#'   theme_academic()
scale_color_academic <- function(pal = "vibrant", ...) {
  ggplot2::discrete_scale(
    "colour", "academic",
    scales::manual_pal(
      values = rfb_academic_palettes(pal)
    ),
    ...
  )
}


#' Fill aesthetics for academic theme
#'
#' @param ... Parameters to be passed to ggplot2::continuous_scale
#'
#' @return A ggplot scale
#'
scale_fill_academic_c <- function(...) {
  ggplot2::continuous_scale(
    "fill", "academic",
    scales::viridis_pal(), ...
  )
}


#' Color aesthetics for academic theme
#'
#' @param ... Parameters to be passed to ggplot2::continuous_scale
#'
#' @return A ggplot scale
#'
scale_color_academic_c <- function(...) {
  ggplot2::continuous_scale(
    "colour", "academic",
    scales::viridis_pal(), ...
  )
}