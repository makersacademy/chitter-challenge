require 'pg'


def truncate_test_db
  connection=PG.connect(dbname: 'chitterdbtest')
  connection.exec("TRUNCATE chitter_table;")

end
