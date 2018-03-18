require 'bcrypt'

class Summoner
  attr_reader :user_id, :username, :email, :password

  def initialize(user_id, username, email, password)
    @user_id = user_id
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = DB_Connection.query('SELECT * FROM summoners ORDER BY user_id DESC')
    result.map { |summoner| Summoner.new(summoner['user_id'], summoner['username'], summoner['email'], summoner['password']) }
  end

  def self.create(username, email, password)
    encrypted_pw = BCrypt::Password.create(password)
    result = DB_Connection.query("INSERT INTO summoners (username, email, password) VALUES ('#{username}', '#{email}', '#{encrypted_pw}') RETURNING user_id, username, email, password;")
    Summoner.new(result[0]['user_id'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.find(user_id)
    return nil unless user_id
    @result = DB_Connection.query("SELECT * FROM summoners WHERE user_id = '#{user_id}'")
    @result.map { |summoner| Summoner.new(summoner['user_id'], summoner['username'], summoner['email'], summoner['password']) }.first
  end

end
