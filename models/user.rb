class User < ActiveRecord::Base

  validates :email, :uniqueness => { :message => "This email already exists" }

  has_many :messages

end
