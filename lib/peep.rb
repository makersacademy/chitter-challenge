require 'pg'

class Peep

  attr_reader :body, :time

  def initialize(body, time)
    @body = body
    @time = time
  end

  def self.view
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| self.new(peep["body"], peep["time"]) }
  end

  def self.reverse_view
    Peep.view.reverse
  end

  def self.create(body)
    time = Time.now.strftime("%k:%M")
    result = DatabaseConnection.query("INSERT INTO peeps (body, time) VALUES('#{body}', '#{time}')")
  end

end