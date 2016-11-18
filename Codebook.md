# datacleaningfinalproject

Summaries of all inertias are in data/UCI HAR Dataset/merged/Inertial Signals/all_inertia_summary.txt
That file has rows:

(**Generally, they are in distance/time, but all of these are normalized, so they have no standard units. **)

"body_acc_x" acceleration of the user in the x axis
"body_acc_y" acceleration of the user in the y axis
"body_acc_z" acceleration of the user in the z axis
"body_gyro_x"jerk of the user in the x axis after FFT
"body_gyro_y" jerk of the user in the y axis after FFT
"body_gyro_z" jerk of the user in the z axis after FFT
"total_acc_x" acceleration of the user in the x axis
"total_acc_y" acceleration of the user in the y axis
"total_acc_z"acceleration of the user in the z axis

and columns

"mean" - average of all measurements as calculated by mean()
"sd" - standard deviation of all measurements as calculated by sd()


Summaries of the X and Y data found in 
/test/X_test.txt
/test/Y_test.txt
/train/X_train.txt
/train/Y_train.txt

are in data/UCI HAR Dataset/merged/XYSummary.csv
one measurement for each:
"mean" - average of all measurements as calculated by mean()
"sd" - standard deviation of all measurements as calculated by mean()

Subject_merge.txt has the combined outputs of the activity categories outlined in activity_labels.txt, for test and training sets.

