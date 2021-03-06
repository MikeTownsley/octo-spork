# CodeBook

This document describes the variables, the data, and any transformations or work performed to clean up the data.

## Raw Data

The raw data were sourced from `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`. This contains data from smartphone sensors used by 30 subjects in a series of tasks designed to recognise different activities. The subjects are split into a training and test group. The zip file should be downloaded and unzipped. 

Signals from the accelerometer and gyroscope were used. To make the data more interpretable, a range of noise reduction processes were used to partition signals into different domains. Measurements were captured at a constant rate of 50 Hz.

+ acceleration is measured in X, Y, Z physical dimensions
+ acceleration was split into a body component and a gravity component
+ acceleration was used to estimate jerk signals 
+ acceleration (body and gravity) were used to estimate magnitude and jerk magnitude
+ gyroscope is measured in X, Y, Z physical dimensions
+ gyroscope was split into a body component and a gravity component
+ gyroscope was used to estimate jerk signals 
+ gyroscope (body and gravity) were used to estimate magnitude and jerk magnitude

All these mesaures had a prefix `t` to indicate they were measured with respect to time.

A duplicate set of measures was generated by applying a Fast Fourier Transform (FFT). These have an `f` prefix to indicate frequency domain signals.

All measures are normalized and bounded within [-1,1]

Full details of the raw data can be found at `http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`. 

A set of summary statistics were estimated from these signals: 

+ mean(): Mean value
+ std(): Standard deviation
+ mad(): Median absolute deviation 
+ max(): Largest value in array
+ min(): Smallest value in array
+ sma(): Signal magnitude area
+ energy(): Energy measure. Sum of the squares divided by the number of values
+ iqr(): Interquartile range 
+ entropy(): Signal entropy
+ arCoeff(): Autorregresion coefficients with Burg order equal to 4
+ correlation(): correlation coefficient between two signals
+ maxInds(): index of the frequency component with largest magnitude
+ meanFreq(): Weighted average of the frequency components to obtain a mean frequency
+ skewness(): skewness of the frequency domain signal 
+ kurtosis(): kurtosis of the frequency domain signal 
+ bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
+ angle(): Angle between to vectors.

## Data processing

The source file `run_analysis.R` should be placed in the same directory as the unzipped files and subdirectories. `run_analysis.R` does the following:

1. Merges the training and the test sets into a single consolidated data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement (i.e. with `mean()` or `std()`). 
3. Renames variables to give more descriptive names and factor levels.
4. Two data.frames are created: `combined_data`, which has all observations, and `summary_df`, which has the average of each variable for each activity and each subject. 

See the `README.md` for more details.


## Full list of variables in order of appearance in `combined_data`

1. "subjectid"                                                   
2. "timebodyaccelerometermeanX"                                  
3. "timebodyaccelerometermeanY"                                  
4. "timebodyaccelerometermeanZ"                                  
5. "timebodyaccelerometerstandarddeviationX"                     
6. "timebodyaccelerometerstandarddeviationY"                     
7. "timebodyaccelerometerstandarddeviationZ"                     
8. "timegravityaccelerometermeanX"                               
9. "timegravityaccelerometermeanY"                               
10. "timegravityaccelerometermeanZ"                               
11. "timegravityaccelerometerstandarddeviationX"                  
12. "timegravityaccelerometerstandarddeviationY"                  
13. "timegravityaccelerometerstandarddeviationZ"                  
14. "timebodyaccelerometerjerkmeanX"                              
15. "timebodyaccelerometerjerkmeanY"                              
16. "timebodyaccelerometerjerkmeanZ"                              
17. "timebodyaccelerometerjerkstandarddeviationX"                 
18. "timebodyaccelerometerjerkstandarddeviationY"                 
19. "timebodyaccelerometerjerkstandarddeviationZ"                 
20. "timebodygyroscopemeanX"                                      
21. "timebodygyroscopemeanY"                                      
22. "timebodygyroscopemeanZ"                                      
23. "timebodygyroscopestandarddeviationX"                         
24. "timebodygyroscopestandarddeviationY"                         
25. "timebodygyroscopestandarddeviationZ"                         
26. "timebodygyroscopejerkmeanX"                                  
27. "timebodygyroscopejerkmeanY"                                  
28. "timebodygyroscopejerkmeanZ"                                  
29. "timebodygyroscopejerkstandarddeviationX"                     
30. "timebodygyroscopejerkstandarddeviationY"                     
31. "timebodygyroscopejerkstandarddeviationZ"                     
32. "timebodyaccelerometermagnitudemean"                          
33. "timebodyaccelerometermagnitudestandarddeviation"             
34. "timegravityaccelerometermagnitudemean"                       
35. "timegravityaccelerometermagnitudestandarddeviation"          
36. "timebodyaccelerometerjerkmagnitudemean"                      
37. "timebodyaccelerometerjerkmagnitudestandarddeviation"         
38. "timebodygyroscopemagnitudemean"                              
39. "timebodygyroscopemagnitudestandarddeviation"                 
40. "timebodygyroscopejerkmagnitudemean"                          
41. "timebodygyroscopejerkmagnitudestandarddeviation"             
42. "frequencybodyaccelerometermeanX"                             
43. "frequencybodyaccelerometermeanY"                             
44. "frequencybodyaccelerometermeanZ"                             
45. "frequencybodyaccelerometerstandarddeviationX"                
46. "frequencybodyaccelerometerstandarddeviationY"                
47. "frequencybodyaccelerometerstandarddeviationZ"                
48. "frequencybodyaccelerometerjerkmeanX"                         
49. "frequencybodyaccelerometerjerkmeanY"                         
50. "frequencybodyaccelerometerjerkmeanZ"                         
51. "frequencybodyaccelerometerjerkstandarddeviationX"            
52. "frequencybodyaccelerometerjerkstandarddeviationY"            
53. "frequencybodyaccelerometerjerkstandarddeviationZ"            
54. "frequencybodygyroscopemeanX"                                 
55. "frequencybodygyroscopemeanY"                                 
56. "frequencybodygyroscopemeanZ"                                 
57. "frequencybodygyroscopestandarddeviationX"                    
58. "frequencybodygyroscopestandarddeviationY"                    
59. "frequencybodygyroscopestandarddeviationZ"                    
60. "frequencybodyaccelerometermagnitudemean"                     
61. "frequencybodyaccelerometermagnitudestandarddeviation"        
62. "frequencybodybodyaccelerometerjerkmagnitudemean"             
63. "frequencybodybodyaccelerometerjerkmagnitudestandarddeviation"
64. "frequencybodybodygyroscopemagnitudemean"                     
65. "frequencybodybodygyroscopemagnitudestandarddeviation"        
66. "frequencybodybodygyroscopejerkmagnitudemean"                 
67. "frequencybodybodygyroscopejerkmagnitudestandarddeviation"    
68. "activity"                                                    
69. "activitylabel" 

