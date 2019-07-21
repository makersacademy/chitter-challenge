require 'pg'

def persisted_data(table:, id:)
  if ENV["ENVIRONMENT"] == "test"
    connection = PG.connect(dbname: "peeps_manager_test")
  else
    connection = PG.connect(dbname: "peeps_manager")
  end
  result = connection.exec("SELECT * FROM #{table} WHERE id = '#{id}';")
end
