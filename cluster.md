===========
Clustering 
===========

clustering libraries based on enrichment peaks

::

	bamCorrelate Bed-file --BED

	bamFilter/cMYC-LP1.sort.rmdup.filt.bam bamFilter/cMYC-LP2.sort.rmdup.filt.bam bamFilter/cMYC-LP3.sort.rmdup.filt.bam bamFilter/EZH2-LP1.sort.rmdup.filt.bam bamFilter/EZH2-LP2.sort.rmdup.filt.bam bamFilter/EZH2-LP3.sort.rmdup.filt.bam bamFilter/H3K27me3-LP1.sort.rmdup.filt.bam bamFilter/H3K27me3-LP2.sort.rmdup.filt.bam bamFilter/H3K27me3-LP3.sort.rmdup.filt.bam bamFilter/Input-MCL-LP.sort.rmdup.filt.bam

	bamFilter/cMYC-HP1.sort.rmdup.filt.bam bamFilter/cMYC-HP2.sort.rmdup.filt.bam bamFilter/cMYC-HP3.sort.rmdup.filt.bam bamFilter/cMYC-HP4.sort.rmdup.filt.bam bamFilter/cMYC-HP5.sort.rmdup.filt.bam bamFilter/EZH2-HP1.sort.rmdup.filt.bam bamFilter/EZH2-HP2.sort.rmdup.filt.bam bamFilter/EZH2-HP3.sort.rmdup.filt.bam bamFilter/EZH2-HP4.sort.rmdup.filt.bam bamFilter/EZH2-HP5.sort.rmdup.filt.bam bamFilter/H3K27me3-HP1.sort.rmdup.filt.bam bamFilter/H3K27me3-HP2.sort.rmdup.filt.bam bamFilter/H3K27me3-HP3.sort.rmdup.bam bamFilter/H3K27me3-HP4.sort.rmdup.filt.bam bamFilter/H3K27me3-HP5.sort.rmdup.filt.bam bamFilter/Input-MCL-HP.sort.rmdup.filt.bam [

	for i in bamFilter/*bam; do echo "\#\!/bin/bash -l xx module unload python/2.6.5 xx module load deepTools/1.5.11 xx time bamCorrelate BED-file --BED  -";done |sed 's/\\//g' |sed 's/xx/\n/'

for the peaks, it can be of 2 types:  http://bedops.readthedocs.org/en/latest/content/reference/set-operations/bedops.html
 
	bedops --difference regions found within ther first input and excluding regions in all other input files
 
 * The reference is the sample peak file, the second input would be the input
 
 * The other would be using ``--not-elemen-of`` elements in the reference file which do not overlap in the second file at all
	The first file would be the sample peak file , the second would be the input
 	--not-element-of (-n) can be specified either by length in bases, or by percentage of length.
 
::
 
	bedops --not-element-of 1 First.bed Second.bed > Result.bed
 
Here each sample minus the input ::

	bedops --not-element-of 1 EZH2-HP1_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > EZH2-HP1_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 EZH2-HP2_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > EZH2-HP2_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 EZH2-HP3_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > EZH2-HP3_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 EZH2-HP4_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > EZH2-HP4_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 EZH2-HP5_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > EZH2-HP5_vs_Input-HP_peaks.bed

   	bedops --not-element-of 1 EZH2-LP1_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed > EZH2-LP1_vs_Input-LP_peaks.bed
   	bedops --not-element-of 1 EZH2-LP2_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed > EZH2-LP2_vs_Input-LP_peaks.bed
   	bedops --not-element-of 1 EZH2-LP3_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed > EZH2-LP3_vs_Input-LP_peaks.bed

   	bedops --not-element-of 1 H3K27me3-HP1_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > H3K27me3-HP1_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 H3K27me3-HP2_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > H3K27me3-HP2_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 H3K27me3-HP3_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > H3K27me3-HP3_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 H3K27me3-HP4_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > H3K27me3-HP4_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 H3K27me3-HP5_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > H3K27me3-HP5_vs_Input-HP_peaks.bed

   	bedops --not-element-of 1 H3K27me3-LP1_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed >  H3K27me3-LP1_vs_Input-LP_peaks.bed
   	bedops --not-element-of 1 H3K27me3-LP2_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed >  H3K27me3-LP2_vs_Input-LP_peaks.bed
   	bedops --not-element-of 1 H3K27me3-LP3_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed >  H3K27me3-LP3_vs_Input-HP_peaks.bed

   	bedops --not-element-of 1 cMYC-HP1_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > cMYC-HP1_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 cMYC-HP2_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > cMYC-HP2_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 cMYC-HP3_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > cMYC-HP3_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 cMYC-HP4_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > cMYC-HP4_vs_Input-HP_peaks.bed
   	bedops --not-element-of 1 cMYC-HP5_peaks.broadPeak.bed Input-MCL-HP_peaks.broadPeak.bed > cMYC-HP5_vs_Input-HP_peaks.bed

   	bedops --not-element-of 1 cMYC-LP1_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed >  cMYC-LP1_vs_Input-LP_peaks.bed
   	bedops --not-element-of 1 cMYC-LP2_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed >  cMYC-LP2_vs_Input-LP_peaks.bed
   	bedops --not-element-of 1 cMYC-LP3_peaks.broadPeak.bed Input-MCL-LP_peaks.broadPeak.bed >  cMYC-LP3_vs_Input-LP_peaks.bed

   	bedops --not-element-of 1 CLLM1-cMYC-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  cMYC-CLLM1_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM2-cMYC-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  cMYC-CLLM2_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM3-cMYC-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  cMYC-CLLM3_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM4-cMYC-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  cMYC-CLLM4_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM6-cMYC-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  cMYC-CLLM6_vs_Input-CLLM_peaks.bed

   	bedops --not-element-of 1 CLLM1-EZH2-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  EZH2-CLLM1_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM2-EZH2-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  EZH2-CLLM2_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM3-EZH2-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  EZH2-CLLM3_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM4-EZH2-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  EZH2-CLLM4_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM5-EZH2-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  EZH2-CLLM5_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM6-EZH2-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  EZH2-CLLM6_vs_Input-CLLM_peaks.bed

   	bedops --not-element-of 1 CLLM1-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  H3K27me3-CLLM1_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM2-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  H3K27me3-CLLM2_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM3-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  H3K27me3-CLLM3_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM4-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  H3K27me3-CLLM4_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM5-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  H3K27me3-CLLM5_vs_Input-CLLM_peaks.bed
   	bedops --not-element-of 1 CLLM6-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLM_peaks.broadPeak.bed >  H3K27me3-CLLM6_vs_Input-CLLM_peaks.bed
   
   	bedops --not-element-of 1 CLLUM1-cMYC-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  cMYC-CLLUM1_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM2-cMYC-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  cMYC-CLLUM2_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM3-cMYC-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  cMYC-CLLUM3_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM4-cMYC-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  cMYC-CLLUM4_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM5-cMYC-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  cMYC-CLLUM5_vs_Input-CLLUM_peaks.bed
    
   	bedops --not-element-of 1 CLLUM1-EZH2-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  EZH2-CLLUM1_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM2-EZH2-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  EZH2-CLLUM2_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM3-EZH2-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  EZH2-CLLUM3_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM4-EZH2-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  EZH2-CLLUM4_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM5-EZH2-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  EZH2-CLLUM5_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM6-EZH2-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  EZH2-CLLUM6_vs_Input-CLLUM_peaks.bed

   	bedops --not-element-of 1 CLLUM1-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  H3K27me3-CLLUM1_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM2-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  H3K27me3-CLLUM2_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM3-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  H3K27me3-CLLUM3_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM4-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  H3K27me3-CLLUM4_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM5-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  H3K27me3-CLLUM5_vs_Input-CLLUM_peaks.bed
   	bedops --not-element-of 1 CLLUM6-H3K27me3-Ab_peaks.broadPeak.bed Input-CLLUM_peaks.broadPeak.bed >  H3K27me3-CLLUM6_vs_Input-CLLUM_peaks.bed
 
  	bedops --not-element-of 1 Normal-Bcell-EZH2-Ab_peaks.broadPeak.bed Input-normal-B-cell_peaks.broadPeak.bed >  EZH2_Bcell_vs_Input-Bcell_peaks.bed
  	bedops --not-element-of 1 Normal-Bcell-cMYC-Ab_peaks.broadPeak.bed Input-normal-B-cell_peaks.broadPeak.bed >  cMYC_Bcell_vs_Input-Bcell_peaks.bed
  	bedops --not-element-of 1 Normal-Bcell-H3K27me3-Ab_peaks.broadPeak.bed Input-normal-B-cell_peaks.broadPeak.bed >  H3K27me3_Bcell_vs_Input-Bcell_peaks.bed
 
 
Intersect to set a min num of files having the peak::
 
  	multiIntersectBed -i EZH2-HP1_vs_Input-HP_peaks.bed EZH2-HP2_vs_Input-HP_peaks.bed EZH2-HP3_vs_Input-HP_peaks.bed EZH2-HP4_vs_Input-HP_peaks.bed EZH2-HP5_vs_Input-HP_peaks.bed >  EZH2-HP.intersectAll.bed

 	multiIntersectBed  -i EZH2-LP1_vs_Input-LP_peaks.bed EZH2-LP2_vs_Input-LP_peaks.bed EZH2-LP3_vs_Input-LP_peaks.bed > EZH2-LP.intersectAll.bed
	multiIntersectBed -i cMYC-HP1_vs_Input-HP_peaks.bed cMYC-HP2_vs_Input-HP_peaks.bed cMYC-HP3_vs_Input-HP_peaks.bed cMYC-HP4_vs_Input-HP_peaks.bed cMYC-HP5_vs_Input-HP_peaks.bed > cMYC-HP.intersectAll.bed
	multiIntersectBed -i cMYC-LP1_vs_Input-LP_peaks.bed cMYC-LP2_vs_Input-LP_peaks.bed cMYC-LP3_vs_Input-LP_peaks.bed > cMYC-LP.intersectAll.bed
	multiIntersectBed  -i H3K27me3-HP1_vs_Input-HP_peaks.bed H3K27me3-HP2_vs_Input-HP_peaks.bed H3K27me3-HP3_vs_Input-HP_peaks.bed H3K27me3-HP4_vs_Input-HP_peaks.bed H3K27me3-HP5_vs_Input-HP_peaks.bed > H3K27me3-HP.intersectAll.bed
	multiIntersectBed -i H3K27me3-LP1_vs_Input-LP_peaks.bed H3K27me3-LP2_vs_Input-LP_peaks.bed H3K27me3-LP3_vs_Input-HP_peaks.bed > H3K27me3-LP.intersectAll.bed
	multiIntersectBed -i cMYC-CLLM1_vs_Input-CLLM_peaks.bed cMYC-CLLM2_vs_Input-CLLM_peaks.bed cMYC-CLLM3_vs_Input-CLLM_peaks.bed cMYC-CLLM4_vs_Input-CLLM_peaks.bed cMYC-CLLM6_vs_Input-CLLM_peaks.bed > cMYC-CLLM6.intersectAll.bed
	multiIntersectBed -i cMYC-CLLUM1_vs_Input-CLLUM_peaks.bed cMYC-CLLUM2_vs_Input-CLLUM_peaks.bed cMYC-CLLUM3_vs_Input-CLLUM_peaks.bed cMYC-CLLUM4_vs_Input-CLLUM_peaks.bed cMYC-CLLUM5_vs_Input-CLLUM_peaks.bed > cMYC-CLLUM.intersectAll.bed
 
	multiIntersectBed -i cMYC-CLLUM1_vs_Input-CLLUM_peaks.bed  cMYC-CLLUM3_vs_Input-CLLUM_peaks.bed cMYC-CLLUM4_vs_Input-CLLUM_peaks.bed cMYC-CLLUM5_vs_Input-CLLUM_peaks.bed > cMYC-CLLUM.intersectAll.bed
	multiIntersectBed  -i EZH2-CLLM1_vs_Input-CLLM_peaks.bed EZH2-CLLM2_vs_Input-CLLM_peaks.bed EZH2-CLLM3_vs_Input-CLLM_peaks.bed EZH2-CLLM4_vs_Input-CLLM_peaks.bed EZH2-CLLM5_vs_Input-CLLM_peaks.bed EZH2-CLLM6_vs_Input-CLLM_peaks.bed > EZH2-CLLM.intersectAll.bed
	multiIntersectBed -i EZH2-CLLUM1_vs_Input-CLLUM_peaks.bed EZH2-CLLUM2_vs_Input-CLLUM_peaks.bed EZH2-CLLUM3_vs_Input-CLLUM_peaks.bed EZH2-CLLUM4_vs_Input-CLLUM_peaks.bed EZH2-CLLUM5_vs_Input-CLLUM_peaks.bed EZH2-CLLUM6_vs_Input-CLLUM_peaks.bed > EZH2-CLLUM.intersectAll.bed
	multiIntersectBed  -i H3K27me3-CLLM1_vs_Input-CLLM_peaks.bed H3K27me3-CLLM2_vs_Input-CLLM_peaks.bed H3K27me3-CLLM3_vs_Input-CLLM_peaks.bed H3K27me3-CLLM4_vs_Input-CLLM_peaks.bed H3K27me3-CLLM5_vs_Input-CLLM_peaks.bed H3K27me3-CLLM6_vs_Input-CLLM_peaks.bed  > H3K27me3-CLLM.intersectAll.bed
	multiIntersectBed -i H3K27me3-CLLUM1_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM2_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM3_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM4_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM5_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM6_vs_Input-CLLUM_peaks.bed > H3K27me3-CLLUM.intersectAll.bed
	multiIntersectBed -i cMYC-HP1_vs_Input-HP_peaks.bed cMYC-HP2_vs_Input-HP_peaks.bed cMYC-HP3_vs_Input-HP_peaks.bed cMYC-HP4_vs_Input-HP_peaks.bed cMYC-HP5_vs_Input-HP_peaks.bed cMYC-LP1_vs_Input-LP_peaks.bed cMYC-LP2_vs_Input-LP_peaks.bed cMYC-LP3_vs_Input-LP_peaks.bed > cMYC-CML.intersectAll.bed
	multiIntersectBed  -i EZH2-HP1_vs_Input-HP_peaks.bed EZH2-HP2_vs_Input-HP_peaks.bed EZH2-HP3_vs_Input-HP_peaks.bed  EZH2-HP4_vs_Input-HP_peaks.bed EZH2-HP5_vs_Input-HP_peaks.bed EZH2-LP1_vs_Input-LP_peaks.bed EZH2-LP2_vs_Input-LP_peaks.bed EZH2-LP3_vs_Input-LP_peaks.bed > EZH2-MCL.intersectAll.bed
	multiIntersectBed -i H3K27me3-HP1_vs_Input-HP_peaks.bed H3K27me3-HP2_vs_Input-HP_peaks.bed H3K27me3-HP3_vs_Input-HP_peaks.bed H3K27me3-HP4_vs_Input-HP_peaks.bed H3K27me3-HP5_vs_Input-HP_peaks.bed > H3K27me3-MCL.intersectAll.bed

Merge duplicates::


	bedops --merge EZH2-HP1_vs_Input-HP_peaks.bed EZH2-HP2_vs_Input-HP_peaks.bed EZH2-HP3_vs_Input-HP_peaks.bed EZH2-HP4_vs_Input-HP_peaks.bed EZH2-HP5_vs_Input-HP_peaks.bed >  EZH2-HP.peaks.merged.bed
	bedops --merge EZH2-LP1_vs_Input-LP_peaks.bed EZH2-LP2_vs_Input-LP_peaks.bed EZH2-LP3_vs_Input-LP_peaks.bed > EZH2-LP.peaks.merged.bed
 
	bedops --merge H3K27me3-HP1_vs_Input-HP_peaks.bed H3K27me3-HP2_vs_Input-HP_peaks.bed H3K27me3-HP3_vs_Input-HP_peaks.bed H3K27me3-HP4_vs_Input-HP_peaks.bed H3K27me3-HP5_vs_Input-HP_peaks.bed > H3K27me3-HP.peaks.merged.bed
	bedops --merge H3K27me3-LP1_vs_Input-LP_peaks.bed H3K27me3-LP2_vs_Input-LP_peaks.bed H3K27me3-LP3_vs_Input-HP_peaks.bed > H3K27me3-LP.peaks.merged.bed

	bedops --merge cMYC-HP1_vs_Input-HP_peaks.bed  cMYC-HP2_vs_Input-HP_peaks.bed cMYC-HP3_vs_Input-HP_peaks.bed cMYC-HP4_vs_Input-HP_peaks.bed cMYC-HP5_vs_Input-HP_peaks.bed > cMYC-HP.peaks.merged.bed
	bedops --merge cMYC-LP1_vs_Input-LP_peaks.bed cMYC-LP2_vs_Input-LP_peaks.bed cMYC-LP3_vs_Input-LP_peaks.bed > cMYC-LP.peaks.merged.bed

	bedops --merge cMYC-CLLM1_vs_Input-CLLM_peaks.bed cMYC-CLLM2_vs_Input-CLLM_peaks.bed cMYC-CLLM3_vs_Input-CLLM_peaks.bed cMYC-CLLM4_vs_Input-CLLM_peaks.bed cMYC-CLLM6_vs_Input-CLLM_peaks.bed > cMYC-CLLM.peaks.merged.bed
	bedops --merge EZH2-CLLM1_vs_Input-CLLM_peaks.bed EZH2-CLLM2_vs_Input-CLLM_peaks.bed EZH2-CLLM3_vs_Input-CLLM_peaks.bed EZH2-CLLM4_vs_Input-CLLM_peaks.bed EZH2-CLLM5_vs_Input-CLLM_peaks.bed EZH2-CLLM6_vs_Input-CLLM_peaks.bed > EZH2-CLLM.peaks.merged.bed
	bedops --merge  H3K27me3-CLLM1_vs_Input-CLLM_peaks.bed H3K27me3-CLLM2_vs_Input-CLLM_peaks.bed H3K27me3-CLLM3_vs_Input-CLLM_peaks.bed H3K27me3-CLLM4_vs_Input-CLLM_peaks.bed H3K27me3-CLLM5_vs_Input-CLLM_peaks.bed H3K27me3-CLLM6_vs_Input-CLLM_peaks.bed > H3K27me3-CLLM.peaks.merged.bed
   
	bedops --merge  cMYC-CLLUM1_vs_Input-CLLUM_peaks.bed cMYC-CLLUM2_vs_Input-CLLUM_peaks.bed cMYC-CLLUM3_vs_Input-CLLUM_peaks.bed cMYC-CLLUM4_vs_Input-CLLUM_peaks.bed cMYC-CLLUM5_vs_Input-CLLUM_peaks.bed > cMYC-CLLUM.peaks.merged.bed
	bedops --merge EZH2-CLLUM1_vs_Input-CLLUM_peaks.bed EZH2-CLLUM2_vs_Input-CLLUM_peaks.bed EZH2-CLLUM3_vs_Input-CLLUM_peaks.bed EZH2-CLLUM4_vs_Input-CLLUM_peaks.bed EZH2-CLLUM5_vs_Input-CLLUM_peaks.bed EZH2-CLLUM6_vs_Input-CLLUM_peaks.bed > EZH2-CLLUM.peaks.merged.bed
	bedops --merge H3K27me3-CLLUM1_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM2_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM3_vs_Input-CLLUM_peaks.bed  H3K27me3-CLLUM4_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM5_vs_Input-CLLUM_peaks.bed H3K27me3-CLLUM6_vs_Input-CLLUM_peaks.bed > H3K27me3-CLLUM.peaks.merged.bed
 
 
intersect MCL::

 	bedops --intersect  EZH2-HP.peaks.merged.bed EZH2-LP.peaks.merged.bed > last/EZH2-MCL.peaks.bed
  	bedops --intersect   H3K27me3-HP.peaks.merged.bed  H3K27me3-LP.peaks.merged.bed > last/H3K27me3-MCL.peaks.bed
   	bedops --intersect  cMYC-HP.peaks.merged.bed cMYC-LP.peaks.merged.bed > last/cMYC-MCL.peaks.bed

Last names::

	cp EZH2_Bcell_vs_Input-Bcell_peaks.bed last/EZH2_Bcell.peaks.bed
	cp cMYC_Bcell_vs_Input-Bcell_peaks.bed last/cMYC_Bcell.peaks.bed 
	cp H3K27me3_Bcell_vs_Input-Bcell_peaks.bed last/H3K27me3_Bcell.peaks.bed
 
	cp cMYC-CLLM.peaks.merged.bed last/cMYC-CLLM.peaks.bed
	cp EZH2-CLLM.peaks.merged.bed last/EZH2-CLLM.peaks.bed
	cp H3K27me3-CLLM.peaks.merged.bed last/H3K27me3-CLLM.peaks.bed
 
	cp cMYC-CLLUM.peaks.merged.bed last/cMYC-CLLUM.peaks.bed
	cp EZH2-CLLUM.peaks.merged.bed last/EZH2-CLLUM.peaks.bed
	cp H3K27me3-CLLUM.peaks.merged.bed last/H3K27me3-CLLUM.peaks.bed


Annotation (not sure if this is up to date)::
 
	for i in *bed; do echo "./peakAnnotation.pl $i > $i.R";done
	for i in *R; do echo "source('Z:/Projects/B16-006_Meena_MD/peaks/$i') ";done




. . . . .


loose for MCL (HP and LP) tight for (CLLM and CLLUM)
merging data::



	comm -12 H3K27me3-HP.intersectAll.inputClosest.raw.ann_3.genes H3K27me3-LP.intersectAll.inputClosest.raw.ann_2.genes   | sort -u  > H3K27me3-MCL..intersectAll.inputClosest.raw.ann_3_2.genes
	comm -12 cMYC-HP.intersectAll.inputClosest.raw.ann_3.genes cMYC-LP.intersectAll.inputClosest.raw.ann_2.genes | sort -u > cMYC-MCL.intersectAll.inputClosest.raw.ann_3_2.genes
	comm -12 EZH2-HP.intersectAll.inputClosest.raw.ann_3.genes EZH2-LP.intersectAll.inputClosest.raw.ann_2.genes | sort -u > EZH2-MCL.intersectAll.inputClosest.raw.ann_3_2.genes



../compare2Files.pl ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes H3K27me3-MCL.intersectAll.inputClosest.raw.ann_4_2.genes | grep Bcell -v | cut -f1 > H3K27me3_MCL
../compare2Files.pl ../cMYC_Bcell.intersectAll.inputClosest.raw.ann.genes cMYC-MCL.intersectAll.inputClosest.raw.ann_3_2.genes | grep Bcell -v | cut -f1 > CMYC_MCL
../compare2Files.pl ../EZH2_Bcell.intersectAll.inputClosest.raw.ann.genes EZH2-MCL.intersectAll.inputClosest.raw.ann_3_2.genes | grep Bcell -v | cut -f1 > EZH2_MCL


../high/getType.pl H3K27me3_MCL | cut -f2 | sort | uniq -c | sed 's/^ \{1,10\}//' > H3K27me3-MCL.type
../high/getType.pl EZH2_MCL | cut -f2 | sort | uniq -c | sed 's/^ \{1,10\}//' > EZH2-MCL.type
../high/getType.pl CMYC_MCL | cut -f2 | sort | uniq -c | sed 's/^ \{1,10\}//' > cMYC-MCL.type


.... something else here


EZH2 vs H3K27me3 target genes::

  ../compare3Files.pl ../EZH2_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/EZH2-CLLM.intersectAll.inputClosest.raw.ann_5.genes ../high/EZH2-CLLUM.intersectAll.inputClosest.raw.ann_5.genes   | grep EZH2-CLLM |grep EZH2-CLLUM |grep EZH2_Bcell -v  |cut -f1 > EZH2_CLL_common

  ../compare3Files.pl ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/H3K27me3-CLLM.intersectAll.inputClosest.raw.ann_5.genes ../high/H3K27me3-CLLUM.intersectAll.inputClosest.raw.ann_5.genes   | grep H3K27me3-CLLM |grep H3K27me3-CLLUM |grep H3K27me3_Bcell -v  | cut -f1  > H3K27me3_CLL_common







STK31
AC124057.5
SLC25A6P3
ARL6IP1P3
MIR3685
RP11-685G9.4



            ../compare2Files.pl  ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../loose/H3K27me3-HP.intersectAll.inputClosest.raw.ann_3.genes   | grep H3K27me3-HP |grep H3K27me3_Bcell -v |cut -f1 > H3K27me3-HP
 1487             ../compare2Files.pl  ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../loose/H3K27me3-LP.intersectAll.inputClosest.raw.ann_2.genes   | grep H3K27me3-LP |grep H3K27me3_Bcell -v |cut -f1 > H3K27me3-LP
 1489             ../compare2Files.pl  ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../loose/EZH2-LP.intersectAll.inputClosest.raw.ann_2.genes   | grep EZH2-LP |grep EZH2_Bcell -v |cut -f1 > EZH2-LP
 1497             ../compare2Files.pl  ../EZH2_Bcell.intersectAll.inputClosest.raw.ann.genes ../loose/EZH2-LP.intersectAll.inputClosest.raw.ann_2.genes   | grep EZH2-LP |grep EZH2_Bcell -v  | cut -f1  > EZH2-LP
 1498             ../compare2Files.pl  ../EZH2_Bcell.intersectAll.inputClosest.raw.ann.genes ../loose/EZH2-HP.intersectAll.inputClosest.raw.ann_3.genes   | grep EZH2-HP |grep EZH2_Bcell -v  | cut -f1  > EZH2-HP
 1503  ../compare2Files.pl ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/H3K27me3-CLLM.intersectAll.inputClosest.raw.ann_5.genes  | grep H3K27me3-CLLM   |grep H3K27me3_Bcell -v  | cut -f1  >  H3K27me3-CLLM
 1505  ../compare2Files.pl ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/H3K27me3-CLLUM.intersectAll.inputClosest.raw.ann_5.genes  | grep H3K27me3-CLLUM   |grep H3K27me3_Bcell -v  | cut -f1  >  H3K27me3-CLLUM
 1507  ../compare2Files.pl ../EZH2_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/EZH2-CLLUM.intersectAll.inputClosest.raw.ann_5.genes  | grep EZH2-CLLUM   |grep EZH2_Bcell -v  | cut -f1  >  EZH2-CLLUM
 1510  ../compare2Files.pl ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/H3K27me3-CLLUM.intersectAll.inputClosest.raw.ann_5.genes  | grep H3K27me3-CLLUM   |grep H3K27me3_Bcell -v  | cut -f1  > H3K27me3-CLLUM
 1512  ../compare2Files.pl ../H3K27me3_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/H3K27me3-CLLUM.intersectAll.inputClosest.raw.ann_5.genes  | grep H3K27me3-CLLUM   |grep H3K27me3_Bcell -v  | cut -f1  > H3K27me3-CLLUM
 1514  ../compare2Files.pl ../EZH2_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/EZH2-CLLUM.intersectAll.inputClosest.raw.ann_5.genes  | grep EZH2-CLLUM   |grep EZH2_Bcell -v  | cut -f1  > EZH2-CLLUM
 1516  ../compare2Files.pl ../EZH2_Bcell.intersectAll.inputClosest.raw.ann.genes ../high/EZH2-CLLM.intersectAll.inputClosest.raw.ann_5.genes  | grep EZH2-CLLM   |grep EZH2_Bcell -v  | cut -f1  >  EZH2-CLLM
