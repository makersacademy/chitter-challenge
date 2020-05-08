require 'pg'

class MakerProfile

  attr_reader :username, :name, :email, :password, :id

  def initialize(username:, name:, email:, password:, id:)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

 def self.all
   if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'chitter_test')
   else
     connection = PG.connect(dbname: 'chitter')
   end
    result = connection.exec("SELECT * FROM profile ORDER BY id DESC LIMIT 1;")
    p result
   result.map do |info|
      MakerProfile.new(username: info['username'], name: info['name'], email: info['email'], password: info['password'], id: info['id'])
    end
  end

  def self.signup(username:, name:, email:, password:)
   if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'chitter_test')
   else
     connection = PG.connect(dbname: 'chitter')
   end
   result = connection.exec("INSERT INTO profile (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{password}') RETURNING username, name, email, password, id;")
   MakerProfile.new(username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'], id: result[0]['id'])
  end




 # def self.login(username:, password:)
 #   if ENV['ENVIRONMENT'] == "test"
 #     connection = PG.connect(dbname: 'chitter_test')
 #   else
 #     connection = PG.connect(dbname: 'chitter')
 #   end
 #   result = connection.exec("SELECT * FROM profile WHERE username = '#{username}' AND password = '#{password}';")
 #  end
end
