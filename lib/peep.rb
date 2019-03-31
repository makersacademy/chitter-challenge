require_relative 'database_connection'

class Peep

  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES ('#{content}', '#{Time.now}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], content: result[0]['peep'], time: result[0]['time'])
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['peep'],
        time: Time.now
      )
    end
  end

  def self.reverse_order
    peeps = Peep.all
    peeps.reverse { |peep| peep.time }
  end
  
end
