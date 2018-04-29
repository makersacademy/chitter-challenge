require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  db_connection = {
    dbname: 'blahblah_test'
  }
  DatabaseConnection.setup(db_connection)
elsif ENV['RACK_ENV'] == 'development'
  db_connection = {
    dbname: 'blahblah'
  }
  DatabaseConnection.setup(db_connection)
elsif ENV['RACK_ENV'] == 'production'
  db_connection = {
    dbname: ENV['RDS_DB_NAME'],
    user: ENV['RDS_USERNAME'],
    password: ENV['RDS_PASSWORD'],
    host: ENV['RDS_HOSTNAME'],
    port: ENV['RDS_PORT']
  }
  DatabaseConnection.setup(db_connection)
end
