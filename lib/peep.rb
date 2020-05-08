require 'pg'

class Peep

  def self.all
    # ["Feeling those summer vibes today",
    #   "Got the frisbee out for the first time in months!",
    #   "Damn, it's suncream o'clock!"]

    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['text'] }
  end

end
