require 'pg'

class Peep
  def self.all
    # [
    #   "Hello World!",
    #   "I am feeling sunny today!",
    #   "Minions will takeover the world."
    # ]
  connection = PG.connect(dbname: 'chitter')
  result = connection.exec("SELECT * FROM peeps;")
  result.map { |peep| peep['post'] }
  end
end
