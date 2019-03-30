require 'pg'

class Peep
  def self.create(content)
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("INSERT INTO peeps (content)
                              VALUES ('#{content}')
                              RETURNING id, content;")
    new(id: result[0]['id'], content: result[0]['content'])
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end
