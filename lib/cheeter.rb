require 'pg'
require 'uri'
require './lib/database_connection'


class Peep

  attr_reader :text, :time

  def initialize(text, time)
    @text = text
    @time = time

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM cheeter ORDER BY time DESC")
    result.map { |cheet| Peep.new(cheet['text'], cheet['time']) }
  end

  def self.add_peep(text)
    DatabaseConnection.query("INSERT INTO cheeter(text) VALUES('#{text}')")
  end


end
