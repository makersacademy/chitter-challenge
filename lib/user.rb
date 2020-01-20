class User

  attr_reader :id, :username, :realname, :lastname

  def initialize(id:, username:, realname:, lastname:)
    @id = id
    @username = username
    @realname = realname
    @lastname = lastname
  end

  def self.create(username:, realname:, lastname:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (username, realname, lastname) VALUES('#{username}', '#{realname}', '#{lastname}' ) RETURNING id, username, realname, lastname;")
    result.map { |row|
        @user = User.new(id: row['id'], username: row['username'], realname: row['realname'], lastname: row['lastname'])
        }
  end

  def self.instance
    @user
  end

  def self.find(username:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
    else
        connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    result.map { |row|
        @user = User.new(id: row['id'], username: row['username'], realname: row['realname'], lastname: row['lastname'])
        }
  end
end