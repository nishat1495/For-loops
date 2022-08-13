# For loops
- Author: Nishat Anjum
- Date: 10/08/2022

Calling relevant libraries to run the following codes: magrittyr, dplyr, foreach, iterator


## 1. Looping over vectors

- creating an object and iterating over each element to perform a set of functions

- generating a formula for object mass and indexing the ith position of of the object to get the mass for that position
- Looping over characters

## 2. Using break and next in for loops

- The important difference between them is that while break terminates the loop, next command skips the specified iteration and moves on to the next one.


## 3. Nested for loops in data frame

- Creating a dataframe with student names and codes per day

- Nesting for loop to perform a set of instructions on the first 5 elements of the dataframe, multiplying the number of codes run by students per day by 10.
- 'df$Codes_new[2]' gives the indexed codes run per day for the 2nd student
## 4. Simulation study to generate the sample mean of n data points from a u.d over interval (0,1)
- generating 2 random numbers from a uniform distribution
- repeating this process for 50000 repetitions
- obtaining mean for each pair of points generated from the uniform distribution using mean function
- using set.seed(1) for reproducibility in the generation of random numbers
- generating a histogram to study the distribution of mean using 'hist(Mean, breaks = 40, main = paste("n = ", n))' 

## 5. foreach
- using foreach library
- using %do% operator to combine a dataframe using rbind (x,y)
- generating a foreach function to return square root over i iterations.
- comparing time taken to use foreach function with lapply. lappy is more efficient.

## 6. Appending data files using for loops
- using library haven 
-running a loop for the length of the object containing data files (data_files)
-running a loop from 1: length of (data_files)) and reading each of the dta files, appending them to an empty object appended_applicants
-counting the number of rows in each of the individiual dta files and storing the results in a results vector. 

