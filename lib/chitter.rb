class Chitter < Sinatra::Base

  def self.set_rom(container)
    @container = container
  end

  def self.retrieve_rom
    @container
  end

  def self.set_user(user)
    @user = user
  end

  def self.get_user
    @user
  end

end
