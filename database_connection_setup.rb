require 'data_mapper'

if ENV['ENVIRONMENT'] == 'test'
    DataMapper::setup(:default, "postgres://localhost/chitter_test")
    DataMapper.finalize
else
    DataMapper::setup(:default, "postgres://localhost/chitter")
    DataMapper.finalize
end

# require './lib/database_connection.rb'

# if ENV['ENVIRONMENT'] == 'test'
#   DatabaseConnection.setup(dbname: 'chitter_test')
# else
#   DatabaseConnection.setup(dbname: 'chitter')
# end
