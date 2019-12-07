require 'pg'
class Peep

  attr_reader :id, :message, :timestamp

  def initialize(id:, message:, timestamp:)
    @id = id
    @message = message
    @timestamp = DateTime.parse(timestamp).strftime("%a, %d %b %Y %I:%M %p")
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps ORDER BY timestamps DESC')

    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"], timestamp: peep["timestamps"])
    end

  end

  def self.create(message:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps(message) VALUES('#{message}') RETURNING id, message, timestamps;")

    Peep.new(id: result[0]["id"], message: result[0]["message"], timestamp: result[0]["timestamps"])

  end

end
