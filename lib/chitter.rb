require 'pg'

class Chitter_Peep

  attr_reader :body, :time, :name, :handle

  def initialize(body:, time:, name:, handle:)
    @body = body
    @time = time
    @name = name
    @handle = handle
  end 

  def self.view_all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Chitter_Peep.new(body: peep['body'], time: peep['time'], name: peep['name'], handle: peep['handle'])
    end 
  end 

  def self.post_peep(body:, name:, handle:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec("INSERT INTO peeps (body, time, name, handle) VALUES ('#{body}', '#{Time.now.round}', '#{name}', '#{handle}') RETURNING body, time, name, handle;")
    # p "-------result: #{result}"
    # Chitter_Peep.new(body: result[0]['body'])
    Chitter_Peep.new(body: result[0]['body'], time: result[0]['time'], name: result[0]['name'], handle: result[0]['handle'])
  end
end
