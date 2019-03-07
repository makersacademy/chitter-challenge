class User < ActiveRecord::Base

  validates :email, :uniqueness => { :message => "This email already exists" }
  validates :username, presence: true, :uniqueness =>
                                        { :message => "That username exists" }
  validates :password, presence: true
  has_many :messages

  def self.authenticate(username, password)
    user = find_by(username: username)
    return nil unless user

    if user.password == password
      user
    else
      nil
    end
  end

end
