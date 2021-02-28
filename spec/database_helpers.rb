def persisted_user_data(id:)
  result = DBConnection.query("SELECT * FROM users WHERE ID = #{id};")
  result.first
end
def persisted_peep_data(id:)
  result = DBConnection.query("SELECT * FROM peeps WHERE ID = #{id};")
  result.first
end
