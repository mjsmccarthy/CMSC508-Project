# [START gae_python37_cloudsql_mysql_pooling]
import os

from flask import Flask, request, render_template, redirect, url_for
import sqlalchemy
from sqlalchemy import exc

db_user = 'client'
db_password = 'cmsc508_project'
db_name = 'project'
db_connection_name = 'cmsc508-project-258320:us-central1:myinstance'

# When deployed to App Engine, the `GAE_ENV` environment variable will be
# set to `standard`
if os.environ.get('GAE_ENV') == 'standard':
    # If deployed, use the local socket interface for accessing Cloud SQL
    unix_socket = '/cloudsql/{}'.format(db_connection_name)
    engine_url = 'mysql+pymysql://{}:{}@/{}?unix_socket={}'.format(
        db_user, db_password, db_name, unix_socket)
else:
    # If running locally, use the TCP connections instead
    # Set up Cloud SQL Proxy (cloud.google.com/sql/docs/mysql/sql-proxy)
    # so that your application can use 127.0.0.1:3306 to connect to your
    # Cloud SQL instance
    host = '127.0.0.1'
    port = 3308
    engine_url = 'mysql+pymysql://{}:{}@{}:{}/{}'.format(
        db_user, db_password, host, port, db_name)

# # The Engine object returned by create_engine() has a QueuePool integrated
# # See https://docs.sqlalchemy.org/en/latest/core/pooling.html for more
# # information
engine = sqlalchemy.create_engine(engine_url, pool_size=3)

app = Flask(__name__)


@app.route('/')
def form():
    return render_template('form.html')


@app.route('/', methods=['GET','POST'])
def form_post():
    text = request.form['text']
    cnx = engine.connect()
    try:
        cursor = cnx.execute(text)
    except exc.OperationalError as err:
        return render_template('form.html', err=err)
    result = cursor.fetchall()
    columns = result[0].keys()
    # If the connection comes from a pool, close() will send the connection
    # back to the pool instead of closing it
    cnx.close()
    return render_template('form.html', result=result, columns=columns)
    
# [END gae_python37_cloudsql_mysql_pooling]


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)
