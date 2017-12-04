library(yaml)
library(Gviz)
library(GenomicFeatures)
library(RColorBrewer)
col_set <- brewer.pal(9, 'Set1')
options(ucscChromosomeNames=FALSE)
options(stringsAsFactors=FALSE)

load('data/tracks.RData')

config <- yaml.load_file('config.yaml')
chrom <- config$chrom
starts <- as.numeric(config$starts)
ends <- as.numeric(config$ends)
output <- config$tracks
  
for (i in 1:length(chrom)) {
  pdf(output[i], hei=3)
  plotTracks(c(gtrack, dtrack_list, grtrack),
             chromosome=chrom[i], from=starts[i], to=ends[i],
             lwd=2, type='h', cex.title=1, cex.axis=0.7, cex=1, cex.group=1,
             background.title='white', fontcolor.title='black', col.axis='black', ylab='cDNA')
  dev.off()
}

