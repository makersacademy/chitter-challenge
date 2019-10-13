require 'pg'

def setup_test_database
  puts "\e[37m  Setting up test database...\e[0m"
  DBConnection.setup('chitter_test')
  DBConnection.query("TRUNCATE users, peeps;") # Reset before each test
end
