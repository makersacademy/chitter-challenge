require 'pg'

class Peep 

  attr_reader :id, :body, :posted_at

  def initialize(id, body, date)
    @id = id
    @body = body
    @posted_at = date
  end

  def self.all
    connection = select_database

    peeps = connection.exec("SELECT * FROM peeps ORDER BY id DESC")

    peeps.map do |peep|
      Peep.new(peep["id"], peep["body"], peep["posted_at"])
    end
  end

  def self.add(peep)
    connection = select_database

    result = connection.exec("INSERT INTO peeps (body) VALUES ('#{peep}') RETURNING id, body, posted_at;")
    Peep.new(result[0]["id"], result[0]["body"], result[0]["posted_at"])
  end

  def self.select_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end
