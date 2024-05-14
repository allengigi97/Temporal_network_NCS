library(igraph)


edges <- c(
  "Teacher", "Student1",
  "Teacher", "Student2",
  "Teacher", "Student3",
  "Teacher", "Student4",
  "Teacher", "Student5",
  "Teacher", "Student6",
  "Student1", "Student2",
  "Student3", "Student6",
  "Student3", "Student4",
  "Student1", "Student6",
  "Student5", "Student6",
  "Student5", "Student2"
)


graph <- graph_from_edgelist(matrix(edges, ncol = 2, byrow = TRUE), directed = FALSE)


V(graph)$color <- ifelse(V(graph)$name == "Teacher", "red", "lightblue")


plot(graph,  edge.arrow.size = 0.5, vertex.size = 20, vertex.label = V(graph)$name, edge.color = "black")

#Adjacency matrix
get.adjacency(graph, sparse = FALSE)

#edge list
as_edgelist(graph)
