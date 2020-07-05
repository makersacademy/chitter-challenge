require './lib/database_manager.rb'

class Peep
  attr_reader :message, :name, :timestamp
  def initialize(message, name)
    @message = message
    @name = name
    @timestamp = Time.now.strftime("%d/%m/%Y %H:%M:%S")
  end

  def add_to_database
    @db = DatabaseManager.new
    @db.add_peep(self)
  end

end
