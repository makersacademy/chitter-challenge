require 'pg'

class Chitter

  def self.all
    # [
    #   "I'm a Pull Stack Developer. I pull things off the internet and put it in my code.",
    #   "Debugging is like an onion. There are multiple layers to it, and the more you peel them back, the more likely you'll cry."
    # ]
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map {|peep| peep['peep']}
  end
end