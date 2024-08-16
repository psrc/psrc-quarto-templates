psrc_line_chart <- function(df, x, y, fill, lwidth=1, colors, xlabel=NULL, ylabel=NULL, breaks=NULL) {

  c <- ggplot(data=df,
        aes(x=.data[[x]],
            y=.data[[y]], 
            group=.data[[fill]]))  + 
    geom_line(aes(color=.data[[fill]]), linewidth=lwidth, linejoin = "round", na.rm=TRUE) +
    scale_color_manual(values= colors)  +
    scale_y_continuous(labels = scales::label_comma(), expand=expansion(mult = c(0, .2)))  +   # expand is to accommodate value labels
    labs(x=xlabel, y=ylabel) +
    psrcplot::psrc_style() +
    scale_x_continuous(n.breaks=breaks)

}