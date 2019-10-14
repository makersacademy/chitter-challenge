require 'pg'

class Peep

  attr_reader :text, :created_at

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    p result
    result.map do |peep|
      Peep.new(text: peep['text'], created_at: peep['created_at'])
    end
  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (text) VALUES('#{text}') RETURNING text, created_at")

    Peep.new(text: result[0]['text'], created_at: result[0]['created_at'])
  end

  def initialize(text:, created_at:)
    @text = text
    @created_at = created_at
  end
end
