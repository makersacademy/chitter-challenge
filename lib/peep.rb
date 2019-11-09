require 'pg'

class Peep
attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.create(text:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end



end
