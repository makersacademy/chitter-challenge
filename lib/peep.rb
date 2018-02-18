require 'pg'
require './lib/databaseconnection'
require 'date'

class Peep
  attr_reader :id, :text, :time
  def initialize
    @id = id
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['id'], peep['text'], peep['time']) }
  end

  def self.add(new_peep, id)
    DatabaseConnection.query("INSERT INTO peeps (id, text, time) VALUES('#{id}, #{new_peep}', '#{Time.new.strftime('%d/%m/%Y %H:%M')}')")
  end
#
#   def self.delete(id)
#     DatabaseConnection.query("DELETE FROM messages WHERE id = '#{id}'")
#   end
end
