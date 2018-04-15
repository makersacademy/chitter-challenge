require 'bcrypt'
require_relative './mapper.rb'

class User
  include BCrypt
  include Mapper

  attr_reader :first_name, :last_name, :username, :password, :email

  def initialize params
    @first_name = params['first_name']
    @last_name = params['last_name']
    @email = params['email']
    @password = create_password params
    @username = params['username']
  end

  def self.create params
    Mapper::new_user(self.new params)
  end

  def create_password data
    data['password_hash'] ? Password.new(data['password_hash']) : Password.create(data['ui_password'])
  end

  def self.find_by_id id
    data = Mapper::find_by_id({id: id, klass: :User})
    new(data[0])
  end
end
