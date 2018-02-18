
class Peep

  attr_reader :name, :text, :time

  def initialize(name, text, time)
    @name = name
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM cheeter")
     result.map { |cheet| Peep.new(cheet['name'], cheet['text'], cheet['time']) }
  end

  def self.add_peep(name, text)
    DatabaseConnection.query("INSERT INTO cheeter VALUES('#{name}', '#{text}')")
  end

end
