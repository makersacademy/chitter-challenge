require 'pg'

class Peep
  # attr_reader :peep

  # def initialize(peep:)
  #   @peep = peep
  # end 

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("SELECT * FROM chitter_peeps;")
    result.map { |p| p ['peeps'] }
  end


 def self.create(peep:)

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end 

  connection.exec("INSERT INTO chitter_peeps (peeps) VALUES ('#{peep}')")
  end 
end 

