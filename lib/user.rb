require 'pg'

class User

  attr_reader :name,
              :handle,
              :password,
              :email

  def initialize(name, handle, password, email)
    @name = name
    @handle = handle
    @password = password
    @email = email
  end

  def self.create(name, handle, password, email)
    connect_to_db
    query = "INSERT INTO users (name, handle, password, email)"\
            "VALUES ('#{name}', '#{handle}', '#{password}', '#{email}')"\
            "RETURNING name, handle, password, email;"
    result = @connection.exec(query)
    data = ['name', 'handle', 'password', 'email'].map { |item| result[0][item] }
    @user = User.new(*data)
    #@user = User.new(result[0]['name'], result[0]['handle'], result[0]['password'], result[0])
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
