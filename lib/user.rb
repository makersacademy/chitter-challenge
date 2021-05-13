require 'pg'
require_relative './exceptions.rb'
require_relative 'query'

class User

  attr_reader :name, :username, :id

  def initialize(name, username, id)
    @name = name
    @username = username
    @id = id
  end

  @current = User.new('Anonymous', 'anon', 0)

  def self.set_current(name, username, id)
    @current = User.new(name, username, id)
  end

  def self.sign_in(username, password)
    name, id = correct_password(username, password).values    
    set_current(name, username, id)
  end

  def self.log_out
    @current = User.new('Anonymous', 'anon', 0)
  end

  class << self
    attr_reader :current
  end

  def self.add(name:, username:, email:, password:, picture: 'https://www.iconbolt.com/iconsets/streamline-emoji/speaking-head.svg')
    raise AlreadyRegisteredError if registered?(username, email)
    
    id = Query.run("INSERT INTO users (name, username, email, password, picture) VALUES('#{name}','#{username}','#{email}','#{password}','#{picture}') RETURNING id;").first[:id]
    set_current(name, username, id)
  end

  def self.registered?(username, email)
    Query.run("SELECT * FROM  users WHERE username = '#{username}' AND email = '#{email}';") != []
  end

  def self.correct_password(username, password)
    results = Query.run("SELECT name, id FROM users WHERE username = '#{username}' AND password = '#{password}';").first
    raise LogInError if results.nil?

    results
  end

end
