require 'pg'

class Peep

  attr_reader :id, :message, :maker_id

  def initialize(id, message, maker_id)
    @id = id
    @message = message
    @maker_id = maker_id
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    table = conn.exec("SELECT * FROM peeps")
    table.map { |peep| Peep.new(peep['id'], peep['message'], peep['maker_id']) }
  end

end