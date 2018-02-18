
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

  def self.sign_in(name)
    DatabaseConnection.query("INSERT INTO cheeter(name) VALUES('#{name}')")
  end

  def self.add_peep(text)
    DatabaseConnection.query("UPDATE cheeter SET text='#{text}'")
  end

end
