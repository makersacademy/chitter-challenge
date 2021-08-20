class User

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.create(name)
    @user = User.new(name)
  end

  def self.instance
    @user
  end

end