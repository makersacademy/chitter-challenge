require_relative './peeper.rb'

class Peep

  def self.create_account( name:, email:, password:, user: )
    Peeper.new(name: name, email: email, password: password, user: user)
  end
#Implement some kind of session hash variable in the front end for online: to use
  def self.login(peeper: Peeper, email:, password:, online:)
    online = true
    peeper.new
  end

  def self.logout(online: )
    online = false
  end

  def self.records
    set = []
  end
  #Peep instance
attr_reader :content, :user
  def initialize(content:, user:)
    @content = content
    @time = Time.now
    @user = user
  end

end
