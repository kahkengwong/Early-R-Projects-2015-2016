# Title: Line Graphs for FOXP2 Heatmap Analysis
# Author: kahkengwong
# Date: 6/11/2015
# Description: This script generates line graphs for FOXP2 heatmap data, specifically for Fig 6 in the Oncotarget FOXP2 paper (PMID: 27224915).
# The script creates two plots: one for GCB-DLBCL and another for ABC-DLBCL, comparing immune/TCR heatmap data.
# The plots use ggplot2 for visualization, with data sourced from Excel files ("Ggplot2_line_ABC-DLBCL.xlsx" and "Ggplot2_line_GCB-DLBCL.xlsx").
# Repository: This script is part of the Early-R-Projects-2015-2018 repository on GitHub (kahkengwong/Early-R-Projects-2015-2018).

# Step 1: Install required packages if not already installed
# The 'xlsx' package is used to read Excel files into R.
# The 'ggplot2' package is used for creating the line graphs and visualizations.
# The 'rJava' package is a dependency for 'xlsx' to interface with Java for Excel file handling.
install.packages("xlsx")
install.packages("ggplot2")
install.packages("rJava")

# Step 2: Load the required libraries into the R session
library(xlsx)    # For reading Excel files
library(ggplot2) # For creating plots
library(rJava)   # Required for xlsx package functionality

# Step 3: Set the working directory
# Replace "…" with the actual path to the directory containing your Excel data files.
# Example: setwd("C:/Users/YourName/Documents/FOXP2_Heatmap_Data")
setwd("…") # Directory

# Step 4: Load the ABC-DLBCL dataset
# The Excel file "Ggplot2_line_ABC-DLBCL.xlsx" contains data for the ABC-DLBCL subtype.
# We read the data from "Sheet1" into a data frame called 'kkdata'.
# The data frame is expected to have columns: 'x', 'y', 'Type', 'low', and 'high'.
kkdata <- read.xlsx("Ggplot2_line_ABC-DLBCL.xlsx", sheetName="Sheet1")

# Step 5: Extract x and y variables from the ABC-DLBCL dataset for plotting
# 'x' and 'y' are assumed to be columns in the Excel file representing the x-axis and y-axis values.
x <- kkdata$x
y <- kkdata$y

# Step 6: Load the GCB-DLBCL dataset
# The Excel file "Ggplot2_line_GCB-DLBCL.xlsx" contains data for the GCB-DLBCL subtype.
# We read the data from "Sheet1" into a data frame called 'kkdata2'.
# The data frame is expected to have the same structure as 'kkdata' (columns: 'x', 'y', 'Type', 'low', 'high').
kkdata2 <- read.xlsx("Ggplot2_line_GCB-DLBCL.xlsx", sheetName="Sheet1")

# Step 7: Extract x and y variables from the GCB-DLBCL dataset for plotting
# 'x2' and 'y2' are used to differentiate from the ABC-DLBCL variables.
x2 <- kkdata2$x
y2 <- kkdata2$y

# Step 8: Create a line graph for GCB-DLBCL vs immune/TCR heatmap
# This plot visualizes the GCB-DLBCL data, with lines colored by 'Type'.
# - 'aes(x=x2, y=y2, fill=Type, color=Type)' maps the x and y values and uses 'Type' for coloring.
# - 'scale_colour_brewer(palette = "Set1")' applies a color palette for better differentiation.
# - 'geom_line(size=1.5, alpha=0.7)' draws the lines with a thickness of 1.5 and slight transparency.
# - 'geom_point()' adds points at each data point for emphasis.
# - 'geom_ribbon(aes(ymin=low, ymax=high), alpha=0.3, color=NA)' adds a shaded ribbon to show the range between 'low' and 'high' values.
# - 'theme()' customizes the plot appearance: removes minor grid lines, sets major grid lines to gray, and removes the background.
ggplot(data=kkdata2, aes(x=x2, y=y2, fill=Type, color=Type)) + 
  scale_colour_brewer(palette = "Set1") + 
  geom_line(size=1.5, alpha=0.7) + 
  geom_point(aes(x=x2, y=y2)) + 
  geom_ribbon(aes(ymin=low, ymax=high), alpha=0.3, color=NA) + 
  theme(panel.grid.minor = element_blank(), 
        panel.grid.major = element_line(colour = "gray72", size=0.5), 
        panel.background = element_blank())  
# Export this plot as a PDF for inclusion in the Oncotarget paper (Fig 6).

# Step 9: Create a line graph for ABC-DLBCL vs immune/TCR heatmap
# This plot visualizes the ABC-DLBCL data, following the same structure as the GCB-DLBCL plot.
# The parameters are identical to ensure consistency between the two plots for comparison.
# - Uses 'kkdata' for the ABC-DLBCL data.
# - Same aesthetic mappings, color palette, line styles, and theme settings as the previous plot.
ggplot(data=kkdata, aes(x=x, y=y, fill=Type, color=Type)) + 
  scale_colour_brewer(palette = "Set1") + 
  geom_line(size=1.5, alpha=0.7) + 
  geom_point(aes(x=x, y=y)) + 
  geom_ribbon(aes(ymin=low, ymax=high), alpha=0.3, color=NA) + 
  theme(panel.grid.minor = element_blank(), 
        panel.grid.major = element_line(colour = "gray72", size=0.5), 
        panel.background = element_blank())  
# Export this plot as a PDF for inclusion in the Oncotarget paper (Fig 6).

# Notes:
# - Ensure the Excel files ("Ggplot2_line_ABC-DLBCL.xlsx" and "Ggplot2_line_GCB-DLBCL.xlsx") are in the working directory.
# - The 'Type', 'low', and 'high' columns in the Excel files are critical for the plot's fill, color, and ribbon features.
# - To export the plots as PDFs, use ggsave() after each ggplot() call, e.g., ggsave("GCB_plot.pdf", width=8, height=6).
# - This script was originally created on 6/11/2015 as part of the FOXP2 heatmap analysis for the Oncotarget paper.