require 'pg'

class Peep
  attr_reader :id, :peep, :created

  def initialize(id, peep, created)
    @id = id
    @peep = peep
    @created = created
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map { |peep| Peep.new(peep['id'], peep['peep'], peep['created']) }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{options[:peep]}') RETURNING id, peep, created")
    Peep.new(result.first['id'], result.first['peep'], result.first['created'])
  end

  def ==(other)
    @id == other.id
  end

end
