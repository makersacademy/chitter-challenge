def setup_test_database
  conn = PG.connect(dbname: 'peep_list_test')
  conn.exec('TRUNCATE peep_list')
end