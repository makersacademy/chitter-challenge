require 'pg'

class Peeps

  attr_reader :id, :text

  def initialize(text:, id:)
    @id  = id
    @text = text
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peeps|
    Peeps.new(text: peeps['text'], id: peeps['id'] )
  end

  def self.delete(id:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end

end
end
