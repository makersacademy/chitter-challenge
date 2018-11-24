require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

def self.password_check(email:, password:)
  connection = PG.connect(dbname: 'chitter')
  result = connection.exec("SELECT * FROM users WHERE email ='#{email}'")
  return unless result.any?
  return unless BCrypt::Password.new(result[0]['password']) == password
  User.new(id: result[0]['id'], email: result[0]['email'])
end

def self.find(id:)
  return nil unless id
  connection = PG.connect(dbname: 'chitter')
  result = connection.exec("SELECT * FROM users WHERE id = #{id};")
  User.new(id: result[0]['id'], email: result[0]['email'])
end

def self.insert_peeps(peeps:)
  connection = PG.connect(dbname: 'chitter')
  connection.exec("INSERT INTO peeps (text) VALUES('#{peeps}');")
end

end
