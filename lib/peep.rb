require 'pg'

class Peep

  attr_reader :id, :content, :created_at

  def initialize(id, peep, timestamp)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def ==(peep)
    @id == peep.id
  end

  def self.create(create)
    sql_query = "INSERT INTO peeps (content) VALUES('#{create[:peep]}') \
    RETURNING id, content, created_at"
    result = database.exec(sql_query)
    Peep.new(result.first['id'], result.first['content'], \
      result.first['created_at'])
  end

  def self.all

    sql_query = "SELECT * FROM peeps"
    database.exec(sql_query).map { |peeps| Peep.new(peeps['id'],\
      peeps['content'], peeps['created_at']) 
    }

  end

  private_class_method

  def self.database
    ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'chitter_test') \
    : PG.connect(dbname: 'chitter')
  end

end 
