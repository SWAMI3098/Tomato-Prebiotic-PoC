#!/usr/bin/env Rscript
# R Package Installation Script for MDMM Tomato Project

cat("Installing required R packages for Metabolite-Driven Microbiome Modulation...\n")

# CRAN packages
cran_packages <- c(
  "tidyverse", "vegan", "WGCNA", "igraph", "caret",
  "randomForest", "glmnet", "pROC", "corrplot", "pheatmap",
  "RColorBrewer", "plotly", "knitr", "rmarkdown", "devtools",
  "testthat", "lintr", "here", "readxl", "writexl"
)

# Bioconductor packages
bioc_packages <- c(
  "phyloseq", "DESeq2", "limma", "ComplexHeatmap",
  "clusterProfiler", "enrichplot", "DOSE", "MultiAssayExperiment"
)

# Install CRAN packages
cat("Installing CRAN packages...\n")
new_packages <- cran_packages[!(cran_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

# Install Bioconductor
cat("Installing Bioconductor packages...\n")
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(bioc_packages, ask = FALSE)

# Verify installations
cat("\n📦 Installation Summary:\n")
cat("CRAN packages:", sum(cran_packages %in% installed.packages()[,"Package"]), "/", length(cran_packages), "\n")
cat("Bioconductor packages:", sum(bioc_packages %in% installed.packages()[,"Package"]), "/", length(bioc_packages), "\n")

cat("✅ R environment setup complete!\n")
