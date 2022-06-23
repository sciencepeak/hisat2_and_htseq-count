library("R.utils") # provide bzip2 function

write_table_bzip2_wrapper <- function(.output_dataframe, .output_directory, .output_raw_file_name, what_delimiter = "\t", whether_rownames = FALSE, whether_quote = FALSE) {
        
        # https://www.r-bloggers.com/2012/12/write-table-with-proper-column-number-in-the-header/
        
        if (whether_rownames == TRUE) {
                write.table(x = .output_dataframe,
                            file = .output_raw_file_name,
                            sep = what_delimiter,
                            quote = whether_quote,
                            row.names = whether_rownames,
                            col.names = NA)
        } else {
                write.table(x = .output_dataframe,
                            file = .output_raw_file_name,
                            sep = what_delimiter,
                            quote = whether_quote,
                            row.names = whether_rownames)
        }
        

        output_compressed_file_name <- bzip2(.output_raw_file_name, compression = 9, overwrite = T)[1]
        
        file.rename(from = output_compressed_file_name,
                    to = file.path(.output_directory, output_compressed_file_name))
        
        output_compressed_file_name
}
