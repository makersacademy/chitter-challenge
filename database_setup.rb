require './lib/postgresql_manager'

if ENV['RACK_ENV'] == 'test'
  PostgresqlManager.setup('chitter_test')
else
  PostgresqlManager.setup('chitter')
end
