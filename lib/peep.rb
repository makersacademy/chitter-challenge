require './lib/database_manager.rb'

class Peep
  attr_reader :user, :message
  def initialize(message, user)
    @message = message
    @user = user
  end

  def add_to_database
    db = DatabaseManager.new
    db.add_peep(self)
  end
end
