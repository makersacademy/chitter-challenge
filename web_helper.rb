require 'database_connection'

def peep_twice
  Peep.create_peep('first test peep', 75)
  Peep.create_peep('second test peep', 75)
end

def clear_test_database
  DatabaseConnection.query('TRUNCATE TABLE peeps, tag_joiner')
end

def create_account
  Account.create('Malachy', 'Mallig', 'secure123')
end
