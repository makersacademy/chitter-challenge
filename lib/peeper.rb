require 'pg'

class Peeper

  attr_reader :text

  def initialize(text:)
    @text = text
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map { |item| Peeper.new(text: item['peep_text']) }
  end

  def self.post(new_peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep_text) VALUES ('#{new_peep}');")
  end

end
