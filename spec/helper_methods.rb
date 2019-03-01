def clean_test_database
  @conn = PG.connect(dbname: 'chitter_test')
  @conn.exec("TRUNCATE peeps;")
end
