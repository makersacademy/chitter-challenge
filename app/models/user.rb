class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String,
            unique: true,
            required: true,
            format: :email_address
  property :password, BCryptHash
  property :name, String
  property :username, String,
            required: true,
            unique:   true

  has n, :peeps, through: Resource

  attr_accessor :password_confirmation

  validates_uniqueness_of    :email, :username
  validates_format_of         email: :email_address
  validates_confirmation_of  :password


  def self.validate(email, password)
    if user = User.first(email: email)
      BCrypt::Password.new(user.password) == password ? user : nil
    end
  end
end