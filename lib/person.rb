class Person

  attr_reader :id, :user_name, :real_name, :email, :password, :peeps

  def initialize(id, user_name, real_name, email, password)
    @id = id
    @user_name = user_name
    @real_name = real_name
    @email = email
    @password = password
    @peeps = []
  end

  def add(peep)
      @peeps << peep
  end
end
