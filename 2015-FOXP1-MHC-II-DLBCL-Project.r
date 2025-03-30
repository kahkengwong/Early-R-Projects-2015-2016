# Title: Graphs for FOXP1 and MHC II Project 
# Author: Kah Keng Wong
# Date: 19/4/15 
# Description: This script generates graphs for FOXP1 paper published in Leukemia 2016 (PMID: 26500140) titled "FOXP1 suppresses immune response signatures and MHC class II expression in activated B-cell-like diffuse large B-cell lymphomas"
# Description: This script generates heatscatter plots for FOXP1 expression data, as part of the analysis for the Oncotarget paper (PMID: 26500140).
# The script creates multiple heatscatter plots for Figure 2 and Supplemental Figure 2, comparing GCB vs ABC subtypes and other cell lines (DB, Ly3, K422, HBL1).
# The plots are generated using the LSD package's heatscatter function, with data sourced from Excel files.
# Repository: This script is part of the Early-R-Projects-2015-2018 repository on GitHub (kahkengwong/Early-R-Projects-2015-2018).

# Step 1: Install and load required packages
# The 'xlsx' package is used to read Excel files into R.
# The 'rJava' package is a dependency for 'xlsx' to interface with Java for Excel file handling.
# The 'car' package is used for statistical analysis (though not explicitly used in this script, it may be a dependency).
# The 'RColorBrewer' package provides color palettes for visualization.
# The 'LSD' package provides the heatscatter function for density scatter plots.
install.packages("xlsx")
install.packages("rJava")
install.packages("car")
install.packages("RColorBrewer")
library(xlsx)        # Load xlsx package for reading Excel files
library(rJava)       # Load rJava package, required for xlsx
library(car)         # Load car package for statistical tools
library(RColorBrewer) # Load RColorBrewer for color palettes
require(LSD)         # Load LSD package for heatscatter function
require(xlsx)        # Ensure xlsx is loaded

# Section 1: Heatscatter for FOXP1 Figure 2 (19-4-15, Finalized)
# This section generates heatscatter plots for GCB and ABC subtypes, comparing DB vs K422 and Ly3 vs HBL1.

# Step 2: Set the working directory for Figure 2
# The directory contains the Excel files for GCB and ABC data.
setwd("D:/RESEARCH/Projects/Microarray & Interactome/R_Studio/FOXP1")

# Step 3: Load GCB data for Figure 2
# Load two datasets: one for GCB lines and another for manually curated GCB data.
GCBdata <- read.xlsx("Heatscatter_GCB-lines_17-4-15.xlsx", sheetName="Sheet1")
x <- GCBdata$DB    # X-axis: DB values for GCB
y <- GCBdata$K422  # Y-axis: K422 values for GCB
GCBm <- read.xlsx("Heatscatter-Manual-GCB_17-4-15_v2.xlsx", sheetName="Sheet1")
x4 <- GCBm$DB      # X-axis: DB values for manual GCB data
y4 <- GCBm$K422    # Y-axis: K422 values for manual GCB data

# Step 4: Create heatscatter plot for GCB (DB vs K422)
# Open a PDF device to save the plot with custom dimensions (4 x 4.8 inches).
pdf("FOXP1_Figure2_GCB_Heatscatter.pdf", width=4, height=4.8)
# Initial heatscatter plot with the "ylgnbu" color palette.
heatscatter(x, y, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 2.5), ylim=c(-4.2, 2.9))
# Overlay additional layers with manual GCB data using different color palettes and settings.
par(new=TRUE)
heatscatter(x4, y4, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.65, cex.axis=0.4, colpal="greys", nrcol=1, xaxt='n', yaxt='n', xlim=c(-4, 2.5), ylim=c(-4.2, 2.9), axes=F)
par(new=TRUE)
heatscatter(x4, y4, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.45, cex.axis=0.4, colpal="gr2rd", nrcol=1, xaxt='n', yaxt='n', xlim=c(-4, 2.5), ylim=c(-4.2, 2.9), axes=F)
par(new=TRUE)
heatscatter(x4, y4, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 2.5), ylim=c(-4.2, 2.9), abline(h=0.5, col="gray40"))
par(new=TRUE)
heatscatter(x4, y4, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 2.5), ylim=c(-4.2, 2.9), abline(h=-0.5, col="gray40"), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x4, y4, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 2.5), ylim=c(-4.2, 2.9), abline(v=0.5, col="gray40"), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x4, y4, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 2.5), ylim=c(-4.2, 2.9), abline(v=-0.5, col="gray40"), xaxt='n', yaxt='n', axes=F)
dev.off() # Close the PDF device

