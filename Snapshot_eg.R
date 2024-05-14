
num_nodes <- 5
num_timestamps <- 4

# edges for each timestamp
edges_data <- list(
  cbind(c(1, 2), c(3, 4)),
  cbind(c(1, 2, 3), c(4, 5)),
  cbind(c(1, 2, 4), c(2, 3, 4)),
  cbind(c(1, 3), c(2, 4))
)


static_graphs <- list()


layout <- layout_in_circle

# Iterating over timestamps
for (timestamp in 1:num_timestamps) {
  
  edges <- edges_data[[timestamp]]
  
  # Create an empty graph with the specified number of nodes
  graph_static <- graph(edges = edges, n = num_nodes, directed = FALSE)
  
  # Adding the static graph to the list
  static_graphs[[as.character(timestamp)]] <- graph_static
}

#Plotting
par(mfrow = c(ceiling(sqrt(length(static_graphs))), ceiling(sqrt(length(static_graphs)))))
for (i in seq_along(static_graphs)) {
  plot(static_graphs[[i]], 
       layout = layout,
       main = paste("G(", names(static_graphs)[i],")"),
       vertex.size = 50, 
       vertex.label = 1:num_nodes, 
       edge.width = 3)
}

