class User

  attr_reader :id, :name, :username, :email, :password

  def self.create(name, username, email, password)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("INSERT INTO users (name, username, email, password)
      VALUES ('#{name}', '#{username}', '#{email}', '#{password}')
      RETURNING id, name, username, email, password;")
    @user = User.new(result[0]['id'], result[0]['name'], result[0]['username'],
      result[0]['email'], result[0]['password'])
  end

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

end
