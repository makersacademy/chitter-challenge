def persisted_user_data(id:)
  result = DBConnection.query("SELECT * FROM users WHERE ID = #{id};")
  result.first
end
