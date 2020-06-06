require 'pg'

class Chitter

  attr_reader :context

  def initialize(context)
    @context = context
  end

  def self.create(context)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("INSERT INTO peeps (context) VALUES ('#{context}');")
  end

  def self.view
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("SELECT * FROM peeps")
    result.map { |peep| Chitter.new(peep['context'])}
  end
end
