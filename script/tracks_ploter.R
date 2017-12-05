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
ymax <- 10

# plot scale bar
gtrack <- GenomeAxisTrack(scale=0.25, col='black')

for (i in 1:length(chrom)) {
  pdf(output[i], hei=2, wid=9)
  plotTracks(c(gtrack, dtrack_list, grtrack), ylim=c(0, ymax),
             chromosome=chrom[i], from=starts[i], to=ends[i],
             lwd=2, type='h', cex.title=1, cex.axis=0.7, cex=1, cex.group=1,
             background.title='white', fontcolor.title='black', col.axis='black', ylab='cDNA')
  dev.off()
}

## HJY need a specific coordinate axis, which can't be drawn by plotTracks
## plot the tracks and axis seperately, and combine them in PPT

# pdf('figure/axis.pdf', hei=2, wid=9)
# par(mar=c(2,4,2,0))
# plot(starts[i]:ends[i], starts[i]:ends[i], ylim=c(0,ymax), xlab='', ylab='cDNA Count', xaxt='n', yaxt='n', bty='n')
# axis(2, at=c(0, ymax), lab=c(0, ymax), las=1)
# axis(3, at=seq(starts[i], ends[i], 1000), lab=rep('', 5),lwd=0,lwd.ticks=1)
# axis(3, at=seq(starts[i], ends[i], 1000)+500, lab=seq(starts[i], ends[i], 1000),lwd=0,line=-1.2,padj=0)
# dev.off()
