class User < ActiveRecord::Base
  validates_presence_of :username, :email, :encrypted_password

  include BCrypt

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  has_many :peeps, dependent: :destroy

end
