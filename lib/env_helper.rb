def env_setup
  if ENV['RACK_ENV'] == 'test'
    @connection = PG.connect(dbname: 'Chitter_test')
  else
    @connection = PG.connect(dbname: 'Chitter')
  end
end
