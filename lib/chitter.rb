require 'pg'

class Chitter

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_challenge_test')
        else
          connection = PG.connect(dbname: 'chitter_challenge')
        end
    # ["Test Chitter Message", "Another test chitter", "yet another test chitter"]

result = connection.exec("SELECT id, peep, time FROM chitters ORDER BY id DESC")

result.map do |chitter|
  Chitter.new(id: chitter['id'], peep: chitter['peep'], time: chitter['time'])

end
end

def self.create(peep:)

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_challenge_test')
  else
    connection = PG.connect(dbname: 'chitter_challenge')
end

result = connection.exec("INSERT INTO chitters (peep) VALUES ('#{peep}')")

end
end
