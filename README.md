#Final project

 - Load libraries, read data in.
 - merge data sets
 - save the merged data sets in csv form 
 - create a list to store file names, to reference in the loop
 - main loop to merge data. Strategy: combine data sets, then take the mean and sd of them.
 - use that as one pair of measurements. Repeat this for all inertial signals.
 - we build masterTable with these pairs, then after the loop is complete, we write that to file.
 - as per the specifications, this output is to a txt, not a csv.
 - we do similar combinations for the remaining non-inertial files, then write to another csv