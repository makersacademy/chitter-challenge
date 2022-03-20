require 'pg'
require 'time'

class Peep

  attr_reader :text, :time

  def initialize(text, time = "unsure time")
    @text = text
    @time = Time.at(time.to_i).strftime("%k:%M-%d/%m") 
  end

  def self.add(text)
    time = Time.now.to_i
    DatabaseConnection.query("INSERT INTO chitters (text, time) VALUES ($1,$2)",[text,time])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitters")
    result.map { |peep| Peep.new(peep['text'],peep['time']) }
  end

end