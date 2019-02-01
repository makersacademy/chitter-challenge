if ENV['ENVIRONMENT'] == 'test'
  PG.connect( dbname: 'peep_manager_test' )
else
  PG.connect( dbname: 'peep_manager' )
end
