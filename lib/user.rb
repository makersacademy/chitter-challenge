require 'bcrypt'

class User
  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    connection = connect_to_correct_database
    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password']) }
  end

  def self.create(options)
    connection = connect_to_correct_database
    password = BCrypt::Password.create(options[:password])
    result = connection.exec("INSERT INTO users (email, password) VALUES('#{options[:email]}', '#{password}') RETURNING id, email, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    connection = connect_to_correct_database
    result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  private

  def self.connect_to_correct_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'faldo_movie_ratings_test')
    else
      PG.connect(dbname: 'faldo_movie_ratings')
    end
  end
end
