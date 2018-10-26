require 'pg'

class Message
  def initialize(body)
    @body = body
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['message']}
  end
end
