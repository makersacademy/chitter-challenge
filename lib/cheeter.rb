
class Peep

  attr_reader :name, :text, :time

  def initialize(text, time)
    @text = text
    @time = time
    @name = name
  end

  def self.sign_in(name)
    DatabaseConnection.query("INSERT INTO cheeter(name) VALUES('#{name}')")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM cheeter ORDER BY time DESC")
     result.map { |cheet| Peep.new(cheet['text'], cheet['time']) }
  end

  def self.add_peep(text)
    DatabaseConnection.query("INSERT INTO cheeter(text) VALUES('#{text}')")
  end


end
