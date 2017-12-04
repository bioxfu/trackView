library(GenomicFeatures)
library(yaml)

config <- yaml.load_file('config.yaml')
gtf <- config$gtf
sqlite <- config$sqlite
GRanges_file <- config$GRanges

## create sqlite file
txdb <- makeTxDbFromGFF(file=gtf, format='gtf')
saveDb(txdb, file=sqlite)

## group transcripts by gene
GRList <- transcriptsBy(txdb, by='gene')
save(GRList, file = GRanges_file)
