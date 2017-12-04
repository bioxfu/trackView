library(yaml)
library(Gviz)
library(GenomicFeatures)
library(RColorBrewer)
col_set <- brewer.pal(9, 'Set1')
options(ucscChromosomeNames=FALSE)

config <- yaml.load_file('config.yaml')
sqlite <- config$sqlite
bedgragh <- config$bedgraph
name <- config$name

## For hg19 
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

#txdb <- loadDb(sqlite)

grtrack <- GeneRegionTrack(txdb, collapseTranscripts='longest', transcriptAnnotation='gene', name='Gene', showTitle=F, col='black', fill='black')
#gtrack <- GenomeAxisTrack(scale=0.1, col='black')
gtrack <- GenomeAxisTrack()
dtrack_list <- list()
for (i in 1:length(name)) {
  cat(paste0('Loading ', name[i], '\n'))
  dtrack_list[[i]] <- DataTrack(range=bedgragh[i], name=name[i])
}

save(list = c('txdb', 'grtrack', 'gtrack', 'dtrack_list'), file='data/tracks.RData')
