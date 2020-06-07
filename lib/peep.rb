require 'time'

class Peep 
  def self.create(body)
    result = DatabaseConnection.query("INSERT INTO peeps (body, time_date_form) 
                                      VALUES ('#{body}', '#{Time.now.strftime("%F %T")}') 
                                      RETURNING id, body, time_date_form")
    Peep.new(result[0]['id'], result[0]['time_date_form'], result[0]['body'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}")
    Peep.new(result[0]['id'], result[0]['time_date_form'], result[0]['body'])
  end

  attr_reader :id, :body

  def initialize(id, time_date, body)
    @id = id
    @time_date = time_date
    @body = body
  end

  def time_date
    DateTime.strptime(@time_date, '%Y-%m-%d %H:%M:%S%z').strftime("%k:%M %-d %b %y")   
  end
end
