require 'pg'

task :test_database_setup do
  DatabaseConnection.setup('peep_manager_test')
  DatabaseConnection.query(
    'TRUNCATE peeps, users RESTART IDENTITY;'
  )
end
