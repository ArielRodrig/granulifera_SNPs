# predict effects:

cd $WORKDIR/SNPdat

$HOME/Software/vcftools-master/src/cpp/vcftools --vcf \
$WORKDIR/GATK/granulifera_GATK_variants.filtered.biallelic.SNPs.minDP3mac3maxmissing8.recode.vcf \
--bed consensus_outliers_BayeScan_PCAdapt_Ohana.bed --out consensus_outliers_BayeScan_PCAdapt_Ohana --recode --keep-INFO-all

# predict effects
perl $HOME/Software/snpdat-master/SNPdat_v1.0.5.pl \
-i consensus_outliers_BayeScan_PCAdapt_Ohana.recode.vcf \
-f $HOME/Oophaga_sylvatica/OopSyl_NCBI_genome.softmasked.longScafs.fasta \
-g $HOME/Oophaga_sylvatica/GALBA/galba_func.gff3/galba_func.gtf \
-o consensus_outliers_BayeScan_PCAdapt_Ohana.SNPdat-Effects.tsv \
-s consensus_outliers_BayeScan_PCAdapt_Ohana.SNPdat-Effects.summary 

# Export the gene names in a table to be merged with the above results:
gffread -E $HOME/Oophaga_sylvatica/GALBA/galba_func.gff3/galba_func.gff3 --table ID,Name > galba_func.tab 
