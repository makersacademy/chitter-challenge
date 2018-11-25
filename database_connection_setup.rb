require './lib/database_connection'

def database_setup
  if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
  else
      connection = PG.connect(dbname: 'chitter')
  end
end
