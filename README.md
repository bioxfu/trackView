#### clean wig file if necessary
python script/clean_wig.py Expt.crosslink.all.wig

#### convert wig to bedgraph
source activate gmatic
bash script/wig2bedgraph.sh Expt.crosslink.all.wig.clean.wig

##### edit config.yaml file

##### create txdb file if necessary
Rscript script/makeTxdb.R 

##### make tracks using bedgraph files
Rscript script/tracks_maker.R

##### plot tracks
Rscript script/tracks_ploter.R

