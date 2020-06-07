require 'time'

class Peep 
  def self.create(body)
    result = DatabaseConnection.query("INSERT INTO peeps (time_date, body) VALUES ('#{Time.new}', '#{body}') RETURNING id, time_date, body")
    Peep.new(result[0]['id'], result[0]['time_date'], result[0]['body'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}")
    Peep.new(result[0]['id'], result[0]['time_date'], result[0]['body'])
  end

  attr_reader :id, :time_date, :body

  def initialize(id, time_date, body)
    @id = id
    @time_date = time_date
    @body =  body
  end
end