# Step 5: Load ABC data for Figure 2
# Load two datasets: one for ABC lines and another for manually curated ABC data.
ABCdata <- read.xlsx("Heatscatter_ABC-lines_17-4-15.xlsx", sheetName="Sheet1")
x2 <- ABCdata$Ly3   # X-axis: Ly3 values for ABC
y2 <- ABCdata$HBL1  # Y-axis: HBL1 values for ABC
ABCm <- read.xlsx("Heatscatter-Manual_ABC_17-4-15_v2.xlsx", sheetName="Sheet1")
x3 <- ABCm$Ly3      # X-axis: Ly3 values for manual ABC data
y3 <- ABCm$HBL1     # Y-axis: HBL1 values for manual ABC data

# Step 6: Create heatscatter plot for ABC (Ly3 vs HBL1)
# Open a PDF device to save the plot with the same dimensions as the GCB plot.
pdf("FOXP1_Figure2_ABC_Heatscatter.pdf", width=4, height=4.8)
# Initial heatscatter plot with the "ylgnbu" color palette.
heatscatter(x2, y2, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 3.2), ylim=c(-4, 4.5))
# Overlay additional layers with manual ABC data using different color palettes and settings.
par(new=TRUE)
heatscatter(x3, y3, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.65, cex.axis=0.4, colpal="greys", nrcol=1, xaxt='n', yaxt='n', xlim=c(-4, 3.2), ylim=c(-4, 4.5), axes=F)
par(new=TRUE)
heatscatter(x3, y3, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.45, cex.axis=0.4, colpal="gr2rd", nrcol=1, xaxt='n', yaxt='n', xlim=c(-4, 3.2), ylim=c(-4, 4.5), axes=F)
par(new=TRUE)
heatscatter(x3, y3, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 3.2), ylim=c(-4, 4.5), abline(h=0.5, col="gray40"))
par(new=TRUE)
heatscatter(x3, y3, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 3.2), ylim=c(-4, 4.5), abline(h=-0.5, col="gray40"), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x3, y3, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 3.2), ylim=c(-4, 4.5), abline(v=0.5, col="gray40"), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x3, y3, colpal="ylgnbu", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4, 3.2), ylim=c(-4, 4.5), abline(v=-0.5, col="gray40"), xaxt='n', yaxt='n', axes=F)
dev.off() # Close the PDF device

# Section 2: Heatscatter for FOXP1 Figure 2 (15-4-15)
# This section generates additional heatscatter plots comparing mean expression between GCB and ABC subtypes.

# Step 7: Set the working directory for additional Figure 2 plots
setwd("C:/Users/User/Desktop/RESEARCH/Projects/Microarray & Interactome/R_Studio/FOXP1")

# Step 8: Load GCB vs ABC data for Figure 2
# Load three datasets with mean expression values for GCB vs ABC comparisons.
GCBvsABC3 <- read.xlsx("Mean_Expression_ABC_up1.5_15-4-15_v2.xlsx", sheetName="Sheet1")
x3 <- GCBvsABC3$GCB  # X-axis: GCB mean expression
y3 <- GCBvsABC3$ABC  # Y-axis: ABC mean expression
GCBvsABC4 <- read.xlsx("Mean_Expression_ABC_Non-1.5s_15-4-15.xlsx", sheetName="Sheet1")
x4 <- GCBvsABC4$ABC  # X-axis: ABC mean expression (non-1.5 fold)
y4 <- GCBvsABC4$GCB  # Y-axis: GCB mean expression (non-1.5 fold)
GCBvsABC5 <- read.xlsx("Mean_Expression_Selected_v2.xlsx", sheetName="Sheet1")
x5 <- GCBvsABC5$ABC  # X-axis: ABC mean expression (selected)
y5 <- GCBvsABC5$GCB  # Y-axis: GCB mean expression (selected)

