require 'bcrypt'
require_relative './mapper.rb'

class User
  include BCrypt
  include Mapper

  attr_reader :first_name, :last_name, :username, :password, :email, :id

  def initialize params
    @first_name = params['first_name']
    @last_name = params['last_name']
    @email = params['email']
    @password = create_password params
    @username = params['username']
    @id = params['id']
  end

  def self.create params
    return "error1" unless valid_email? params['email']
    return "error3" if find_by_email params['email']
    return "error2" if find_by_username params['username']
    return "error4" unless params['ui_password'] === params['ui_password1']
    Mapper::new_user(new params)
  end

  def create_password data
    data['password_hash'] ?
    Password.new(data['password_hash']) :
    Password.create(data['ui_password'])
  end

  def self.find_by_id id
    data = Mapper::find_by_id({ id: id, klass: :User })
    new(data[0])
  end

  def self.find_by_username username
    res = Mapper::find_by_username({ username: username, klass: :User })
    res.length > 0 ? new(res[0]) : nil
  end 

  def self.find_by_email email
    res = Mapper::find_by_email({ email: email, klass: :User })
    res.length > 0 ? new(res[0]) : nil
  end

  def self.valid_email? email
    !!email.match(/^[\w\d\-]{2,}@[\w\.]+$/)
  end
end
