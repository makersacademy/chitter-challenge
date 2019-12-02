require 'pg'
class Peep
  def self.all
    # [
    #   "hello message 1",
    #   "Here is message 2",
    #   "This is message 3"
    #  ]
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['msg'] }
  end
end
