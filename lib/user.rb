class User < ActiveRecord::Base
  has_many :peeps

  def self.authenticate(email, password)
    User.where(email_address: email, password: password).first
  end
end