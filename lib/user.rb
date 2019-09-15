require 'pg'
require 'sinatra/security'

class User
  include Sinatra::Security

  def self.signup(username:, email:, password:)
    conn = connect
    password_hash = Password::Hashing.encrypt(password)
    
    begin
      conn.exec(
        'INSERT INTO users (username, password_hash, email)
        VALUES ($1, $2, $3)',
        [username, password_hash, email]
      )
      return true
    rescue PG::UniqueViolation
      return false
    end
  end

  def self.login(username:, password:)
    conn = connect
    result = conn.exec(
      "SELECT password_hash from users WHERE username = $1",
      [username]
    ).first
    return false if result == nil

    password_hash = result['password_hash']
    Password::Hashing.check(password, password_hash)
  end

  private_class_method def self.connect
    return PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'

    PG.connect(dbname: 'chitter')
  end
end