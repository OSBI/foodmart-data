#!/bin/bash
#
# This software is subject to the terms of the Eclipse Public License v1.0
# Agreement, available at the following URL:
# http://www.eclipse.org/legal/epl-v10.html.
# You must accept the terms of that agreement to use this software.
#
# Copyright (C) 2014 Meteorite Consulting
# All Rights Reserved.
#
# Sample scripts to load Mondrian's database for various databases.
# Based on https://github.com/pentaho/mondrian/blob/master/bin/loadFoodMart.sh

# Determine Java File Separator
case $(uname) in
	Linux|Darwin) JFSeparator=: ;;
	*) JFSeparator=\; ;;
esac

# Setup ClassPath for libraries & drivers
export MonClassPath="./libs/*${JFSeparator}./drivers/*"

# Error routine
error() {
    echo "Error: $1"
    echo
}

# Setup database specific variables.
configureDB()	{
	export DBOptions="-verbose -aggregates -tables -data -indexes"
	export DBCredentials="-outputJdbcUser=foodmart -outputJdbcPassword=foodmart"
	
	case $db in
		('') error "You must specify a database."; exit 1;;
		(mysql)
			export JDriver="-jdbcDrivers=com.mysql.jdbc.Driver"
			export JURL="-outputJdbcURL=jdbc:mysql://localhost/foodmart"
			;;
		(postgres)
			export JDriver="-jdbcDrivers=org.postgresql.Driver"
			export JURL="-outputJdbcURL=jdbc:postgresql://localhost/foodmart"
			;;
		(sqlserver)
			export JDriver="-jdbcDrivers=net.sourceforge.jtds.jdbc.Driver"
			export JURL="-outputJdbcURL=jdbc:jtds:sqlserver://localhost/foodmart"
			;;
		(sybase)
			export JDriver="-jdbcDrivers=net.sourceforge.jtds.jdbc.Driver"
			export JURL="-outputJdbcURL=jdbc:jtds:sybase://localhost/foodmart"
			;;
		(*) error "Unknown database selection."; exit 1;;
	esac
}

# Check which database is to be loaded.
db=
while [ $# -gt 0 ]; do
    case "$1" in
    	(--help) usage; exit 0;;
    	(--db) shift; db="$1"; shift;;
    	(*) error "Unknown argument '$1'"; exit 1;;
    esac
done

# Load the database.
loadData()	{
	configureDB
	java -cp "${MonClassPath}" \
	mondrian.test.loader.MondrianFoodMartLoader \
	-inputFile=./data/FoodMartCreateData.sql \
	${DBOptions} ${JDriver} ${JURL} ${DBCredentials}
}

cd $(dirname $0)
loadData
exit 0
