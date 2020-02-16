require 'pg'

class Peep

  attr_reader :content, :id, :timing

  def initialize(content:, id:, timing:)
    @content = content
    @id = id
    @timing = timing
  end
  
  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], timing: peep['timing'])
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}') RETURNING id, content, timing;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], timing: result[0]['timing'])
  end

end