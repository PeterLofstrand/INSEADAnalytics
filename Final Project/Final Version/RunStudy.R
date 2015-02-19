
############################################
############################################
# SOME LINES TO MODIFY (if you add/remove lines, these may change!): 24, 28, 29, 30, 34, 38, 42, 46, 49, 52 (typically only 29, 34, 38, 42, 46)
############################################
############################################

# Project Name: "Sessions 2-3 of INSEAD Data Analytics for Business Course: "Dimensionality Reduction and Derived Attributes"

rm(list = ls( ))

######################################################################

# THESE ARE THE PROJECT PARAMETERS NEEDED TO GENERATE THE REPORTset

# When running the case on a local computer, modify this in case you saved the case in a different directory 
# (e.g. local_directory <- "C:/user/MyDocuments" )
# type in the Console below help(getwd) and help(setwd) for more information
local_directory <- paste(getwd(),"Final Project/Final Version", sep="/")
#local_directory <- "~INSEADAnalytics/CourseSessions/Sessions23"

cat("\n *********\n WORKING DIRECTORY IS ", local_directory, "\n PLEASE CHANGE IT IF IT IS NOT CORRECT using setwd(..) - type help(setwd) for more information \n *********")

# Please ENTER the name of the file with the data used. The file should contain a matrix with one row per observation (e.g. person) and one column per attribute. THE NAME OF THIS MATRIX NEEDS TO BE ProjectData (otherwise you will need to replace the name of the ProjectData variable below with whatever your variable name is, which you can see in your Workspace window after you load your file)
datafile_name="RaceData" # do not add .csv at the end! make sure the data are numeric!!!! check your file!

# Please ENTER the filename that indicates subsets of the data to use (e.g. only a specific cluster)
# This file need to have 2 columns with the second one indicating the cluster ID of the observation. 
# The rows of this files are aligned with those of the datafile_name one
# This is used ONLY for the report "MyBoatsDrivers"
cluster_file_ini = "RaceData_cluster" # make sure this file exists in the "data" directory

# Please ENTER the filename of the Report and Slides (in the doc directory) to generate 

report_file = "RaceData Report"
#report_file = "MyBoatsFactor"
slides_file = "RaceData Slides"

# Please ENTER then original raw attributes to use. 
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
factor_attributes_used= c(2:17)

# Please ENTER the selection criterions for the factors to use. 
# Choices: "eigenvalue", "variance", "manual"
factor_selectionciterion = "manual"

# Please ENTER the desired minumum variance explained 
# (ONLY USED in case "variance" is the factor selection criterion used). 
minimum_variance_explained = 65  # between 1 and 100

# Please ENTER the number of factors to use 
# (ONLY USED in case "manual" is the factor selection criterion used).
manual_numb_factors_used = 3

# Please ENTER the rotation eventually used (e.g. "none", "varimax", "quatimax", "promax", "oblimin", "simplimax", and "cluster" - see help(principal)). Defauls is "varimax"
rotation_used="varimax"

# Please enter the minimum number below which you would like not to print - this makes the readability of the tables easier. Default values are either 10e6 (to print everything) or 0.5. Try both to see the difference.
MIN_VALUE=0.5

# Please enter the maximum number of observations to show in the report and slides 
# (DEFAULT is 50. If the number is large the report and slides may not be generated - very slow or will crash!!)
max_data_report = 50 # can also chance in server.R


# Program 2 data starts here


# Please ENTER then original raw attributes to use for the segmentation (the "segmentation attributes")
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
# for boats possibly use: c(28,25,27,14,20,8,3,12,13,5,9,11,2,30,24), for Mall_Visits use c(2:9)
segmentation_attributes_used = c(2,11,8) 

# Please ENTER then original raw attributes to use for the profiling of the segments (the "profiling attributes")
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
profile_attributes_used = c(2:17) # for boats use c(2:82), for Mall_Visits use c(2:9)

# Please ENTER the number of clusters to eventually use for this report
numb_clusters_used = 4 # for boats possibly use 5, for Mall_Visits use 3

# Please enter the minimum distance from "1" the profiling values should have in order to be colored 
# (e.g. using heatmin = 0 will color everything - try it)
heatmin = 0.05

# Please enter the method to use for the profiling (e.g. "hclust" or "kmeans"):
profile_with = "hclust"

# Please ENTER the distance metric eventually used for the clustering in case of hierarchical clustering 
# (e.g. "euclidean", "maximum", "manhattan", "canberra", "binary" or "minkowski" - see help(dist)). 
# DEFAULT is "euclidean"
distance_used="euclidean"

# Please ENTER the hierarchical clustering method to use (options are:
# "ward", "single", "complete", "average", "mcquitty", "median" or "centroid")
# DEFAULT is "ward"
hclust_method = "ward"

# Please ENTER the kmeans clustering method to use (options are:
# "Hartigan-Wong", "Lloyd", "Forgy", "MacQueen"
# DEFAULT is "Lloyd"
kmeans_method = "Lloyd"

# Please enter the minimum number below which you would like not to print - this makes the readability of the tables easier. Default values are either 10e6 (to print everything) or 0.5. Try both to see the difference.
MIN_VALUE=0.1


