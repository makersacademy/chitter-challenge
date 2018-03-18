require_relative 'database_connection'
require 'uri'

class Peep
  attr_reader :time, :text

  def initialize(time, text)
    @time = time
    @text = text
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(peep['time'], peep['text']) }
  end

  def self.post_peep(text)
    DatabaseConnection.query("INSERT INTO peeps (time, text) VALUES('#{Time.now}', '#{text}')")
  end
end
