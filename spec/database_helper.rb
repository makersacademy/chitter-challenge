require 'pg'

def reset_test_database
  connection = PG.connect dbname: 'chitter_test'

  connection.exec("TRUNCATE peeps;")

  connection.exec "INSERT INTO peeps(username, content)
                   VALUES ('hulbgoblin', 'May Day is approaching');"

  connection.exec "INSERT INTO peeps(username, content)
                   VALUES ('alittlecross','What?!');"

  connection.exec "INSERT INTO peeps(username, content)
                   VALUES('danusia.x', 'Hello Chitter!');"

end

def persisted_data(id:)
  connection = PG.connect dbname: 'chitter_test'
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
