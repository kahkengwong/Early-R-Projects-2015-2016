# Title: Heatscatter Plot for HIP1R Expression in DLBCL Project (Lenz vs VY Microarrays)
# Author: Kah Keng Wong
# Date: 6/4/2015
# Description: This script generates a heatscatter plot comparing median expression values of 42k+ probes between Lenz and VY microarrays, with an overlay of manually selected markers (including HIP1R) that show extreme values towards GCB or ABC subtypes of diffuse large B-cell lymphoma (DLBCL).
# The plot is part of the analysis for the paper "Low HIP1R mRNA and protein expression are associated with worse survival in diffuse large B-cell lymphoma patients treated with R-CHOP" published in Experimental Molecular Pathology (PMID: 26341140).
# The heatscatter plot uses the LSD package to visualize the density of data points, with a secondary layer highlighting specific markers.
# Repository: This script is part of the Early-R-Projects-2015-2018 repository on GitHub (kahkengwong/Early-R-Projects-2015-2018).

# Step 1: Install and load required packages
# The 'xlsx' package is used to read Excel files containing the microarray data.
# The 'LSD' package provides the heatscatter function for density scatter plots.
install.packages("xlsx")
install.packages("LSD")
library(xlsx)  # Load xlsx package for reading Excel files
library(LSD)   # Load LSD package for heatscatter function

# Step 2: Set the working directory
# The directory contains the Excel files with Lenz and VY microarray data.
setwd("C:/...")

# Step 3: Load the global median expression data (Lenz vs VY)
# The Excel file "R_Global_Median_Lenz_VY_(n=42).xlsx" contains median expression values for 42k+ probes from Lenz’s and VY’s microarrays.
# The data is read from "Sheet1" into a data frame called 'data'.
# Note: Both Lenz and VY used the same microarray platform, so the rows are sorted by probe ID and perfectly matched (no probe ID labels in the file, only values).
data <- read.xlsx("R_Global_Median_Lenz_VY_(n=42).xlsx", sheetName="Sheet1")
x <- data$Lenz  # X-axis: Median expression values from Lenz’s microarray
y <- data$VY    # Y-axis: Median expression values from VY’s microarray

# Step 4: Load the manually selected markers data (including HIP1R)
# The Excel file "R_Global_Median_Lenz_VY_ABC-GCB-markers.xlsx" contains manually selected markers (e.g., HIP1R) with extreme values towards GCB or ABC subtypes.
# The data is read from "Sheet1" into a data frame called 'data2'.
data2 <- read.xlsx("R_Global_Median_Lenz_VY_ABC-GCB-markers.xlsx", sheetName="Sheet1")
x2 <- data2$LenzMed  # X-axis: Median expression values for selected markers (Lenz)
y2 <- data2$VYMed    # Y-axis: Median expression values for selected markers (VY)

# Step 5: Create the heatscatter plot with overlay
# Open a PDF device to save the plot (using default dimensions 7x7 inches; adjust as needed).
pdf("HIP1R_Lenz_vs_VY_Heatscatter.pdf", width=7, height=7)

# First heatscatter plot: Visualize the global median expression data (42k+ probes).
heatscatter(x, y, colpal="heat", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8)

# Overlay a second heatscatter plot: Highlight the manually selected markers (e.g., HIP1R).
heatscatter(x2, y2, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.5, cex.axis=0.4, colpal="blues", nrcol=1, xaxt='n', yaxt='n')

# Close the PDF device to save the plot.
dev.off()

# Notes:
# - To make the axes non-existent/white, add 'col.axis="white"' to the heatscatter() function.
# - For raster figures (e.g., PNG, JPG, PDF), save directly and print-screen if needed.
# - For vector figures (e.g., SVG, WMF), save as SVG, crop in Inkscape (remove axis labels), convert to WMF, open in MetComp to reduce file size, then drag into Word.
#   - Cropping in Inkscape: http://inkscapetutorials.org/2014/04/22/inkscape-faq-how-do-i-crop-in-inkscape/#document
# - Alternatively, save as SVG or WMF, crop in Inkscape, and paste into Word (but this may result in large file sizes that exceed journal limits).
# - Ensure the Excel files ("R_Global_Median_Lenz_VY_(n=42).xlsx" and "R_Global_Median_Lenz_VY_ABC-GCB-markers.xlsx") are in the working directory before running the script.