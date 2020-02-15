require 'pg'
require_relative 'database_connection'

class Peep  
  attr_reader :id, :content, :time, :author_id

  def initialize(id:, content:, time:, author_id:)
    @id  = id
    @content = content
    @time = time
    @author_id = author_id
  end
    
  def self.all    
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'], 
        content: peep['content'], 
        time: peep['time'],
        author_id: peep['author_id']
        )
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}') RETURNING id, content, time, author_id;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'], author_id: result[0]['author_id'])
  end
end