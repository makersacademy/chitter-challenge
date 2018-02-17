require 'pg'
require 'net/http'

class Peep
  attr_reader :id, :message, :title
  def initialize(row)
    @id = row[0]
    @message = row[1]
    @title = row[2]
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM messages')
    @arr = []
    result.each_row { |row| @arr.push(Peep.new(row)) }
    @arr
  end
end