## Full list of variables in order of appearance in `summary_df`

1. "activitylabel"                                               
2. "subjectid"                                                   
3. "timebodyaccelerometermeanX"                                  
4. "timebodyaccelerometermeanY"                                  
5. "timebodyaccelerometermeanZ"                                  
6. "timebodyaccelerometerstandarddeviationX"                     
7. "timebodyaccelerometerstandarddeviationY"                     
8. "timebodyaccelerometerstandarddeviationZ"                     
9. "timegravityaccelerometermeanX"                               
10. "timegravityaccelerometermeanY"                               
11. "timegravityaccelerometermeanZ"                               
12. "timegravityaccelerometerstandarddeviationX"                  
13. "timegravityaccelerometerstandarddeviationY"                  
14. "timegravityaccelerometerstandarddeviationZ"                  
15. "timebodyaccelerometerjerkmeanX"                              
16. "timebodyaccelerometerjerkmeanY"                              
17. "timebodyaccelerometerjerkmeanZ"                              
18. "timebodyaccelerometerjerkstandarddeviationX"                 
19. "timebodyaccelerometerjerkstandarddeviationY"                 
20. "timebodyaccelerometerjerkstandarddeviationZ"                 
21. "timebodygyroscopemeanX"                                      
22. "timebodygyroscopemeanY"                                      
23. "timebodygyroscopemeanZ"                                      
24. "timebodygyroscopestandarddeviationX"                         
25. "timebodygyroscopestandarddeviationY"                         
26. "timebodygyroscopestandarddeviationZ"                         
27. "timebodygyroscopejerkmeanX"                                  
28. "timebodygyroscopejerkmeanY"                                  
29. "timebodygyroscopejerkmeanZ"                                  
30. "timebodygyroscopejerkstandarddeviationX"                     
31. "timebodygyroscopejerkstandarddeviationY"                     
32. "timebodygyroscopejerkstandarddeviationZ"                     
33. "timebodyaccelerometermagnitudemean"                          
34. "timebodyaccelerometermagnitudestandarddeviation"             
35. "timegravityaccelerometermagnitudemean"                       
36. "timegravityaccelerometermagnitudestandarddeviation"          
37. "timebodyaccelerometerjerkmagnitudemean"                      
38. "timebodyaccelerometerjerkmagnitudestandarddeviation"         
39. "timebodygyroscopemagnitudemean"                              
40. "timebodygyroscopemagnitudestandarddeviation"                 
41. "timebodygyroscopejerkmagnitudemean"                          
42. "timebodygyroscopejerkmagnitudestandarddeviation"             
43. "frequencybodyaccelerometermeanX"                             
44. "frequencybodyaccelerometermeanY"                             
45. "frequencybodyaccelerometermeanZ"                             
46. "frequencybodyaccelerometerstandarddeviationX"                
47. "frequencybodyaccelerometerstandarddeviationY"                
48. "frequencybodyaccelerometerstandarddeviationZ"                
49. "frequencybodyaccelerometerjerkmeanX"                         
50. "frequencybodyaccelerometerjerkmeanY"                         
51. "frequencybodyaccelerometerjerkmeanZ"                         
52. "frequencybodyaccelerometerjerkstandarddeviationX"            
53. "frequencybodyaccelerometerjerkstandarddeviationY"            
54. "frequencybodyaccelerometerjerkstandarddeviationZ"            
55. "frequencybodygyroscopemeanX"                                 
56. "frequencybodygyroscopemeanY"                                 
57. "frequencybodygyroscopemeanZ"                                 
58. "frequencybodygyroscopestandarddeviationX"                    
59. "frequencybodygyroscopestandarddeviationY"                    
60. "frequencybodygyroscopestandarddeviationZ"                    
61. "frequencybodyaccelerometermagnitudemean"                     
62. "frequencybodyaccelerometermagnitudestandarddeviation"        
63. "frequencybodybodyaccelerometerjerkmagnitudemean"             
64. "frequencybodybodyaccelerometerjerkmagnitudestandarddeviation"
65. "frequencybodybodygyroscopemagnitudemean"                     
66. "frequencybodybodygyroscopemagnitudestandarddeviation"        
67. "frequencybodybodygyroscopejerkmagnitudemean"                 
68. "frequencybodybodygyroscopejerkmagnitudestandarddeviation"    
69. "activity" 