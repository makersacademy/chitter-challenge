require 'pg'
require_relative 'database_connection'
require_relative 'user'

class Peep
  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id  = id
    @text = text
    @time = time
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps;')
    peeps.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])
    end
  end

  
  def self.create(text:, time:)
    result = DatabaseConnection.query("INSERT INTO peeps (text,time) VALUES('#{text}','#{time}') RETURNING id, text, time;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end
end
