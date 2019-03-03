def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM peeps1 WHERE id = #{id};")
  
end
