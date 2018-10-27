class User

  attr_reader :id, :name, :email, :username, :password

  def initialize(id:, name:, email:, username:, password:)
   @id = id
   @name = name
   @email = email
   @username = username
   @password = password
  end

  def self.all
    setup_connection
    result = @@connection.exec("SELECT * FROM users")
    result.map do |user|
      User.new(id: user['id'], name: user['name'], email: user['email'], username: user['username'], password: user['password'])
    end
  end

  def self.find
  end

  def self.create(name:, email:, username:, password:)
  end

  def self.setup_connection
    if ENV['ENVIRONMENT'] == 'test'
      @@connection = PG.connect(dbname: 'chitter_test')
    else
      @@connection = PG.connect(dbname: 'chitter')
    end
  end

end
