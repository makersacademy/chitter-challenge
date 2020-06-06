require 'pg'

class Peep

  attr_reader :id, :peep, :peeped_at, :peeped_by

  def initialize(id:, peep:, peeped_at:, peeped_by:)
    @id = id
    @peep = peep
    @peeped_at = peeped_at
    @peeped_by = peeped_by
  end

  def self.post(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}')")
  end

end
