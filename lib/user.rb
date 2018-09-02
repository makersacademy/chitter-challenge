class User

  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    result = connect.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password']) }
  end

  def self.create(email, password)
    result = connect.query("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end


private

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end
end
