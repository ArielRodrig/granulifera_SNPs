# Estimate Site Allelic Frequency Likelihoods with ANGSD
cd $WORKDIR
REF=$HOME/Oophaga_sylvatica/OopSyl_NCBI_genome.fasta
population="SAN"
bamlist=$WORKDIR/SAN_bam.list
jobToDo="-nThreads 24 -GL 1 -doSaf 1 -doCounts 1 -ref $REF -anc $REF"
filters="-minInd 8 -minMapQ 20 -minQ 20 -setMinDepthInd 1 -setMaxDepthInd 50 -remove_bads 1 -C 50 -baq 1 -uniqueOnly 1 -only_proper_pairs 1"

# we subset the bam files to exclude the sites on CDS:
$HOME/Software/ANGSD/angsd/angsd -bam $bamlist -out $population $jobToDo $filters -sites $HOME/Oophaga_sylvatica/non-CDS_OopSyl_NCBI_genome.ANGSD.Chr1-10_regions

#	-> Arguments and parameters for all analysis are located in .arg file
#	-> Total number of sites analyzed: 309060573
#	-> Number of sites retained after filtering: 8552937

$HOME/Software/ANGSD/angsd/misc/realSFS SAN.saf.idx -P 24 -fold 1 > SAN_nonCDS_SFS.txt
	