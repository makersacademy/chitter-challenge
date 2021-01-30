def self.create(peep:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'peep_manager_test')
  else
    connection = PG.connect(dbname: 'peep_manager')
  end

  connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
end