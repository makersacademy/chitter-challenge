require 'pg'

class Peep
  attr_reader :content
  
  def initialize(content)
    @content = content
  end

  def self.create(content)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    result = connection.exec("INSERT INTO peeps (content) VALUES('#{content}') RETURNING content;")
    @peep = Peep.new(result[0]['content'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(peep['content'])
    end
  end
end