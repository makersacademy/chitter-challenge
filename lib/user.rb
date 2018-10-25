require 'pg'

class User

attr_reader :name, :username, :email, :password

  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name, username, email, password)
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter_manager'
    end
      rs = con.exec "SELECT * FROM users"
      rs.map do |user|
        User.new(user['id'], user['name'], user['username'], user['email'], user['password'])
      end
  end

end
