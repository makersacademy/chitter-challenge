class Chitter

  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end

  def self.new_message(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    connection.exec("INSERT INTO messages (peep) VALUES('#{peep}')")
  end
end
