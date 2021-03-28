require 'pg' # I think is redundent
require_relative './database_connection.rb'

class Peep
  
  attr_reader :id, :content, :name, :time

  def initialize(id:, content:, name:, time:)
    @id = id 
    @content = content
    @name = name
    @time = time
  end 
  
  def self.all
    data = DatabaseConnection.query("SELECT * FROM peeps ORDER BY posted_at DESC;")
    data.map { |peep| 
      Peep.new(id: peep['id'], content: peep['content'], 
                name: peep['name'], time: peep['posted_at']) 
    }  
  end

  def self.post(content:, name:)    
    data = DatabaseConnection.query("INSERT INTO peeps (content, name) 
      VALUES('#{content}', '#{name}') 
    RETURNING id, content, name, posted_at;")
    Peep.new(id: data[0]['id'], content: data[0]['content'], 
            name: data[0]['name'], time: data[0]['posted_at'])
  end

end 
