# verification class
class Verification

  @connection = PG.connect(dbname: 'chittertest', password: 'qweasd')

  def self.valid_password?(password)
    !/\d\w/.match(password).nil? && password.length > 8 
  end

  def self.valid_email?(email)
    !/@\D/.match(email).nil? && !/\.\D/.match(email).nil?
  end

  def self.username_exists?(username)
    !@connection.exec("SELECT username FROM users WHERE username LIKE '#{username}';").map { |res| res }.empty?
  end

  def self.password_match?(username, password)
    result = @connection.exec("SELECT username, password FROM users WHERE username LIKE '#{username}';")
    password == result.map { |res| res['password'] }.join
  end

  def self.valid_message?(message)
    message.length < 500
  end

end
