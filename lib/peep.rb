require 'PG'

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
    connection = PG.connect
    results = connection.exec 'select * from peeps'
  end

end
