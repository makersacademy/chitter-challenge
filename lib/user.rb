class User

  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.create(email:, password:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}','#{password}') RETURNING email, password;")
    User.new(email: result[0]['email'], password: result[0]['password'])

  end

  def self.find

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec("SELECT email FROM users")
    result.map { |item| item['email'] }

  end

end
