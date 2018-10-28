class CheckUsers
  @conn = nil

  def self.all
    find_db
    @conn.exec("SELECT * FROM users").map do |user|
      User.new(name: user['name'], username: user['username'], email: user['email'], password: user['password'])
    end
  end

  def self.exists?(username, email)
    find_db
    @conn.exec("SELECT * FROM users WHERE(username = '#{username}') OR (email = '#{email}');").map do |user|
      return true
    end
    false
  end

  def self.login(email, password)
    find_db
    @conn.exec("SELECT * FROM users WHERE(email = '#{email}') AND (password = '#{password}');").map do |user|
      return user['username']
    end
    false
  end

  def self.find_db
    if ENV['RACK_ENV'] == 'test'
      @conn = PG.connect(dbname: 'chitter_test')
    else
      @conn = PG.connect(dbname: 'chitter')
    end
  end

  end
