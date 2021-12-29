require 'pg'
require_relative '../lib/user.rb'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  return result.first
end

def add_user_to_DB()
  User.add_user(email:'johnsmith@example.com', username:'Johnny S', full_name:'John Smith', password:'password123')
end