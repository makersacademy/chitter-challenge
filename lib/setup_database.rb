# require 'pg'

# p "Setting up test database..."

# connection = PG.connect(dbname: "chitter_test")

# # Clear table 
# connection.exec("TRUNCATE peepers;")

# require './lib/connect_database'

# if ENV['ENVIRONMENT'] == 'test'
#   DatabaseConnection.setup('chitter_test')
# else
#   DatabaseConnection.setup('chitter')
# end
