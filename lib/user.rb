require 'bcrypt'

class User
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

def self.create(email:, password:)

  encrypted_password = BCrypt::Password.create(password)

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end

  result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
  User.new(id: result[0]['id'], email: result[0]['email'])
end
end

# def self.find(id)
#
#   return nil unless id
#
#   if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'chitter_test')
#   else
#     connection = PG.connect(dbname: 'chitter')
#   end
#
#
#   result = connection.query("SELECT * FROM users WHERE id = '#{id}'")
#   User.new(result[0]['id'], result[0]['email'])
# end
#
# end
