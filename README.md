# CMSC 508 Project Team 7

## Description
The following project is the implementation of a basic web interface for a Cloud SQL database that is hosted using App Engine. The source code can be found inside the `phpMyAdmin` directory. 

For a detailed explanation on setting up the interface, the following tutorial was used: [Using phpMyAdmin with Cloud SQL on App Engine standard environment](https://cloud.google.com/sql/docs/mysql/phpmyadmin-on-app-engine). 

There are three main files that must be modified for deployment on App Engine:
  1) `app.yaml`: Primary App Enginge configuration file that specifies how URL paths correspond to request handlers and static files.
  2) `config.inc.php`: The configuration file for phpMyAdmin. This file contains the cloud SQL connection string.
  3) `php.ini`: A file that enables functions in App Engine, which are normally disabled.

After those files have been created or modified, the app can be deployed to App Engine and viewed by using the correct URL with your app ID.
