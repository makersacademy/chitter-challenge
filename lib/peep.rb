require_relative './peeper.rb'

class Peep
@online = false

  def self.create_account()
  end

  def self.login(peeper: Peeper, email:, password: )
    @online = true
    peeper.new
  end

  def self.logout
    @online = false
  end

  def self.records
    set = []
  end
  #Peep instance
attr_reader :content, :user
  def initialize(content:, user:)
    raise "Not logged in" if online = false
    @content = content
    @time = Time.now
    @user = user
  end

end
