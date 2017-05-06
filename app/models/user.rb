class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String

  def self.generate(params)
    @user = User.create(params)
  end

  def self.instance
    @user
  end

end
