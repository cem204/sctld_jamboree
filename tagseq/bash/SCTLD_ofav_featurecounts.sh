#!/bin/bash
#./bash/STARfC_ofav.sh
#purpose: quantify ofav aligned RNAseq transcript abundances using featureCounts program to create a counts table on Pegasus
#To start this job from your directory, use:
#bsub -P transcriptomics < /scratch/projects/transcriptomics/ellie/STARfC_ofav.sh

#BSUB -J starfC_ofav
#BSUB -q general
#BSUB -P transcriptomics
#BSUB -o starfC_pdam%J.out
#BSUB -e starfC_pdam%J.err
#BSUB -n 8
#BSUB -W 6:00
#BSUB -u cem204@miami.edu
#BSUB -N

#specify variable containing sequence file prefixes and directory paths
mcs="/scratch/projects/transcriptomics/ellie"
prodir="/scratch/projects/transcriptomics/ellie/projects/SCTLD"
exp="SCTLD"
OFAVsamples="Ofav_na_K79_na_D1control"

echo "These are the .bam files to be quantified using featureCounts"
echo $OFAVsamples
module load subread
featureCounts -t gene \
-g gene_id \
-a ${mcs}/genome_assemblies_genome_gtf/ncbi-genomes-2020-11-18/GCF_002042975.1_ofav_dov_v1_genomic.gtf \
-o ${prodir}/outputs/${exp}_ofav.counts \
${prodir}/outputs/*Aligned.sortedByCoord.out.bam
