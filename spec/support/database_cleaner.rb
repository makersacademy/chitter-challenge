require 'pg'
 RSpec.configure do |config|
  config.before(:each) do
    database_cleaner
  end
end

def database_cleaner
  # Setting up test database...
  connection = PG.connect :dbname => 'peeps_db_test'
  # Clear the database
  connection.exec("TRUNCATE TABLE peeps;")
end