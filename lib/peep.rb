require 'pg'

class Peep
  attr_reader :id, :username, :peep, :created_at

  def initialize(id, username, peep, created_at)
    @id = id
    @username = username
    @peep = peep
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peepers")
    result.map { |post| Peep.new(post['id'], post['username'], post['peep']) }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("INSERT INTO peepers (username, peep) VALUES('#{options[:username]}', '#{options[:peep]}') RETURNING id, username, peep")
    Peep.new(result.first['id'], result.first['username'], result.first['peep'])
  end

  def ==(match)
    @id == match.id
  end
end
