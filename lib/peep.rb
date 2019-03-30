require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['RACK_ENV'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    p result
    list = result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end
    list.reverse
  end
end