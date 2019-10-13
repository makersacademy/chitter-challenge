require_relative 'connect_database'

class Users

  attr_reader :username, :password, :id, :picture, :gender, :age

  def initialize(
    id:,
    username:,
    password:,
    age:,
    gender:,
    picture:)

    @id = id.to_i
    @username = username
    @password = password
    @age = age.to_i
    @gender = gender
    @picture = picture
  end

  def self.start_connection(connect_database_class = ConnectDatabase)
    @connection = connect_database_class.start('user')
  end

  def self.add(
    username:,
    password:,
    age:,
    gender:)

    sql = "INSERT INTO users (username,password,age,gender,picture) VALUES(
    '#{username}',
    '#{password}',
    '#{age.to_i}',
    '#{gender}',
    '#{picture_chooser}')
    RETURNING username,password,age,gender,picture;"
    result = @connection.query(sql)

    Users.new(
    id: result[0]['id'],
    username: result[0]['username'],
    password: result[0]['password'],
    age: result[0]['age'],
    gender: result[0]['gender'],
    picture: result[0]['picture'])
  end

  def self.access_account (username,password)
    begin
      sql = "SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}';"
      result = @connection.query(sql)[0]
    rescue
      return false
    else
      Users.new(
      id: result['id'],
      username: result['username'],
      password: result['password'],
      age: result['age'],
      gender: result['gender'],
      picture: result['picture'])
    end
  end

  def self.get_user(id)
      sql = "SELECT * FROM users WHERE id = '#{id}';"
      result = @connection.query(sql)[0]
      Users.new(
      id:result['id'],
      username:result['username'],
      password:result['password'],
      age:result['age'],
      gender:result['gender'],
      picture:result['picture'])
  end

  def self.update_photo(id)
    new_pic = picture_chooser
    sql =
    "UPDATE users
    SET picture = '#{new_pic}'
    WHERE id = #{id};"
    @connection.query(sql)
  end

  def self.get_photo(id)
    sql = "SELECT picture FROM users WHERE id = '#{id}';"
    result = @connection.query(sql)[0]['picture']
  end

  private

  def self.picture_chooser
    rand = Kernel.rand(1..5)
    case rand
    when 1
      "https://i.imgur.com/dzOMZgw.jpg"
    when 2
      "https://i.imgur.com/4qu3B0Y.jpg"
    when 3
      "https://i.imgur.com/4AiXzf8.jpg"
    when 4
      "https://i.imgur.com/gPJ7jYb.jpg"
    when 5
      "https://i.imgur.com/GrErmzk.jpg"
    end
  end

end
