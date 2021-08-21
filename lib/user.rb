require 'pg'

class User

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.create(name, handle, password, email)
    connect_to_db
    query = "INSERT INTO users (name, handle, password, email)"\
            "VALUES ('#{name}', '#{handle}', '#{password}', '#{email}') RETURNING name;"
    result = @connection.exec(query)
    @user = User.new(result[0]['name'])
  end

  def self.instance
    @user
  end
  
  def self.connect_to_db
    if ENV['RACK_ENV'] == 'test' 
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
