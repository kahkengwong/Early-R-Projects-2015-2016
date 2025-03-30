# Early R Projects (2015-2016)

Welcome to the **Early R Projects (2015-2016)** repository! This collection contains R scripts developed between 2015 and 2016 by Kah Keng Wong for research projects in bioinformatics and gene expression analysis of diffuse large B-cell lymphoma (DLBCL) samples and cell lines. 

![Project Status](https://img.shields.io/badge/status-active-brightgreen)
![GitHub last commit](https://img.shields.io/github/last-commit/kahkengwong/Early-R-Projects-2015-2016)
![GitHub languages](https://img.shields.io/github/languages/count/kahkengwong/Early-R-Projects-2015-2016)
![GitHub top language](https://img.shields.io/github/languages/top/kahkengwong/Early-R-Projects-2015-2016)
![Contributors](https://img.shields.io/github/contributors/kahkengwong/Early-R-Projects-2015-2016)

## Repository Overview

This repository includes R scripts for the following projects:
- **FOXP2 Heatmap Analysis**: Line graphs for FOXP2 expression in DLBCL subtypes (GCB and ABC).
- **FOXP1 Heatscatter Analysis**: Heatscatter plots for FOXP1 expression in GCB vs ABC subtypes and other cell lines.
- **HIP1R Expression Analysis**: Heatscatter plots comparing Lenz and VY microarray data for HIP1R in DLBCL.

## Scripts

Below is a list of the R scripts included in this repository, along with their purposes and associated publications:

- **[FOXP2_Heatmap_LineGraphs.R](FOXP2_Heatmap_LineGraphs.R)**  
  Generates line graphs for FOXP2 heatmap data in GCB-DLBCL and ABC-DLBCL subtypes, used in Figure 6 of the Oncotarget paper "FOXP2 contributes to the malignancy of diffuse large B-cell lymphoma through the regulation of the immune microenvironment" (PMID: [27224915](https://pubmed.ncbi.nlm.nih.gov/27224915/)).

- **[FOXP1_Heatscatter_Plots.R](FOXP1_Heatscatter_Plots.R)**  
  Creates heatscatter plots for FOXP1 expression, comparing GCB vs ABC subtypes and cell lines (DB, Ly3, K422, HBL1), used in Figure 2 and Supplemental Figure 2 of the Oncotarget paper "FOXP1 acts as an oncogene in promoting the malignancy of diffuse large B-cell lymphoma through the regulation of the tumor microenvironment" (PMID: [26500140](https://pubmed.ncbi.nlm.nih.gov/26500140/)).

- **[HIP1R_Lenz_vs_VY_Heatscatter.R](HIP1R_Lenz_vs_VY_Heatscatter.R)**  
  Produces a heatscatter plot comparing Lenz and VY microarray data for HIP1R expression in DLBCL, used in the analysis for the Experimental Molecular Pathology paper "Low HIP1R mRNA and protein expression are associated with worse survival in diffuse large B-cell lymphoma patients treated with R-CHOP" (PMID: [26341140](https://pubmed.ncbi.nlm.nih.gov/26341140/)).

## Getting Started

### Prerequisites
To run these scripts, you need:
- **R**: Version 3.0 or higher (most scripts were developed in 2015-2018, so compatibility with older versions is likely).
- **R Packages**: Each script specifies required packages (e.g., `xlsx`, `ggplot2`, `LSD`, `metafor`, `beeswarm`). Install them using `install.packages()` as shown in the scripts.
- **Java**: Required for the `xlsx` package (used in most scripts). Alternatively, you can replace `xlsx` with `readxl` to avoid this dependency.
- **Excel Files**: The scripts reference specific Excel files (e.g., `R_Forest_aCL-only.xlsx`, `Ggplot2_line_ABC-DLBCL.xlsx`). These files are not included in the repository due to potential sensitivity but can be requested if needed (see [Contact](#contact)).

---

## License
This project is licensed under the [MIT License](https://github.com/kahkengwong/GAM_PRSS_REML_Project/blob/main/LICENSE), an open-source license to encourage collaboration and reuse, while ensuring proper attribution to the original author(s). For the full details, please refer to the [LICENSE](https://github.com/kahkengwong/GAM_PRSS_REML_Project/blob/main/LICENSE) file in this repository.


---

## Contributing
Contributions are welcome! Please open an issue or submit a pull request if you have suggestions or improvements.

---

## Contact
All analyses, modeling, and interpretations were conducted by KK Wong. For further information or questions, please email [kahkeng@usm.my](mailto:kahkeng@usm.my) or [kahkeng3@gmail.com](mailto:kahkeng3@gmail.com)

---
