# frozen_string_literal: true

class HashedPassword
  attr_accessor :id
  attr_writer :password, :user_id

  def initialize(user_id,password)
    @user_id = user_id
    @password = password
  end
  # TODO Initializes the Hash password class and returns an instance to be used to either create and check a hashed password
  def create
    hashed_password = BCrypt::Password.create(@password)
    # TODO Store hashed password
    return nil
  end


  # TODO checks a hashed password against the database one never storing a password in local
  def check(id)

  end
  # TODO retrieve the password from the database

  private

  def retrieve()

  end

end
