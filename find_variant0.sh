#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --job-name=find_variant
#SBATCH --output=variant.txt
#SBATCH --mail-type=ALL



awk '
NR==FNR{ range[$1,$2,$3]; next }
FNR==1
{
    for(x in range) {
        split(x, check, SUBSEP);
        if($1==check[1] && $2>=check[2] && $2<=check[3]) print $0
    }
}
' CGDB_duplicate_sorted2.txt Chromosome.bed > variants.txt
