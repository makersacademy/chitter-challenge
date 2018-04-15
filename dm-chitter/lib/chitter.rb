require_relative 'database'

class Chitter

  extend Database

  attr_reader :database

  def self.connect
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
  end

  def self.create_user(user)
    add_to_users(user)
  end

  def self.add(chit)
    add_to_chits(chit)
  end

  def self.show_chits
    all_chits.map { |row | Chit.new(row['content'], row['time'])}.reverse
  end

  def self.show_users
    all_users.map { | row | User.new(nil, nil, nil, row['name'], row['username']) }
  end

  def self.login(username, password)
    login = Login.new(username, password)
    return false if login.correct_credentials? == false
  end

end


class Chit

  attr_reader :post, :time
  
  def initialize(post, time = Time.now.asctime)
    @post = post
    @time = time
  end

end

class User

  attr_reader :id,  :email, :password, :name, :username, :logged_in

  def initialize(id = nil, email = nil, password = nil, name = nil, username = nil)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
    @logged_in = true
  end

end

class Login

  include Database

  attr_reader :username, :password, :database

    def initialize (username, password)
      @username = username
      @password = password
      @database = Chitter.connect
    end

    def correct_credentials?
      return false if search_for_user(@username, @password) == nil
    end

end

