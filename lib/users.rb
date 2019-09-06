require 'pg'

class Users
  def self.create(name:,email:,password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      connection.exec("INSERT INTO users (username,email,password) VALUES ('#{name}','#{email}','#{password}');")
  end

  def self.exist(email:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT exists (SELECT email FROM users WHERE email = '#{email}');")
    result = result.getvalue(0,0)
    if result == 't'
      true
    else
      nil 
    end
  end
end
