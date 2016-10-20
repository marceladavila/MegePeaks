The R scripts merging peaks
===========================
Malin Östensson

The Peaks
---------

<table style="width:40%;">
<colgroup>
<col width="29%" />
<col width="11%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">set</th>
<th align="center">replic</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">cMYC-CLLM_peaks</td>
<td align="center">5</td>
</tr>
<tr class="even">
<td align="center">cMYC-CLLUM_peaks</td>
<td align="center">5</td>
</tr>
<tr class="odd">
<td align="center">cMYC-HP_peaks</td>
<td align="center">5</td>
</tr>
<tr class="even">
<td align="center">cMYC-LP_peaks</td>
<td align="center">3</td>
</tr>
<tr class="odd">
<td align="center">EZH2-CLLM_peaks</td>
<td align="center">6</td>
</tr>
<tr class="even">
<td align="center">EZH2-CLLUM_peaks</td>
<td align="center">6</td>
</tr>
<tr class="odd">
<td align="center">EZH2-HP_peaks</td>
<td align="center">5</td>
</tr>
<tr class="even">
<td align="center">EZH2-LP_peaks</td>
<td align="center">3</td>
</tr>
<tr class="odd">
<td align="center">H3K27me3-CLLM_peaks</td>
<td align="center">6</td>
</tr>
<tr class="even">
<td align="center">H3K27me3-CLLUM_peaks</td>
<td align="center">6</td>
</tr>
<tr class="odd">
<td align="center">H3K27me3-HP_peaks</td>
<td align="center">5</td>
</tr>
<tr class="even">
<td align="center">H3K27me3-LP_peaks</td>
<td align="center">3</td>
</tr>
</tbody>
</table>

There are 12 setups, with 3 to 6 replicates of each

Merging peaks across replicates
-------------------------------

When peaks are overlapping in different replicates, the p-values are merged using Fisher's log-sum test. The peak scores are merged by the average of the scores.

You need to have the R packages `metap` and `intervals` installed This analysis is run by the following command:

    Rscript -e 'source("runAll.R")'

The line

    xn <- "cMYC-CLLM" 

gives the first part of the filenames of the files containing the summary of all the peaks, ending with `.raw.ann`. So this means that these files need to be in the same directory as the scripts. The peak files are in the directory `peaks` inside the working directory.

The final line in the script

    write.table(Y, paste('resultsMerged12Sept/', xn, '.txt', sep=''), quote = F)

tells R to put the result files in the folder `resultsMerged12Sept`. If you prefer you can change this name, but just remember to also make the same change in the script `mergeGenes.R` (see below).

**The columns in the output:**

1.  combP - the merged p-values, calculated using Fisher's combined probability test.
2.  aveS - the average of the scores for the peaks from the replicates that overlap.

Merge by Gene
-------------

The files created in the last step, are here used to merge all the peaks annotated to the same gene. The main steps of the script is:

1.  Filter the peaks which are found in at least 3 of the replicates.
2.  Filter the peaks wihin 1 kb distance from the closest gene
3.  Calculate summary statistics
4.  save the results in the directory `genesMerged22Sept` (this name can be changed)

**The columns in the output** :

1.  Type - type of gene
2.  aveByGene - the average of aveS (above) across all the peaks annotated to a particular gene
3.  N - number of peaks
4.  minP - the minimum of the combP values across the peaks annotated to the gene
5.  range - the distance in bp from the start of the first peak until the end of the last peak for the annotated gene.
6.  wScore - weighted Score, the `aveByGene * N/range`
