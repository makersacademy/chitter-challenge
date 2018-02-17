require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :text, :date, :author


  def initialize(id, text, date, author)
    @id = id
    @text = text
    @date = date
    @author = author
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY date DESC')
    result.map { |hash| Peep.new(hash['id'], hash['text'], hash['date'], hash['author']) }
  end

end