# Program 3 Data Starts Here


# Please ENTER the class (dependent) variable:
# Please use numbers, not column names! e.g. 82 uses the 82nd column are dependent variable.
# YOU NEED TO MAKE SURE THAT THE DEPENDENT VARIABLES TAKES ONLY 2 VALUES: 0 and 1!!!
dependent_variable = 3

# Please ENTER the attributes to use as independent variables 
# Please use numbers, not column names! e.g. c(1:5, 7, 8) uses columns 1,2,3,4,5,7,8
independent_variables = c(2, 4:11) # use 54-80 for boats

# Please ENTER the profit/cost values for the correctly and wrong classified data:
actual_1_predict_1 = 100
actual_1_predict_0 = -75
actual_0_predict_1 = -50
actual_0_predict_0 = 0

# Please ENTER the probability threshold above which an observations  
# is predicted as class 1:
Probability_Threshold = 60 # between 1 and 99%

# Please ENTER the percentage of data used for estimation
estimation_data_percent = 35
validation_data_percent = 35

# Please enter 0 if you want to "randomly" split the data in estimation and validation/test
random_sampling = 0

# Tree parameter
# PLEASE ENTER THE Tree (CART) complexity control cp (e.g. 0.001 to 0.02, depending on the data)
CART_cp = 0.01

# Please enter the minimum size of a segment for the analysis to be done only for that segment
min_segment = 20

# Please enter the maximum number of observations to show in the report and slides 
# (DEFAULT is 50. If the number is large the report and slides may not be generated - very slow or will crash!!)
max_data_report = 50 # can also chance in server.R


###########################
# Would you like to also start a web application on YOUR LOCAL COMPUTER once the report and slides are generated?
# Select start_webapp <- 1 ONLY if you run the case on your local computer
# NOTE: Running the web application on your LOCAL computer will open a new browser tab
# Otherwise, when running on a server the application will be automatically available
# through the ShinyApps directory

# 1: start application on LOCAL computer, 0: do not start it
# SELECT 0 if you are running the application on a server 
# (DEFAULT is 0). 
start_local_webapp <- 0
# NOTE: You need to make sure the shiny library is installing (see below)

################################################
# Now run everything

# this loads the selected data: DO NOT EDIT THIS LINE
Probability_Threshold = Probability_Threshold/100 # make it between 0 and 1
ProjectData <- read.csv(paste(paste(local_directory, "data", sep="/"), paste(datafile_name,"csv", sep="."), sep = "/"), sep=";", dec=",") # this contains only the matrix ProjectData
ProjectData=data.matrix(ProjectData) 

if (datafile_name == "RaceData")
  colnames(ProjectData)<-gsub("\\."," ",colnames(ProjectData))

factor_attributes_used = unique(sapply(factor_attributes_used,function(i) min(ncol(ProjectData), max(i,1))))
ProjectDataFactor=ProjectData[,factor_attributes_used]

# Program 2

segmentation_attributes_used = unique(sapply(segmentation_attributes_used,function(i) min(ncol(ProjectData), max(i,1))))
profile_attributes_used = unique(sapply(profile_attributes_used,function(i) min(ncol(ProjectData), max(i,1))))

ProjectData_segment=ProjectData[,segmentation_attributes_used]
ProjectData_profile=ProjectData[,profile_attributes_used]
# this is the file name where the CLUSTER_IDs of the observations will be saved
cluster_file = paste(paste(local_directory,"data", sep="/"),paste(paste(datafile_name,"cluster", sep="_"), "csv", sep="."), sep="/")


# Program 3

dependent_variable = unique(sapply(dependent_variable,function(i) min(ncol(ProjectData), max(i,1))))
independent_variables = unique(sapply(independent_variables,function(i) min(ncol(ProjectData), max(i,1))))

if (length(unique(ProjectData[,dependent_variable])) !=2){
  cat("\n*****\n BE CAREFUL, THE DEPENDENT VARIABLE TAKES MORE THAN 2 VALUES...")
  cat("\nSplitting it around its median...\n*****\n ")
  new_dependent = ProjectData[,dependent_variable] > 0*median(ProjectData[,dependent_variable])
  ProjectData[,dependent_variable] <- 1*new_dependent
}

Profit_Matrix = matrix(c(actual_1_predict_1, actual_0_predict_1, actual_1_predict_0, actual_0_predict_0), ncol=2)
colnames(Profit_Matrix)<- c("Predict 1", "Predict 0")
rownames(Profit_Matrix) <- c("Actual 1", "Actual 0")
test_data_percent = 100-estimation_data_percent-validation_data_percent



source(paste(local_directory,"R/library.R", sep="/"))
if (require(shiny) == FALSE) 
  install_libraries("shiny")
CART_control = rpart.control(cp = CART_cp)
source(paste(local_directory,"R/heatmapOutput.R", sep = "/"))
source(paste(local_directory,"R/runcode.R", sep = "/"))

if (start_local_webapp){
  

  # now run the app
  runApp(paste(local_directory,"tools", sep="/"))  
}
