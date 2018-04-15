require_relative './mapper.rb'

class User
  include Mapper

  attr_reader :first_name, :last_name, :username, :password, :email

  def initialize params
    @first_name = params['first_name']
    @last_name = params['last_name']
    @username = params['username']
    @password = params['password']
    @email = params['email']
  end

  def self.create params
    Mapper::new_user(self.new params)
  end

  def self.find id
    Mapper::find id
  end
end
