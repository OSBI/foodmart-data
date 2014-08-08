
INTRO

FoodMart Data Loader.

This is a small wrapper to the Mondrian FoodMart Data Loader, the JAR files were taken 
It takes the FoodMart SQL Creation script and loads the data onto the database of your choice.

The script is easily editable to add additional database options.
As is the script assumes that all database servers are running on the local machine, this can be edited before running the wrapper script.

Drivers that are included on this version are:
- ProstgreSQL
- MySQL
- SQL Server & Sybase


Usage instructions:
  
  1.) Unzip the file DataScript.zip found in the 'data' directory.
  2.) Run the script as follows:
    sh FoodMartLoader.sh --help
