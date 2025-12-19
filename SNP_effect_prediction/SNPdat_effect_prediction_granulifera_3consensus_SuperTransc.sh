# predict effects:

cd $WORKDIR/SNPdat

$HOME/Software/vcftools-master/src/cpp/vcftools --vcf \ 
granulifera_Supertranscriptome_variants.filtered.biallelic.SNPs.minDP3mac3maxmissing8.recode.vcf \
--bed common_SNPs_Venn_SuperTransc.bed --out consensus_outliers_BayeScan_PCAdapt_Ohana_SuperTransc \
--recode --keep-INFO-all

# reduce headers of the supertranscriptome
cut -d" " -f1 $WORKDIR/LACE/granulifera_superTranscriptome/SuperDuper.sorted.fasta > $WORKDIR/LACE/granulifera_superTranscriptome/SuperDuper.shortheader.fasta

# Predict effects with SNPdat
perl $HOME/Software/snpdat-master/SNPdat_v1.0.5.pl \
-i consensus_outliers_BayeScan_PCAdapt_Ohana_SuperTransc.recode.vcf \
-f $WORKDIR/LACE/granulifera_superTranscriptome/SuperDuper.shortheader.fasta \
-g $WORKDIR/LACE/granulifera_superTranscriptome/granulifera_SuperDuper.GAWN.start-stop.gtf \
-o consensus_outliers_BayeScan_PCAdapt_Ohana_SuperTransc.SNPdat-Effects.tsv \
-s consensus_outliers_BayeScan_PCAdapt_Ohana_SuperTransc.SNPdat-Effects.summary 

