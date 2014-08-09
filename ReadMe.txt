A wrapper to the Mondrian FoodMart Data Loader

INTRO
-----------------------------

This is a small wrapper to the Mondrian FoodMart Data Loader, the JAR files were taken 
It takes the FoodMart SQL Creation script and loads the data onto the database of your choice.

The script is easily editable to add additional database options.
As is the script assumes that all database servers are running on the local machine, this can be edited before running the wrapper script.

Drivers that are included on this version are:
- ProstgreSQL
- MySQL
- SQL Server & Sybase


Pre-requistes:
------------------------------
- Make sure you have a Java 7 or later in your PATH.
- Unzip the content of data/DataScript.zip found into the 'data' directory.
- Choose one of the following db_types:
    + mysql
    + postgres
    + sqlserver
    + sybase

Usage Instructions
------------------------------
Run the script as follows:

	sh FoodMartLoader.sh --db <db_type>
