require 'pg'
require './lib/databaseconnection'
require 'date'

class Peep
  attr_reader :text, :time
  def initialize(text, time)
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['text'], peep['time']) }
  end

  def self.add(new_peep)
    DatabaseConnection.query("INSERT INTO peeps (text, time) VALUES('#{new_peep}', '#{Time.now}')")
  end
#
#   def self.delete(id)
#     DatabaseConnection.query("DELETE FROM messages WHERE id = '#{id}'")
#   end
end
