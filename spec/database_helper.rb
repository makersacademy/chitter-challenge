def prep_test_db
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec "TRUNCATE peeps, users RESTART IDENTITY CASCADE;"
  connection.exec "INSERT INTO peeps (username,name,text,date_time)
  VALUES ('lozza_peeps','Lauren', 'Today is a great day! Ask me why...', '2019-06-01 13:00:00');"
end