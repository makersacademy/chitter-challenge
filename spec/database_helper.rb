def prep_test_db
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec "TRUNCATE peeps, users RESTART IDENTITY CASCADE;"
  connection.exec "INSERT INTO users (username,name,email,password)
  VALUES ('lozza_peeps','Lauren', 'lauren@blah.com', 'Password1');"
  connection.exec "INSERT INTO peeps (user_id,text,date_time)
  VALUES (1, 'Today is a great day! Ask me why...', '2019-06-01 13:00:00');"
end