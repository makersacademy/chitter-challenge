require 'pg'

class Peep

  def add(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: )
  end

end
