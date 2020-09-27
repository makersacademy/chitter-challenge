
def clear_table(database = "peep_manager_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE users")
end