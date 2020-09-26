require 'pg' 
require_relative 'database_connection'
require_relative 'database_connection_setup'

class Peep 

attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.create(text:)
     peep = DBconnect.query("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;")  
    Peep.new(id: peep[0]['id'], text: peep[0]['text'])
  end

  def self.all
    peep_list = DBconnect.query("SELECT * FROM peeps ORDER BY id DESC;")
    peep_list.map { |peep| Peep.new(id: peep['id'], text: peep['text']) }
  end

end