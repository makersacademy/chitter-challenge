require "pg"

class Chitter

  attr_reader :peeps, :id, :text

  def self.list
    @peeps = Array.new
    if ENV['ENVIRONMENT'] == 'test'
      list_peeps = PG.connect( dbname: 'chitter_peeps_test')
    else
      list_peeps = PG.connect( dbname: 'chitter_peeps')
    end
    list_peeps.exec("SELECT * FROM peeps ORDER BY id DESC;").each do | peep |
      @peeps << Chitter.new(peep["id"], peep["text"])
    end
    @peeps
  end

  def self.post(text)
    if ENV['ENVIRONMENT'] == 'test'
      peeps = PG.connect( dbname: 'chitter_peeps_test')
    else
      peeps = PG.connect( dbname: 'chitter_peeps')
    end
    peeps.exec("INSERT INTO peeps (text) VALUES ('#{text}');")
  end

  def initialize(id, text)
    @id = id
    @text = text
  end

end
