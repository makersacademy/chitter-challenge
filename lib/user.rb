class User

  attr_reader :name, :email, :username

  def initialize(name, email, username)
    @name = name
    @email = email
    @username = username  
  end

  def self.register(name, email, username, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname:'chitter_db')
    end
    result = connection.exec("INSERT INTO users (name, email, username, password) 
                               VALUES ('#{name}', '#{email}', '#{username}', '#{password}')
                                RETURNING name, email, username;")
    User.new(result[0]['name'], result[0]['email'], result[0]['username'])
  end

end