# Step 9: Create heatscatter plot for GCB vs ABC (Chosen Non-Gradient, Non-Alpha Version)
# Open a PDF device to save the plot (dimensions not specified, using default 7x7 inches).
pdf("FOXP1_Figure2_GCBvsABC_Heatscatter.pdf", width=7, height=7)
# Initial heatscatter plot with no color palette (default).
heatscatter(x4, y4, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.5, cex.axis=0.8, nrcol=1, xlim=c(-4.1, 3.2), ylim=c(-4.1, 2.4), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x3, y3, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.5, cex.axis=0.4, colpal="mountain", nrcol=1, xlim=c(-4.1, 3.2), ylim=c(-4.1, 2.4), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x5, y5, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.6, cex.axis=0.4, colpal="spectral", nrcol=1, xlim=c(-4.1, 3.2), ylim=c(-4.1, 2.4), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x3, y3, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 3.2), ylim=c(-4.1, 2.4), abline(h=0.5, col="gray40"))
par(new=TRUE)
heatscatter(x3, y3, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 3.2), ylim=c(-4.1, 2.4), abline(h=-0.5, col="gray40"), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x3, y3, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 3.2), ylim=c(-4.1, 2.4), abline(v=0.46, col="gray40"), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
heatscatter(x3, y3, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 3.2), ylim=c(-4.1, 2.4), abline(v=-0.475, col="gray40"), xaxt='n', yaxt='n', axes=F)
dev.off() # Close the PDF device

# Step 10: Additional GCB vs ABC Heatscatter Plots (Simple Versions)
# These are simpler heatscatter plots for GCB vs ABC comparisons.
pdf("FOXP1_Figure2_GCBvsABC_Simple1_Heatscatter.pdf", width=7, height=7)
GCBvsABC <- read.xlsx("Mean_Expression_GCB-vs-ABC_15-4-15.xlsx", sheetName="Sheet1")
x <- GCBvsABC$GCB
y <- GCBvsABC$ABC
heatscatter(x, y, colpal="heat", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8)
dev.off()

pdf("FOXP1_Figure2_GCBvsABC_Simple2_Heatscatter.pdf", width=7, height=7)
GCBvsABC2 <- read.xlsx("Mean_Expression_GCB-vs-ABC_15-4-15_v2.xlsx", sheetName="Sheet1")
x2 <- GCBvsABC2$GCB
y2 <- GCBvsABC2$ABC
heatscatter(x2, y2, colpal="heat", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8)
dev.off()

# Section 3: Heatscatter for FOXP1 Supplemental Figure 2
# This section generates heatscatter plots for DB, Ly3, K422, and HBL1 cell lines with linear regression lines.

# Step 11: Set the working directory for Supplemental Figure 2
setwd("C:/Users/User/Desktop/RESEARCH/Projects/Microarray & Interactome/FOXP1")

# Step 12: Load and plot DB data for Supplemental Figure 2
DBdata <- read.xlsx("Heatscatter_DB_14-4-15.xlsx", sheetName="Sheet1")
x <- DBdata$DB_308_Avg  # X-axis: DB 308 average
y <- DBdata$DB_309_Avg  # Y-axis: DB 309 average

