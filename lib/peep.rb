require 'pg'

class Peep

  attr_reader :id, :peep_text

  def initialize(id:, peep_text:)
    @id = id
    @peep_text = peep_text
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect :dbname => 'chitter_test', :user => 'student'
    else
      PG.connect :dbname => 'chitter', :user => 'student'
    end
  end

  def self.add(peep_text:)
    con = connect_to_database
    result = con.exec("INSERT INTO peeps (peep_text)
      VALUES('#{peep_text}') RETURNING id, peep_text;")
    Peep.new(id: result[0]['id'], peep_text: result[0]['peep_text'])
  end

  def self.all
    con = connect_to_database
    rs = con.exec "SELECT * FROM peeps"
    rs.map do |peep|
      Peep.new(id: peep['id'], peep_text: peep['peep_text'])
    end
  end

end
