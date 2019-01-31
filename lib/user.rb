require 'pg'

class User

  def self.connect_to_database
    ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_db_test' : db = 'chitter_db'
    @conn = PG.connect(dbname: db)
  end

  def self.all_users
    connect_to_database
    # Returns all peeps as a PG object
    query = @conn.exec ("SELECT * FROM users")
    # Iterates over PG and returns readable Peep object
    @users = query.map { |eachquery| User.new(eachquery['email'], eachquery['password'])}
  end


  def self.add(u_email, u_password)
    connect_to_database
    @conn.exec ("INSERT INTO users (email, password) VALUES('#{u_email}', '#{u_password}')")
  end

  attr_reader :email, :password
  def initialize(email, password)
    @email = email
    @password = password
  end

end
