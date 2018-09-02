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
      Peep.new(peep['id'], peep['peep'])
    end
  end

  def self.create(content)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO feed (peep) values ('#{content}');")
  end

  # def connect_to_database

  # end
end
