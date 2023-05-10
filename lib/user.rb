class User < ActiveRecord::Base
  has_many :peeps

  def self.sign_in(email, password)
    User.where(email_address: email, password: password).first
  end
end