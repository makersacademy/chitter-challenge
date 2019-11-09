class User

  attr_reader :handle

  def initialize(name, email, handle, password)
    @name = name
    @email = email
    @handle = handle
    @password = password
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM users")
    result.map do |row|
      User.new(row['name'], row['email'], row['handle'], row['password'])
    end
  end

  def self.create(name, email, handle, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO users (name, email, handle, password) VALUES ('#{name}', '#{email}', '#{handle}', '#{password}') RETURNING name, email, handle, password;")
    User.new(result[0]['name'], result[0]['email'], result[0]['handle'], result[0]['password'])
  end

end
