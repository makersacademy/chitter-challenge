require 'pg'

class User

  def self.sign_up(first_name:, last_name:, email:, password:, username:)
    con = connect_to_database
    con.exec("INSERT INTO users (first_name, last_name, email, password, username)
      VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}', '#{username}')")
    current_user(first_name, username)
  end

  def self.first_name
    @name
  end

  def self.username
    @username
  end

  private

  def self.current_user(first_name, username)
    @name = first_name
    @username = username
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
