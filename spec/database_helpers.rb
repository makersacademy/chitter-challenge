require 'pg'

def truncates
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE users, peeps')
end

def add_test_users
  connection = PG.connect(dbname: 'chitter_test')
  
  Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')
  persisted_data = persisted_data(table: :users, id: user.id)

  Users.create(name: "a", email: 'a@email.com', password: 'a456', username: 'a_user')

  Users.create(name: "b", email: 'b@gmail.com', password: 'b282130972##', username: 'b-user')

end

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end
