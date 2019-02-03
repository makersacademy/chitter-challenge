class User

  attr_reader :email, :password, :name

  def initialize(email:, password:, name:)
    @email = email
    @password = password
    @name = name
  end

  def self.create(email:, password:, name:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    result = connection.exec("INSERT INTO users (email, password, name) VALUES('#{email}','#{password}','#{name}') RETURNING email, password, name;")
    User.new(email: result[0]['email'], password: result[0]['password'], name: result[0]['name'])

  end

  def self.find

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec("SELECT email FROM users ORDER BY id DESC LIMIT 1")
    result.map { |item| item['email'] }

  end


end
