require './lib/database_connection'
require 'pg'

class Peep

  attr_reader :content

  def initialize(content:)
    @content = content
  end

  def self.all
    result = DatabaseConnection.query('select * from peeps')
    result.map { |peep| Peep.new(content: peep['content']) }
  end

  def self.create(content:)
    result = DatabaseConnection.query("insert into peeps (content) values ('#{content}') returning id, content, time;")
    Peep.new(content: result[0]['content'])
  end
end
