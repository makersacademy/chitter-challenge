require 'pg' 
require_relative 'database_connection'
require_relative 'database_connection_setup'

class Peep 

attr_reader :id, :text, :date

  def initialize(id:, text:, date:)
    @id = id
    @text = text
    @date = date
  end

  def self.create(text:)
    peep = DBconnect.query("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text, date;")  
    Peep.new(id: peep[0]['id'], text: peep[0]['text'], date: peep[0]['date'])
  end

  def self.all
    peep_list = DBconnect.query("SELECT id, text, to_char(date, 'DD Mon HH24:MI:SS') AS \"datetime\" FROM peeps ORDER BY id DESC;")
    peep_list.map { |peep| Peep.new(id: peep['id'], text: peep['text'], date: peep['datetime']) }
  end

end