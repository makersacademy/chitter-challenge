require_relative 'database_connection'
require 'uri'
# require Date

class User

  def self.all_users
    sql = %{select * from users }
    users = DatabaseConnection.query(sql)
    users.map { |un| { id: un["id"],
      firstname: un["firstname"],
      lastname: un["lastname"],
      username: un["username"],
      password: un["password"],
      email: un["email"] }
    }
  end

  def self.all_usernames
    all_users.map { |usr| usr[:username] }
  end

  def self.create(firstname, lastname, username, password, email)

    return validate_signup(username, email).join("\n") unless validate_signup(username, email).empty?
    # if validate_signup(username, email).empty?
    sql = %{INSERT INTO users (firstname, lastname, username, password, email)
      VALUES ('#{firstname}', '#{lastname}', '#{username}', '#{password}',
      '#{email}') RETURNING id, firstname, lastname, username, password, email;}
    record = DatabaseConnection.query(sql)

    User.new({ id: record[0]['id'], firstname: record[0]['firstname'],
      lastname: record[0]['lastname'], username: record[0]['username'],
      password: record[0]['password'], email: record[0]['email'] })

  end

  def self.find(id)
    return nil unless id
    sql = %{select * from users where id = '#{id}'}
    record = DatabaseConnection.query(sql)
    User.new({ id: record[0]['id'],
      firstname: record[0]['firstname'],
      lastname: record[0]['lastname'],
      username: record[0]['username'],
      password: record[0]['password'],
      email: record[0]['email'] })
  end

  def self.find_from_username(username)
    # p "ids: "
    user = all_users.select { |usr| usr[:username] == username }
    # tagged.map { |tag| tag[:id]}
    User.new({ id: user[0][:id],
      firstname: user[0][:firstname],
      lastname: user[0][:lastname],
      username: user[0][:username],
      password: user[0][:password],
      email: user[0][:email] })
  end

  def self.login(username, password)
    sql = %{SELECT * FROM users WHERE username = '#{username}'
    AND password = '#{password}' ORDER BY id DESC LIMIT 1;}
    # p sql
    record = DatabaseConnection.query(sql)
    # p record

    return unless record.any?
    # p "this is a test"
    # return unless BCrypt::Password.new(result[0]['password']) == password
    User.new({ id: record[0]['id'],
      firstname: record[0]['firstname'],
      lastname: record[0]['lastname'],
      username: record[0]['username'],
      password: record[0]['password'],
      email: record[0]['email'] })
  end

  def self.validate_signup(username, email)
    validate = []
    validate << email_in_use(email) unless email_in_use(email).nil?
    # p validation
    # p "A-----"
    validate << valid_email?(email) unless valid_email?(email).nil?
    validate << username_in_use(username) unless username_in_use(username).nil?
    # validate << valid_email?(email)
    # p valid_email?(email)
    # p "B-----"
    return validate
    # p validation
  end

  attr_reader :id, :firstname, :lastname, :username, :password, :email

  private_class_method

  def self.email_in_use(email)
    sql = %{SELECT * FROM users WHERE email = '#{email}';}
    record = DatabaseConnection.query(sql)
    return "There is already an account with this email address" if record.any?
  end

  def self.username_in_use(username)
    sql = %{SELECT * FROM users WHERE username = '#{username}';}
    record = DatabaseConnection.query(sql)
    return "There is already an account with this username" if record.any?
  end

  def self.valid_email?(email)

# p email.match(URI::MailTo::EMAIL_REGEXP).nil?
    return "Please enter a valid email address" if email.match(URI::MailTo::EMAIL_REGEXP).nil?
  end

private

  def initialize(userdetails)
    @id = userdetails[:id]
    @firstname = userdetails[:firstname]
    @lastname = userdetails[:lastname]
    @username = userdetails[:username]
    @password = userdetails[:password]
    @email = userdetails[:email]
  end

end
