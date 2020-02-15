require 'pg'
require_relative 'database_connection'

class Peep  
  attr_reader :id, :content, :time_created, :author_id

  def initialize(id:, content:, time_created:, author_id:)
    @id  = id
    @content = content
    @time_created = time_created
    @author_id = author_id
  end
    
  def self.all    
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'], 
        content: peep['content'], 
        time_created: peep['time_created'],
        author_id: peep['author_id']
        )
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}') RETURNING id, content, time_created, author_id;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], time_created: result[0]['time_created'], author_id: result[0]['author_id'])
  end
end