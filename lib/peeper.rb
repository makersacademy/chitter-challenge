require_relative './peep.rb'

class Peeper
private
    attr_reader :email, :user, :password, :name
public

  def initialize(name:, email:, password:, user:, peep: Peep)
    @name = name
    @user = user
    @password = password
    @user = user
    @peep = peep
  end

  def peep(message)
    if @peep == Peep
      Peep.set << @peep.new(content: message, user: @user)
    else
      message
    end
  end
end
