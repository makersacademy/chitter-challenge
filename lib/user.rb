require_relative 'database_connection'
# require Date

class User

  # def self.all
  #   # if ENV['ENVIRONMENT'] == 'test'
  #   #   connection = PG.connect(dbname: 'chitter_test')
  #   # else
  #   #   connection = PG.connect(dbname: 'chitter')
  #   # end
  #
  #   sql = %{select * from users}
  #     # p sql
  #   peeps = DatabaseConnection.query(sql)
  #   peeps.map {|record| {id: record["id"],
  #     firstname: record["firstname"],
  #     lastname: record["lastname"],
  #     username: record["username"],
  #     password: record["password"],
  #     email: record["email"]} }
  # end

  def self.create(firstname, lastname, username, password, email)
    sql = %{INSERT INTO users (firstname, lastname, username, password, email)
      VALUES ('#{firstname}', '#{lastname}', '#{username}', '#{password}',
      '#{email}') RETURNING id, firstname, lastname, username, password, email;}
    record = DatabaseConnection.query(sql)
    User.new({ id: record[0]['id'],
      firstname: record[0]['firstname'],
      lastname: record[0]['lastname'],
      username: record[0]['username'],
      password: record[0]['password'],
      email: record[0]['email'] })
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

  def self.login(username, password)
    sql = %{SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}' ORDER BY id DESC LIMIT 1;}
    # p sql
    record = DatabaseConnection.query(sql)
    # p sql
    # p record
    # p record.any?.to_s
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

  attr_reader :id, :firstname, :lastname, :username, :password, :email

  def initialize(userdetails)
    @id = userdetails[:id]
    @firstname = userdetails[:firstname]
    @lastname = userdetails[:lastname]
    @username = userdetails[:username]
    @password = userdetails[:password]
    @email = userdetails[:email]
  end

end
