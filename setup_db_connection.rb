def setup
  database = ENV['ENV'] == 'test' ? 'chitter_testing' : 'chitter'
  DatabaseConnection.connect(database)
end
