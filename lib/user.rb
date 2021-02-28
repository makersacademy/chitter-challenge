require 'pg'
require_relative './Login'
class User
  attr_reader :id, :name, :password, :login
  def initialize(id, name, password)
    @id = id
    @name = name
    @password = password
    @login = nil
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    results = connection.exec("SELECT * FROM users;")
    results.map do |user|
      User.new(user['id'], user['name'], user['password'])
    end
  end

  def self.add_new(name, password)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    if name_exists(name) == true
      return "Name Taken. Please Try Another"
    else
      result = connection.exec("INSERT INTO users (name, password) VALUES ('#{name}', '#{password}') RETURNING id, name, password ;")
      User.new(result[0]['id'], result[0]['name'], result[0]['password'])
      return "Successfully Registered"
    end
  end

  def self.login(name, password)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    if name_exists(name) == true
      if check_password(name, password) == true
        login = Login.new(name)
        return login.name
      elsif check_password(name, password) == false
        return 'Incorrect Password Given'
      end
    else
      return 'Given Username does not exist'
    end
  end

  def self.logout
    @login = nil
  end

  private
  def self.name_exists(name)
    users = User.all
    existing_names = []
    users.map do |user|
      existing_names << user.name
    end
    return true if existing_names.include?(name)
    return false if !existing_names.include?(name)
  end

  def self.check_password(name, password)
    users = User.all
    login_attempt = nil
    users.map do |user|
      login_attempt = user.password if user.name == name
    end
    return true if login_attempt == password
    return false if login_attempt != password
  end


end
