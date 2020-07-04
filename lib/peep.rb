require './lib/database_manager.rb'

class Peep
  attr_reader :message, :name
  def initialize(message, name)
    @message = message
    @name = name
  end

  def add_to_database
    @db = DatabaseManager.new
    @db.add_peep(self)
  end

end
