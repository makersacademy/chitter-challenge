require 'pg'

class Peep

  attr_reader :id, :author, :peeps

  def initialize(id:, author:, peeps:)
    @id = id
    @author = author
    @peeps = peeps
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], author: peep['author'], peeps: peep['peeps'])
    end
  end

  def self.create(peeps:, author:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (author, peeps) VALUES('#{author}', '#{peeps}') RETURNING id, peeps, author")
    Peep.new(id: result[0]['id'], author: result[0]['author'], peeps: result[0]['peeps'])
  end
end