# frozen_string_literal: true

require 'bcrypt'
require 'pg'

# creates users to allow peeps to be posted
class User
  class << self
    attr_reader :user_id, :username
  end

  def self.sign_in_check(email, password)
    result = sql_query('
      SELECT password
      FROM users
      WHERE email = $1;
    ', [email])
    BCrypt::Password.new(result[0]['password']) == password
  end

  def self.sign_in(email)
    result = sql_query('
      SELECT user_id, username
      FROM users
      WHERE email = $1;
    ', [email])
    @user_id = result[0]['user_id'].to_i
    @username = result[0]['username']
  end

  def self.email_check(email)
    result = sql_query('
      SELECT COUNT(email)
      FROM users
      WHERE email = $1;
    ', [email])
    result[0]['count'].to_i.zero?
  end

  def self.username_check(username)
    at_username = format_username(username)
    result = sql_query('
      SELECT COUNT(username)
      FROM users
      WHERE username = $1;
    ', [at_username])
    result[0]['count'].to_i.zero?
  end

  def self.password_check(password, repassword)
    password == repassword
  end

  def self.create(username, name, email, password)
    at_username = format_username(username)
    hashed_password = BCrypt::Password.create(password)
    sql_query('
      INSERT INTO users (username, name, email, password)
      VALUES($1, $2, $3, $4);
    ', [at_username, name, email, hashed_password])
  end

  def self.format_username(username)
    if username.start_with?('@')
      username
    else
      '@' + username
    end
  end

  def self.sign_out
    @user_id = 0
    @username = 'not signed in'
  end

  def self.sql_query(query, params = nil)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    connection.exec(query, params)
  end
end
