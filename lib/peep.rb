require 'pg'

class Peep

  attr_reader :content, :created_on

  def initialize(content, created_on = "")
    @content = content
    @created_on = created_on
  end

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT content, created_on
      FROM peeps ORDER BY created_on DESC;")
    result.map { |peep| Peep.new(peep['content'], peep['created_on']) }
  end

  def self.create_peep(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end
end
