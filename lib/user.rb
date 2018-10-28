require 'pg'

class User
  attr_reader :name, :email, :username, :password

   def initialize(name, email, username, password)
    @name = name
    @email = email
    @username = username
    @password = password
  end

   def self.create(name, email, username, password)
     if ENV['ENVIRONMENT'] == 'test'
       connection = PG.connect(dbname: 'chitter_test')
     else
       connection = PG.connect(dbname: 'chitter')
     end
      result = connection.exec "SELECT * FROM users"
      result.map do |user|
        User.new(user['id'], user['name'], user['username'], user['email'], user['password'])
      end
  end
 end
