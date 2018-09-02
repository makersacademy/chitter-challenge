require 'pg'

class Peep
  attr_reader :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM feed;")
    result.map do |peep|
      Peep.new(peep['id'], peep['content'])
    end
  end

  def self.create(content)

  end

  # def connect_to_database

  # end
end
