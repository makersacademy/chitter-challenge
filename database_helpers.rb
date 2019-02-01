require 'data_mapper'
require 'pg'

def database_setup
  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(:default, 'postgres://sauleguzyte@/chitter_challenge_test')
  else
    DataMapper.setup(:default, 'postgres://sauleguzyte@/chitter_chalenge')
  end
end

def test_database_set
  puts 'Setting up test database (cleaning)'
  DataMapper.setup(:default, 'postgres://sauleguzyte@/chitter_challenge_test')
  DataMapper.auto_migrate!
end
