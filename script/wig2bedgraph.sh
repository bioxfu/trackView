WIG=$1

wigToBigWig $WIG script/hg19.chrom.sizes $WIG.bigWig

bigWigToBedGraph $WIG.bigWig $WIG.bedGraph
