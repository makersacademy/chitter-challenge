require 'pg'
require 'time'

class Peep
  attr_reader :peep_id, :peep_text, :peeped_on

  def initialize(peep_id:, peep_text:, peeped_on:)
    @peep_id = peep_id
    @peep_text = peep_text
    @peeped_on = peeped_on
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps;')

    result.map do |peep| 
      Peep.new(peep_id: peep['peep_id'], peep_text: peep['peep_text'], peeped_on: peep['peeped_on'])
    end
  end

  def self.create(peep_text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep_text) VALUES('#{peep_text}') RETURNING peep_id, peep_text, peeped_on;")
    Peep.new(peep_id: result[0]['peep_id'], peep_text: result[0]['peep_text'], peeped_on: result[0]['peeped_on'])
  end

end
