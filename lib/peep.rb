require 'pg'

class Peep

  attr_reader :id, :message, :time_posted

  def initialize(id: , message:, time_posted: )
    @id = id
    @message = message
    @time_posted = time_posted
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message, created_at;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], time_posted: result[0]['created_at'])

  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC")
    # id, message, to_char(created_at, 'MMDDYYYY HH24:MI:SS')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time_posted: peep['created_at'])
    end

  end

  
end