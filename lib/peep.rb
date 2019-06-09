require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :author, :handle, :content, :date, :time

  def initialize(author, handle, content, date, time)
    @author = author
    @handle = handle
    @content = content
    @date = date
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map{ |peep| Peep.new(peep['author'], peep['handle'], peep['content'], peep['date'], peep['time']) }
  end

  def self.create(author, handle, content)
    DatabaseConnection.query("INSERT INTO peeps(author, handle, content, date, time) 
                              VALUES('#{author}', '#{handle}', '#{content}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)")
  end
end