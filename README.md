# CMSC-508-Project

# Run Project Locally
1) Download the Cloud SDK at the following link to [developer tools](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_sdk_version)
2) Get the Cloud SQL Proxy client and follow the instructions at the following [link](https://cloud.google.com/sql/docs/mysql/quickstart-proxy-test)
3) Start the proxy in its own terminal by using the following command: 
      ```bash
      ./cloud_sql_proxy -instances=<INSTANCE_CONNECTION_NAME>=tcp:3308
      ```
4) After the proxy is running, start the main.py file. You shoud see a message where for view the web app.
