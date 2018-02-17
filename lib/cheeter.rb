
class Peep

  attr_reader :name, :text, :time

  def initialize(name, text)
    @name = name
    @text = text
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM cheeter")
    result.map { |cheet| Peep.new(cheet['name'], cheet['text']) }
  end

end
