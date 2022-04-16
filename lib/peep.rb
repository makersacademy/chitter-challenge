require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :peep_id, :content, :posted

  def initialize(peep_id:, content:, posted: Time.now.strftime("%I:%M %p, %d/%m/%Y"))
    @peep_id = peep_id
    @content = content
    @posted = posted
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    array_of_peeps = result.map do |peep| 
      Peep.new(peep_id: peep['peep_id'], content: peep['content'], posted: peep['posted'])
    end
    array_of_peeps.reverse
  end

  def self.create(content:)
    posted = Time.now.strftime("%I:%M %p, %d/%m/%Y")
    result = DatabaseConnection.query("INSERT INTO peeps (content, posted) VALUES($1, $2) RETURNING peep_id, content, posted;", [content, posted])
    Peep.new(peep_id: result[0]['peep_id'], content: result[0]['content'], posted: result[0]['posted'])
  end
end
