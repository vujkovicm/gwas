#!/bin/bash
#$ -cwd

# transform the plink files so that they can be formatted into a longGWAS and as a full binary file for the calculation of the kinship (genetic relatedness) matrix
# make sure to exclude individuals with no phenotype data
# longGWAS will not work if there are invidividuals with no phenotype data

CHR=$2

#DIRECTORIES
DIR=/myDir

#EXECUTABLES
#BGI’s latest plink version
PLINK=/myApps/plink-1.9-x86_64/plink

# To make custom-SNP file for longGWAS
$PLINK --noweb \
 --bfile ${DIR}/myStudy-${CHR} \
 --recodeA \
 --remove  ${DIR}/longitudinal/${FILE}/longGWAS.remove \
 --out ${DIR}/longitudinal/myStudy-${CHR}

# To make GCTA kinship matrix
$PLINK --noweb \
 --bfile ${DIR}/myStudy-${CHR} \
 --recode transpose \
 --remove  ${DIR}/longitudinal/${FILE}/longGWAS.remove \
 --out ${DIR}/longitudinal/myStudy-${CHR}

