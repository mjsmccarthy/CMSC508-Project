# CMSC 508 Project Team 7

## Description
There are two main components associated with this project. 

1) `Project Proposal`: A proposal that outlines the need for a hospital database. In addition to describing the conceptual and logical design, the proposal also covers the main elements for creating the database using MySQL.

2) `Web Interface`: A friendly user interface to interact with the database, providing a way to handle administrative tasks.

## Project Proposal
For a detailed description of the project proposal, please refer to the [Database Project Proposal](Database_Project_Proposal.docx) file located in the root directory. It outlines the design and logic behind the project. There are also instructions on how to access the web interface.

## Web Interface

The following web interface was implemented using a Cloud SQL database and hosted using App Engine. The source code can be found inside the `phpMyAdmin` directory. 

For a detailed explanation on setting up the interface, the following tutorial was used: [Using phpMyAdmin with Cloud SQL on App Engine standard environment](https://cloud.google.com/sql/docs/mysql/phpmyadmin-on-app-engine). 

There are three main files that must be modified for deployment on App Engine:
  1) `app.yaml`: Primary App Enginge configuration file that specifies how URL paths correspond to request handlers and static files.

  2) `config.inc.php`: The configuration file for phpMyAdmin. This file contains the cloud SQL connection string.
  
  3) `php.ini`: A file that enables functions in App Engine, which are normally disabled.

After those files have been created or modified, the app can be deployed to App Engine and viewed by using the correct URL with your app ID.

## Resources

- `Source Code`: As mentioned, the source code for the web interface can be located inside the `phpMyAdmin` directory.
- `SQL Commands`: To see the SQL commands used to build the sample hospital database, refer to the [project_sql.sql](project_sql.sql) file.