pdf("FOXP1_SuppFigure2_DB_Heatscatter.pdf", width=540/72, height=460/72) # Convert pixels to inches (72 pixels per inch)
heatscatter(x, y, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), grid(NULL, NULL, lty=6, col="cornsilk2"))
par(new=TRUE)
heatscatter(x, y, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.4, colpal="matlablike", xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
m <- lm(y ~ x) # Fit a linear regression line
heatscatter(x, y, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.1, cex.axis=NULL, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), abline(coef(m), col="cornsilk2"), xaxt='n', yaxt='n', axes=F)
dev.off()

# Step 13: Load and plot Ly3 data for Supplemental Figure 2
# Note: The original script references 'Ly3data' but doesn't load it. Assuming it's the same file structure.
Ly3data <- read.xlsx("Heatscatter_DB_14-4-15.xlsx", sheetName="Sheet1") # Adjust file name if different
x2 <- Ly3data$Ly3_308_Avg  # X-axis: Ly3 308 average
y2 <- Ly3data$Ly3_309_Avg  # Y-axis: Ly3 309 average

pdf("FOXP1_SuppFigure2_Ly3_Heatscatter.pdf", width=540/72, height=460/72)
heatscatter(x2, y2, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), grid(NULL, NULL, lty=6, col="cornsilk2"))
par(new=TRUE)
heatscatter(x2, y2, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.4, colpal="matlablike", xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
m <- lm(y2 ~ x2)
heatscatter(x2, y2, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.1, cex.axis=NULL, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), abline(coef(m), col="cornsilk3"), xaxt='n', yaxt='n', axes=F)
dev.off()

# Step 14: Load and plot K422 data for Supplemental Figure 2
K422data <- read.xlsx("Heatscatter_DB_14-4-15.xlsx", sheetName="Sheet1") # Adjust file name if different
x3 <- K422data$K422_308_Avg  # X-axis: K422 308 average
y3 <- K422data$K422_309_Avg  # Y-axis: K422 309 average

pdf("FOXP1_SuppFigure2_K422_Heatscatter.pdf", width=540/72, height=460/72)
heatscatter(x3, y3, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), grid(NULL, NULL, lty=6, col="cornsilk2"))
par(new=TRUE)
heatscatter(x3, y3, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.4, colpal="matlablike", xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
m <- lm(y3 ~ x3)
heatscatter(x3, y3, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.1, cex.axis=NULL, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), abline(coef(m), col="cornsilk3"), xaxt='n', yaxt='n', axes=F)
dev.off()

# Step 15: Load and plot HBL1 data for Supplemental Figure 2
HBL1data <- read.xlsx("Heatscatter_DB_14-4-15.xlsx", sheetName="Sheet1") # Adjust file name if different
x4 <- HBL1data$HBL1_308_Avg  # X-axis: HBL1 308 average
y4 <- HBL1data$HBL1_309_Avg  # Y-axis: HBL1 309 average

pdf("FOXP1_SuppFigure2_HBL1_Heatscatter.pdf", width=540/72, height=460/72)
heatscatter(x4, y4, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.8, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), grid(NULL, NULL, lty=6, col="cornsilk2"))
par(new=TRUE)
heatscatter(x4, y4, main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.3, cex.axis=0.4, colpal="matlablike", xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), xaxt='n', yaxt='n', axes=F)
par(new=TRUE)
m <- lm(y4 ~ x4)
heatscatter(x4, y4, colpal="matlablike", main=NULL, xlab=NA, ylab=NA, pch=16, cex=0.1, cex.axis=NULL, xlim=c(-4.1, 4.1), ylim=c(-4.1, 4.1), abline(coef(m), col="cornsilk3"), xaxt='n', yaxt='n', axes=F)
dev.off()

# Notes:
# - The script includes alternative plotting options (e.g., non-gradient with alpha) that were not used in the final version.
# - To reverse the color palette, add 'rev=TRUE' to the heatscatter() function (e.g., heatscatter(..., rev=TRUE)).
# - The Supplemental Figure 2 section assumes the same Excel file for Ly3, K422, and HBL1 data; adjust the file names if they are different.
# - Ensure all Excel files are in the specified working directories before running the script.