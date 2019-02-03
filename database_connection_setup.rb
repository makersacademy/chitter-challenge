require './lib/database_connection'

def select_connection
   if ENV['ENVIRONMENT'] == 'test'
    DBConn.setup('peep_manager_test')
  else
    DBConn.setup('peep_manager')
  end
end
