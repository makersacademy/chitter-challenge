require 'pg'
require 'database_connection'

class Peeps
  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        content: peep['content']
      )
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) 
      VALUES('#{content}') 
      RETURNING id, content")
      
    Peeps.new(id: result[0]['id'], content: result[0]['content'])
  end
end
