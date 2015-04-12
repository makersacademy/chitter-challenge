require 'bcrypt'
require 'dm-validations'
class User

  class Link
    include DataMapper::Resource

    storage_names[:default] = 'people_links'
    belongs_to :follower, 'User', key: true
    belongs_to :followed, 'User', key: true
  end

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, format: :email_address
  property :username, String, unique: true
  property :password_digest, BCryptHash
  has n, :cheeps, through: Resource
  has n, :applause
  has n, :cheeps, through: :applause

  has n, :links_to_followed_people, 'User::Link', child_key: [:follower_id]
  has n, :links_to_followers, 'User::Link', child_key: [:followed_id]

  has n, :followed_people, self,
      through: :links_to_followed_people,
      via: :followed

  has n, :followers, self,
      through: :links_to_followers,
      via: :follower

  validates_confirmation_of :password,
                            message: "Those passwords don't match"
  validates_length_of :password_confirmation, min: 6

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = self.first(username: username)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

  def follow(others)
    followed_people.concat(Array(others))
    save!
    self
  end
end
