
class User
  include DataMapper::Resource

  attr_reader :password :user :peep


  def password=(new_password)
  @password = new_password
  self.password_assimilate = Password.create(new_password)
end

  def self.authenticate(email, password)
   user = first(email: email)
   user && Password.new(user.password_assimilate) == password ? user : nil
 end

  def peep('')
  end
