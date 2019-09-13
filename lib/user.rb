require_relative 'database_connection'

class User

  attr_reader :user_id, :name, :email, :password, :handle

  def initialize(user_id:, name:, email:, password:, handle:)
    @user_id = user_id
    @name = name
    @email = email
    @password = password # need to make private at some point
    @handle = handle
  end

  def self.create(name:, email:, password:, handle:)
    # need a fail clause if handle/email already exists here
    result = Database.query("INSERT INTO users (name, email, password, handle) VALUES ('#{name}', '#{email}', '#{password}', '#{handle}');")
  end

  def login
    # define some sort of login behaviour
  end

end