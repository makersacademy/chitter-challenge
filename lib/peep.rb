require 'pg'

class Peep
  attr_reader :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.all
    result = connection_to_database.exec("SELECT * FROM feed;")
    result.map do |peep|
      Peep.new(peep['id'], peep['peep'])
    end
  end

  def self.create(content)
    result = connection_to_database.exec("INSERT INTO feed (peep) VALUES ('#{content}') RETURNING id, peep;")
    Peep.new(result[0]['id'], result[0]['peep'])
  end

private

  def self.connection_to_database
    ENV['RACK_ENV'] == 'test' ? (db = 'chitter_test') : (db = 'chitter')
    PG.connect(dbname: db)
  end
end
