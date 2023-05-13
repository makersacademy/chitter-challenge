require 'sinatra/activerecord'
require 'bcrypt'

class User < ActiveRecord::Base
  # need to change password to password_hash in db for this to work
  
  include BCrypt
  has_many :peeps

  validates :name, :email_address, presence: true
  validates :name, :email_address, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

end
