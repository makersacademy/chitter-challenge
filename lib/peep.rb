require 'pg'

class Peep
  def self.create(content)
    connection = PG.connect(dbname: 'chitter_test')
    results = connection.exec("INSERT INTO peeps (content)
                              VALUES ('#{content}')
                              RETURNING id, content;")
    new(id: results[0]['id'], content: results[0]['content'])
  end

  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    results = connection.exec("SELECT * FROM peeps
                              ORDER BY id;")
    results.map do |result|
      new(id: result['id'], content: result['content'])
    end.reverse
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end
