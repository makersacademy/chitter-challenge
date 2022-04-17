require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :posted

  def initialize(id:, content:, posted: Time.now.strftime("%I:%M %p, %d/%m/%Y"))
    @id = id
    @content = content
    @posted = posted
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    array_of_peeps = result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], posted: peep['posted'])
    end
    array_of_peeps.reverse
  end

  def self.create(content:)
    posted = Time.now.strftime("%I:%M %p, %d/%m/%Y")
    result = DatabaseConnection.query("INSERT INTO peeps (content, posted) VALUES($1, $2) RETURNING id, content, posted;", [content, posted])
    Peep.new(id: result[0]['id'], content: result[0]['content'], posted: result[0]['posted'])
  end
end
