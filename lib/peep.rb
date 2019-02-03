require 'pg'
class Peep

  attr_reader :id, :peep_content, :posted_at

  def initialize(id:, peep_content:, posted_at:)
    @id = id
    @peep_content = peep_content
    @posted_at = posted_at
  end


  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec( "SELECT id, peep_content, to_char(posted_at, 'HH24:MI:SS, DD/MM/YYYY') FROM peeps ORDER BY id DESC" )
    result.map do |peep|
      Peep.new(id: peep['id'], peep_content: peep['peep_content'], posted_at: peep['to_char'])
    end
  end

end
