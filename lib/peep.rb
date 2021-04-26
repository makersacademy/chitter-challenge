require 'pg'

class Peep
  attr_reader :id, :peep, :time_date

  def initialize(id:, peep:, time_date:)
    @id = id
    @peep = peep
    @time_date = time_date
  end 

  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time_date: result[0]['created_at'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |post|
      Peep.new(id: post['id'], peep: post['peep'], time_date: post['created_at'])
    end 
  end

  def time
    time = Time.parse(@time_date.to_s)
    time.strftime("%Y-%m-%d %I:%M %p")
  end
end
