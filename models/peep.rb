#  Peep class
require_relative 'database_connection'

class Peep

  attr_reader :content, :time

  def initialize(content, time)
    @content = content
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['content'], peep['time']) }
  end
end
