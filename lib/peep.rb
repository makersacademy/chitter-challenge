require_relative 'db_connection'

class Peep
  
  attr_reader :id, :text, :timestamp

  def initialize(id, text, timestamp)
    @id = id
    @text = text
    @timestamp = timestamp
  end

  def self.all
    result = DbConnection.query('SELECT * FROM peeps;')
    peeps = []
    result.each do |peep|
      peeps << Peep.new(peep['id'], peep['text'], peep['created_at'])
    end
    peeps
  end

  def self.create
  end

  def self.delete
  end
  
  def self.update
  end

end