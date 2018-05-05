require 'database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup(dbname: 'blahblah_test')
elsif ENV['RACK_ENV'] == 'development'
  DatabaseConnection.setup(dbname: 'blahblah')
elsif ENV['RACK_ENV'] == 'production'
  database_config = {
    host: ENV['RDS_HOSTNAME'],
    port: ENV['RDS_PORT'],
    dbname: ENV['RDS_DB_NAME'],
    user: ENV['RDS_USERNAME'],
    password: ENV['RDS_PASSWORD']
  }
  DatabaseConnection.setup(database_config)
end
