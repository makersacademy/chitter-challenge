require 'pg'

class Peep
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
      connection = PG.connect(dbname: 'peep_manager')
      result = connection.exec("select * from peeps")
      result.map{|message| Peep.new(id: message['id'], peep: message['peep'])}
  end

end
