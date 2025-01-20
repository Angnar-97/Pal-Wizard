###########################
# Author: Angnar
# Date: 2025/01/20
# Aim: Example [Pal]
###########################

# [1] Select some code.
# [2] Trigger the pal addin.
# [3] Type in a pal “role.” Once it’s autocompleted, press Enter.
# [4] Watch your code be rewritten.

# Create a complex and total personalized ggplot function to graph a boxplot
# Write all documentation


#' Personalized Box Plot Function
#'
#' A customizable and dynamic box plot function to better visualize data distribution.
#'
#' @param data Data frame containing the variable(s) to be plotted.
#' @param x_var Character vector specifying the column name of the variable to create boxes for.
#' @param y_var Character vector specifying the column name(s) of the variables to plot as points within the boxes.
#' @param col_pal Character vector or named colors palette in a list (to customize boxplot colors).
#' @param title Character string for plot title.
#' @param facets Faceting factor variable for multi-panel plots.
#' @export
#' @return ggplot object of the created multivariate box plot figure.
personalized_boxplots <- function(data, x_var, y_var, col_pal = rgb(1, 0.5, 1), title, facets = NULL) {
  # Define base ggplot object
  p <- ggplot(data, aes_string(x = x_var)) +
    geom_boxplot(
      fill = col_pal, 
      outlier.shape = NA, 
      outlier.color = "black", 
      alpha = 0.8,
      width = 0.4
    ) +
    theme_minimal()
  
  # Add points inside of each boxplot with jitter
  if (length(y_var) > 1) {
    for (i in seq_along(y_var)) {
      
      p <- p +
        geom_point(
          data=subset(data, select_string(x_var), select_string(c(y_var[i]))), 
          aes(y = get("y_{i}")),
          size = 3,
          color = "black"
        ) +
        coord_cartesian(
          xlim = c(
            min(range(select_string(x_var)))*0.85, 
            max(range(select_string(x_var)))*1.1)
          )
    }
  } else {
    
    p <- p + geom_point(
      aes(y = get(y_var)), 
      size = 3,
      color = "black"
    )
    
  }
  
  if (!is.null(facets)) {
    
    p <- p + facet_wrap(~facets)
    
  }
  
  if (!is.null(title)) {
    
    p <- p + ggtitle(title)
    
  }
  
  return(p)
  
}