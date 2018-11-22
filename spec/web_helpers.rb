def db_connection
  connection = 'chitter'
  connection = 'chitter_spec' if ENV['ENVIRONMENT'] == 'test'
end
