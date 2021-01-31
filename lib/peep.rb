require 'PG'
require_relative 'db_connection'

class Peep
  attr_reader :content, :id

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.new_peep(content)
    database = ENV['Rack ENV'] == 'test' ? 'chitter_test' : 'chitter'
    connection = PG.connect(dbname: database)
    results = connection.exec("insert into peep (content) values ('#{content}') returning id, content").first
    Peep.new(results['id'].to_i, results['content'])
  end

  def self.all
    database = ENV['Rack ENV'] == 'test' ? 'chitter_test' : 'chitter'
    connection = PG.connect(dbname: database)
    results = connection.exec 'select * from peep'
    results.map { |row| Peep.new(row['id'].to_i, row['content'])}
  end

end
