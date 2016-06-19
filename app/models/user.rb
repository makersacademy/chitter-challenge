require "bcrypt"

class User
  include DataMapper::Resource

  property(:id, Serial)
  property(
    :username, String, required: true, unique: true, format: /[a-zA-Z0-9_]{5,20}/,
    messages: {
      format: "Invalid username: must consist of underscores, letters or "\
              "numbers and be between 5 and 20 characters long"
    }
  )
  property(:name, String, required: true)
  property(:email, String, format: :email_address, required: true, unique: true)
  property(:password_encrypted, String, length: 60)

  validates_confirmation_of(:password, confirm: :password_confirm)

  has(n, :peeps)

  attr_writer :password_confirm

  def password=(password)
    @password = password
    self.password_encrypted = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = self.first(username: username)
    user if user && (BCrypt::Password.new(user.password_encrypted) == password)
  end

  private

  attr_reader :password, :password_confirm
end
