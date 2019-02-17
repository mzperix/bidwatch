#style

colors <- c("dark"="#005468",
            "grass"="#02B644",
            "green"="#007690",
            "yellow"="#C1E000",
            "white"="#FFFFFF")

style <- theme_classic() +
  theme(text = element_text(family = 'Avenir', color = "#666666")) + 
  theme(axis.text = element_text(angle = 90, hjust = 1)) +
    #theme(axis.title.x) = element_text(hjust = 1)) +
  theme(axis.line = element_line(size = 0.1, color = "#aaaaaa")) + 
  theme(axis.ticks = element_line(size = 0)) + 
  theme(legend.text = element_text(hjust = 2))