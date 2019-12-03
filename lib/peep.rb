require 'pg'
class Peep
  # attr_reader :peep
  # def initialize(peep)
  #   @peep = peep
  # end
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # [
    #   "hello message 1",
    #   "Here is message 2",
    #   "This is message 3"
    #  ]

    # connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['msg'] }
  end
end
