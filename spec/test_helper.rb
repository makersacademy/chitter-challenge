def add_test_peeps
  time = Time.now
  connection = PG.connect(dbname: "chitter_test")
  connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 1', '#{time}', 1)")
  connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 2', '#{time}', 1)")
  connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 3', '#{time}', 1)")
end
