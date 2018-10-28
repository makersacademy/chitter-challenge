require './lib/connection'

def set_database_connection
  if ENV['ENVIRONMENT'] == "test"
    Connection.setup('chitter_test')
    Connection.cleartable
  else
    Connection.setup('chitter')
  end
end

set_database_connection
