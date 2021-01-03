require 'pg'

class User

  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    # query = con.exec "SELECT * FROM users"
    # query.map do |row|
    #   User.new(row['id'], row['username'], row['email'], row['password'])
    # end
  end

  def self.create(username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("INSERT INTO users(username, e_mail, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, e_mail, username, password;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

end
