class User
  attr_reader :id, :email, :password, :name, :username

  def self.all
    select_all.map do |user|
      User.new(
        id: user['id'], email: user['email'], password: user['password'],
        name: user['name'], username: user['username']
      )
    end
  end

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.select_all
    DatabaseManager.query('SELECT * FROM users')
  end
end
