require 'PG'
require_relative 'db_connection'

class Peep
  attr_reader :content, :id

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.new_peep(content)
    results = DBConnection.query("insert into peep (content) values ('#{content}') returning id, content").first
    Peep.new(results['id'].to_i, results['content'])
  end

  def self.all
    results = DBConnection.query('select * from peep')
    results.map { |row| Peep.new(row['id'].to_i, row['content'])}
  end

end
