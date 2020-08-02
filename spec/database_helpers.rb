require 'pg'
require 'user'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end

def create_user
  User.create(
      username: 'FirstAuthor',
      email: 'test@makers.com',
      password: 'password123'
    )
end
