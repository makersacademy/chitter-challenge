class User
  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    res = con.exec "SELECT * FROM users"
    res.map { |user| User.new(user['id'], user['email'], user['password']) }
  end

  def self.create(options)
    res = con.exec "INSERT INTO users (email, password) values('#{options[:email]}', '#{options[:password]}') RETURNING id, email, password;"
    User.new(res[0]['id'], res[0]['email'], res[0]['password'])
  end

  def self.find(id)
    return nil unless id
    res = con.exec "SELECT * FROM users WHERE id = '#{id}'"
    User.new(res[0]['id'], res[0]['email'], res[0]['password'])
  end

  private

  def self.con
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_manager_test'
    else
      con = PG.connect :dbname => 'chitter_manager'
    end
  end
end
