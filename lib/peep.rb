require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :author, :handle, :content

  def initialize(author, handle, content)
    @author = author
    @handle = handle
    @content = content
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map{ |peep| Peep.new(peep['author'], peep['handle'], peep['content']) }
  end
end
