psrc_line_chart <- function(df, x, y, fill, lwidth=1, colors, xlabel=NULL, ylabel=NULL, breaks=NULL, title=NULL, source=NULL) {

  x_points_min <- df |> select(all_of(x)) |> pull() |> min()
  x_points_max <- df |> select(all_of(x)) |> pull() |> max()
  x_points <- c(seq(x_points_min, x_points_max, by=breaks))

  c <- ggplot(data=df,
        aes(x=.data[[x]],
            y=.data[[y]], 
            group=.data[[fill]]))  + 
    geom_line(aes(color=.data[[fill]]), linewidth=lwidth, linejoin = "round", na.rm=TRUE) +
    geom_point(shape=21, color="white", data = df |> filter(.data[[x]] %in% x_points), aes(fill=.data[[fill]], size = 1), show.legend = FALSE) +
    scale_fill_manual(values = colors) +
    scale_color_manual(values = colors)  +
    scale_y_continuous(labels = scales::label_comma(), expand=expansion(mult = c(0, .2)))  +   # expand is to accommodate value labels
    labs(x=xlabel, y=ylabel, title=title, caption=source) +
    psrcplot::psrc_style() +
    scale_x_continuous(n.breaks=breaks) +
    theme(plot.title = element_text(family = "Poppins", color = "black", size = 14),
          panel.grid.major.y = element_line(linewidth = 0.1, color="#dcdcdc"),
          panel.grid.major.x = element_line(linewidth = 0.1, color="#dcdcdc"),
          plot.caption =  element_text(family="Poppins", face="plain", size = 10, color="black", hjust=0),
          plot.caption.position = "plot")

}