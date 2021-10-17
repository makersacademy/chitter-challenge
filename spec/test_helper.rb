def add_test_peeps
  connection = PG.connect(dbname: "chitter_test")
  connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 1', current_timestamp, 1)")
  connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 2', current_timestamp, 1)")
  connection.exec_params("INSERT INTO peeps (content, posttime, author_id) VALUES ('Test peep 3', current_timestamp, 1)")
end
