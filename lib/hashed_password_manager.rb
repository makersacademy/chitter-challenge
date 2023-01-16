# frozen_string_literal: true

class HashedPasswordManager
  attr_accessor :id, :user_id
  attr_writer :password # TODO Delete this later
  attr_reader :hash

  def initialize(user_id, password)
    @user_id = user_id
    @password = password
  end

  def create
    @hash = BCrypt::Password.create(@password)
    # TODO Store hashed password
    return nil
  end

  def check(id)
    @id = id
    # TODO checks a hashed password against the database one never storing a password in local
    # TODO retrieve the password from the database and test
    BCrypt::Password.create(@password)
    return
  end

end
