# def persisted_data(id:)
#   connection = PG.connect(dbname: 'chitter_test')
#   result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
# end

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
end
