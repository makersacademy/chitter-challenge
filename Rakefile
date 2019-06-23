if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end


# task :setup do
#   if ENV['ENVIRONMENT'] == 'test'
#     DataMapper::setup(:default, "postgres://localhost/chitter_test")
#     DataMapper.finalize
#   else
#     DataMapper::setup(:default, "postgres://localhost/chitter")
#     DataMapper.finalize
#   end
# end

# task :teardown do
#   require './lib/database_connection.rb'

#   def setup_test_database
#     p "Setting up test database..."
#     DatabaseConnection.setup(dbname: 'chitter_test')
#     DatabaseConnection.query("TRUNCATE messages;")
#   end
# end