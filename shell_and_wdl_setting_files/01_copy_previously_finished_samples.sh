#!/bin/bash

source_directory=/media/hugolab/DataRAID1/projects/workflows/2015_Cell_WH/htseq_count/htseq_count_result_directory
target_directory=/media/hugolab/DataRAID1/projects/workflows/PRJNA273359/htseq_count/htseq_count_result_directory

rm ${target_directory}/*

for item_file in $(cat previously_finished_samples.txt)
	do
		cp ${source_directory}/${item_file} ${target_directory}
	done

echo "The script runs up to here!"