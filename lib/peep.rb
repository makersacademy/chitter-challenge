require 'pg'

class Peep
  attr_reader :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.all

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM feed;")

    result.map do |peep|
      Peep.new(peep['id'], peep['peep'])
    end
  end

  def self.create(content)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO feed (peep) values ('#{content}');")
  end

  # def self.connect_to_database
  #   ENV['RACK_ENV'] == 'test' ? (db = 'bookmark_manager_test') : (db = 'bookmark_manager')
  #   @connection = PG.connect(dbname: db)
  # end
end
