def set_db
  ENV["ENVIRONMENMT"] == "test" ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
end
